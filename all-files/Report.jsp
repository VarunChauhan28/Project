
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
        </div>
            
         <%   Class.forName("com.mysql.jdbc.Driver");
              String studentroleid = session.getAttribute("roleid").toString();
                String studentids = session.getAttribute("loginid").toString();
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
                 %>
                  <div id= "form1" method="post">
                     <% if(studentroleid.equals("1"))
                     { %> 
                      <form action="ReportStudent.jsp">
                    
                      <% }else{ %> 
                     <form >  
                <% } %>
                 <div class="textleft">
                     <label>Select Course</label>
             <select name="cname" id="cname" class="formelement"  onchange="fetchSemester(this.value)" required>
                 <option value="">CourseName </option> 
                 <%  
     Class.forName("com.mysql.jdbc.Driver");
            
   String query="Select * from addcourse where status='1'";
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;  
              while(  rs.next())
              { %>
               <option value="<% out.print(rs.getString(1)); %>"><% out.print(rs.getString(2)); %></option>  
              <% } %>
 
                 </select>
                     </div>
                    <div class="textright">
                    <label>Select Semester</label>
               <select name="sem" id="sem" class="formelement" onchange="fetchSubjectandstudentname(this.value)" > 
                   <option value="">Semester </option>  
                            
                </select><br> 
                    </div> 
              <% if(studentroleid.equals("1"))
                     { }else{ %>
                    <div id="subjectstudent">
                    <div class="textleft">
                        <label>SubjectName</label>
               <select name="sub" id="sub" class="formelement" > 
                   <option value="">Subject </option> 
                    </select>
                        </div>
                        
                        
                        
                   <div class="textright">
                        <label>StudentName</label>
               <select name="std" id="std" class="formelement" > 
                   <option value="">Student/Optional</option> 
                  </select> 
                        </div>
                   <% } %>
                   </div>
                <div class="textleft">
                        <label>Select Examination</label>
               <select name="ename" id="ename" class="formelement" required> 
                   <option value="">Examination</option> 
                   
                    <%  
     Class.forName("com.mysql.jdbc.Driver");
         
   String query1="Select * from addexamination where status='1'";
             Statement st1=con.createStatement();
              st1.execute(query1);
              ResultSet rs1=st1.getResultSet();
              int a1=0;
              while(rs1.next())
              {%>
              <option value="<% out.print(rs1.getString(1)); %>"><% out.print(rs1.getString(2)); %></option>  
              <% } %>
  
                   </select>
          </div><br>
                <div class="clearfix"></div>
                    <div class="col-md-6" style="text-align:center"> 
                     <input type="submit" name="submit" id="submit" value="Search" class="btn btn-danger"/>   
            </div>
               </form>
       
    </div>
         </div>
                 <%
                if(studentroleid.equals("1"))
                     { String studentid=studentids;
             String queryq1="Select sum(EnterTotalMarks) as totalmarks ,sum(EnterObtainMarks) as totalobtainmarks from addmarks  where  StudentName='"+studentid+"'";
               Statement stq1=con.createStatement();
              
              stq1.execute(queryq1);
              ResultSet rsq1=stq1.getResultSet();
           int studendlessthan20=0,studendlessthan40=0,studendlessthan50=0,studendlessthan60=0,studendlessthan70=0,studendlessthan80=0,studendlessthan90=0,above90=0;
             while(rsq1.next()){
              double tm=rsq1.getDouble(1);
                double om=rsq1.getDouble(2);
                double p=(om/tm)*100;
                out.print(p);
                if(p<=20){
                studendlessthan20++;
                }
                if(p>=40&&p<=50)
                {
                studendlessthan50++;
                }
                 if(p>=50&&p<=60)
                {
                studendlessthan60++;
                }
                  if(p>=60&&p<=70)
                {
                studendlessthan70++;
                }
                  if(p>=70&&p<=80)
                {
                studendlessthan80++;
                }
                  if(p>=80&&p<=90)
                {
                studendlessthan90++;
                }
                
                else if(p>90){
                above90++;
                }
              }
              %>
                
           <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
        text: "Olympic Medals of all Times (till 2012 Olympics)"
      },
      axisY: {
        title: "Medals won",
        maximum: 110
      },
      data: [
      {
        type: "bar",
        showInLegend: true,
        legendText: "Gold",
        color: "gold",
        dataPoints: [
        { y: 198, label: "Italy"},
        { y: 201, label: "China"},
        { y: 202, label: "France"},
        { y: 236, label: "Great Britain"},
        { y: 395, label: "Soviet Union"},
        { y: 957, label: "USA"}
        ]
      },
      {
        type: "bar",
        showInLegend: true,
        legendText: "Silver",
        color: "silver",
        dataPoints: [
        { y: 166, label: "Italy"},
        { y: 144, label: "China"},
        { y: 223, label: "France"},
        { y: 272, label: "Great Britain"},
        { y: 319, label: "Soviet Union"},
        { y: 759, label: "USA"}
        ]
      },
      {
        type: "bar",
        showInLegend: true,
        legendText: "Bronze",
        color: "#DCA978",
        dataPoints: [
        { y: 185, label: "Italy"},
        { y: 128, label: "China"},
        { y: 246, label: "France"},
        { y: 272, label: "Great Britain"},
        { y: 296, label: "Soviet Union"},
        { y: 666, label: "USA"}
        ]
      }
      ]
    });

