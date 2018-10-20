
<html>
<head>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Widgets</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skinscon
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]--> 
  <!DOCTYPEhtml>
<html>
<head>
    <title>Add Examination</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
     

  
  
    
     
     <script>
    function getXMLHTTP() { //fuction to return the xml http object
        var xmlhttp=false;
        try{
            xmlhttp=new XMLHttpRequest();
        }
        catch(e)    {
            try{
                xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e){
                try{
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1){
                    xmlhttp=false;
                }
            }
        }

        return xmlhttp;
    }

  function fetchSemester(courseid) {

        var strURL="fetchSemester.jsp?courseid="+courseid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                    
                     document.getElementById('sem').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    } 
    
     function fetchSubjectandstudentname() {
        var semestervalue=document.getElementById('sem').value;
          var coursevalue=document.getElementById('cname').value;
        var strURL="FetchSubjectAndStudent.jsp?courseid="+coursevalue+"&semesterid="+semestervalue;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('subjectstudent').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
    	
</script>
</head> 
    
    <body style="background-color:#d7ddea">
             <%@include file="Menu.jsp" %>
        <div class="maindiv">
            
    <div class="header">
        <h3>Report</h3>
        
            <script>
                 var a=[
    
        ];
                </script>
             <%   Class.forName("com.mysql.jdbc.Driver");
              String studentroleid = session.getAttribute("roleid").toString();
                String studentids = session.getAttribute("loginid").toString();
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
                if(studentroleid.equals("1"))
                     { String studentid=studentids;
                     
                      String cname=request.getParameter("cname").toString();
                       String sem=request.getParameter("sem").toString();
                        String ename=request.getParameter("ename").toString();
             String queryq1="Select * from addmarks  where  StudentName='"+studentid+"' and Semester='"+sem+"' and CourseName ='"+cname+"' and ExaminationName='"+ename+"'";
               Statement stq1=con.createStatement();
              
              stq1.execute(queryq1);
              ResultSet rsq1=stq1.getResultSet();
           int studendlessthan20=0,studendlessthan40=0,studendlessthan50=0,studendlessthan60=0,studendlessthan70=0,studendlessthan80=0,studendlessthan90=0,above90=0;
              while(rsq1.next()){
                  String totalmarks=rsq1.getString(7);
                   String obtainmarks=rsq1.getString(8);
                  double percentage= (Double.parseDouble(obtainmarks)/Double.parseDouble(totalmarks))*100;
                 
                  String subjectname="";
                  String subject= rsq1.getString(4);
                   String query="Select * from addsubject where id='"+subject+"'";
             
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
              {
               subjectname=rs.getString(4);   
              }
              
             %>
                  <script>
                      var b= new Array();
        b["y"]=parseFloat("<% out.print(percentage); %>");
         b["label"]="<% out.print(subjectname); %>";
        a.push(b);
        </script>
                  <%
       
              }
                     }
             %>
  <script type="text/javascript">
  window.onload = function () {
     
        
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
        text: "Examination details"
      },
      axisY: {
        title: "Marks obtail",
        maximum: 100
      },
      data: [
      {
        type: "bar",
        showInLegend: true,
        legendText: "Gold",
        color: "gold",
        dataPoints: a
      }
      
      ]
    });

chart.render();
}
</script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script></head>
        
      
        
         </div>
                    

  <div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
  </div>
</body>
</html>