chart.render();
}
</script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
             <%
             }
             else{ %>
            
    
              <script src="canvasjs.min.js"></script>    
            <% 
        if(request.getParameter("submit")!=null)
         {
             int studendlessthan20=0,studendlessthan40=0, studendlessthan50=0, studendlessthan60=0,studendlessthan70=0,studendlessthan80=0,studendlessthan90=0,above90=0;
            
             String cname=request.getParameter("cname").toString();
            String queryex="Select * from addcourse where id="+cname;
             Statement stex=con.createStatement();
              stex.execute(queryex);
              String coursename="";
              ResultSet rsex=stex.getResultSet();
              while(rsex.next()){
              coursename=rsex.getString(2);
              }
              
             String sem=request.getParameter("sem").toString();
            
            
           
              String sub=request.getParameter("sub").toString();
              
               String student=request.getParameter("std").toString();
           
              String ename=request.getParameter("ename").toString();
              String queryexe="Select * from addexamination where id="+ename;
             Statement stexe=con.createStatement();
              stexe.execute(queryexe);
              String examination="";
              ResultSet rsexee=stexe.getResultSet();
              while(rsexee.next()){
              examination=rsexee.getString(2);
              }
              
              Class.forName("com.mysql.jdbc.Driver");
             Connection conq=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
              String queryq="Select distinct StudentName from addmarks  where CourseName='"+cname+"' and ExaminationName='"+ename+"' and Semester like '"+sem+"%' and StudentName like '"+student+"%' and Subject like '"+sub+"%' ";
               Statement stq=conq.createStatement();
              stq.execute(queryq);
              ResultSet rsq=stq.getResultSet();
        
              while(rsq.next())
              {
                  String studentid=rsq.getString(1);
             String queryq1="Select sum(EnterTotalMarks) as totalmarks ,sum(EnterObtainMarks) as totalobtainmarks from addmarks  where CourseName='"+cname+"' and ExaminationName='"+ename+"'and StudentName='"+studentid+"'";
               Statement stq1=conq.createStatement();
               
              stq1.execute(queryq1);
              ResultSet rsq1=stq1.getResultSet();
        
              while(rsq1.next()){
              double tm=rsq1.getDouble(1);
                double om=rsq1.getDouble(2);
                double p=(om/tm)*100;
                out.print(p);
                if(p<=20){
                studendlessthan20++;
                }
                if(p>=40&&p<50)
                {
                studendlessthan50++;
                }
                 if(p>=50&&p<60)
                {
                studendlessthan60++;
                }
                  if(p>=60&&p<70)
                {
                studendlessthan70++;
                }
                  if(p>=70&&p<80)
                {
                studendlessthan80++;
                }
                  if(p>=80&&p<90)
                {
                studendlessthan90++;
                }
                
                else if(p>90){
                above90++;
                }
              }
              }
          out.print(studendlessthan60);
         
%>   
       <script type="text/javascript">
window.onload = function () {
    alert('s');
	var chart = new CanvasJS.Chart("chartContainer",
	{
		theme: "theme2",
		title:{
			text: "Result analysys based on search data<% out.print("Course="+coursename+"Semester= "+sem+"Examination= "+examination);%>"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y}",
			
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: <% out.print(above90);%>, indexLabel: "Above 90" },
				{  y: <% out.print(studendlessthan90);%>, indexLabel: "80 to 90" },
                                {  y: <% out.print(studendlessthan80);%>, indexLabel: "70 to 80" },
                                 {  y: <% out.print(studendlessthan70);%>, indexLabel: "60 to 70" },
                                 {  y: <% out.print(studendlessthan60);%>, indexLabel: "50 to 60" },
                                  {  y: <% out.print(studendlessthan50);%>, indexLabel: "40 to 50" },
                                   {  y: <% out.print(studendlessthan40);%>, indexLabel: "20 to 40" },
				    {  y: <% out.print(studendlessthan20);%>, indexLabel: "Below 20%" }
			
			]
		}
		]
	});
	chart.render();
 };
chart.onclick = function(evt){
   alert('d');
    // => activePoints is an array of points on the canvas that are at the same position as the click event.
};
$("#chartContainer").click( 
    function(evt){
        var activePoints = myNewChart.getSegmentsAtEvent(evt);           
        /* do something */
        
    }
);  
	</script>
        
	    
        <div class="clearfix"></div>
        <a href="Reportdetail.jsp?cname=<% out.print(cname);%>&ename=<% out.print(ename);%>&sub=<% out.print(sub);%>&student=<% out.print(student);%>&sem=<%out.print(sem);%>"</a>
        <div class="col-md-12">
            
                 <div id="chartContainer" style="height: 400px; width: 100%;"></div>
        </div>
        
       <% }} %>
       
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>