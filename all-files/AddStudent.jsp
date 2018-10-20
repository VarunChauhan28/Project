
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPEhtml>
<html>
<head>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    <title> Add Student</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
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
	</script>

</head>
 <% 
        if(request.getParameter("submit")!=null)
         {
             String cname=request.getParameter("cname").toString();
             out.print(cname);
              String sem=request.getParameter("sem").toString();
             out.print(sem);
              String sec=request.getParameter("sec").toString();
              String sname=request.getParameter("sname").toString();
             out.print(sname);
              String rnum=request.getParameter("rnum").toString();
             out.print(rnum); 
             String email=request.getParameter("email").toString();
             out.print(email);
             String phone=request.getParameter("phone").toString();
             out.print(phone);
             String dob=request.getParameter("dob").toString();
             out.print(dob);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
             out.print("button checked");
             String query="";
             if(request.getParameter("id")!="") {
                  String id=request.getParameter("id"); 
             
             query="update addstudent set CourseName='"+cname+"',Semester='"+sem+"',StudentName='"+sname+"',RollNumber='"+rnum+"',Email='"+email+"',Phone='"+phone+"',Birthday='"+dob+"',Status='1',UserName='"+email+"',Password='"+phone+"',Section='"+sec+"',Role='1' where id='"+id+"'";    
             }
             else{
                     query="insert into addstudent(CourseName,Semester,StudentName,RollNumber,Email,Phone,Birthday,Status,UserName,Password,Section,Role)values('"+cname+"','"+sem+"','"+sname+"','"+rnum+"','"+email+"','"+phone+"','"+dob+"','1','"+email+"','"+phone+"','"+sec+"','1')"; 
                     }
             PreparedStatement ps=con.prepareStatement(query);
              ps.execute();
              if(request.getParameter("id")!=""){
              response.sendRedirect("ViewStudent.jsp");
              }else{
              response.sendRedirect("AddStudent.jsp");
              }
         }
         
%>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>       <%
          String coursename=""; 
          String semester="";
          String student="";
          String rollnumber=""; 
           String email=""; 
            String phone=""; 
             String birthday="";
        if(request.getParameter("id")!=null) {
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addstudent where id='"+id+"' and status='1'";
             Statement st=con.createStatement();
              st.execute(query);
             ResultSet rs =st.getResultSet();
              while(rs.next()){
                  coursename=rs.getString(2); 
                  semester=rs.getString(3);
                  student=rs.getString(4); 
                   rollnumber=rs.getString(5);
                    email=rs.getString(6);
                     phone=rs.getString(7);
                     
                }
        
              %>
               Update student
         <% } else{ %>
           Add student
         <% } %></h3>
        </div>
<div id= "form1" method="post">
<form>
       <div class="textleft">
      
              
                       <label>Course Name</label>
                     <select name="cname" id="cname"class="formelement"onchange="fetchSemester(this.value)"  required >   
                     <option value="">CourseName </option>
                      <%  
     Class.forName("com.mysql.jdbc.Driver");
             Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query1="Select * from addcourse where status='1'";
             Statement st1=con1.createStatement();
              st1.execute(query1);
              ResultSet rs1=st1.getResultSet();
              int a=0;  
              while(  rs1.next())
              { 
                if(rs1.getString(1).toString().equals(coursename)){
                %>
                 <option value="<% out.print(rs1.getString(1)); %>" selected="selected"><% out.print(rs1.getString(2)); %></option>  
             <% } else{ %>
               <option value="<% out.print(rs1.getString(1)); %>"><% out.print(rs1.getString(2)); %></option>  
         
               <% }} %>
                     </select>
        </div>
    <div class="textright">
                     <label>Semester</label>
                 <select name="sem" id="sem"class="formelement" required>
                 <option value="">Semester </option> 
                 <%  
    String courseid=request.getParameter("courseid");
     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where id="+courseid;
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a1=0;
              while(rs.next())
              {
                  a1=rs.getInt(3);

              }
for(int i=1;i<=a1;i++){
%>
              
           <option value="<% out.print(i); %>"><% out.print(i); %></option>      
              
             <%  } %>
                 </select> 
                 </div>
                 <div class="textright">
                 <label>Section</label>
                     <select name="sec" id="sec"class="formelement" required >   
                     <option value="id">Section</option> 
                     <option value="1">A</option>
                     <option value="2">B</option> 
                     <option value="3">C</option>
                  </select>
                 </div>
                  
                 
    <div class="textleft">
              <label>StudentName</label>
                 <input type="hidden" name="id" id="id" value="<% if(request.getParameter("id")!=null) { out.print(request.getParameter("id"));} %>"/>
                <input type="text"name="sname" id="sname"class="formelement" value="<% out.print(student ); %>" placeholder="StudentName" required> 
                </div>
     <div class="textright">
                    <label>Roll Number</label> 
                
             <input type="text"name="rnum"id="rnum"class="formelement"value="<% out.print(rollnumber ); %>"  placeholder="RollNumber" required>    
               
           </div>
                  
 <div class="textleft">
                <label>Email</label> 
                
             <input type="text"  name="email" id="email"class="formelement"value="<% out.print(email ); %>"  placeholder="Email" required >    
            </div>
              <div class="textright">
                   <label>Contact Number</label> 
                 
              <input type="text" name="phone" id="phone"class="formelement" value="<% out.print(phone ); %>" placeholder="Phone" required >    
              </div>
                         <div class="textleft">
                  
                    
                  <label>D.O.B</label> 
                     <div class="input-group date">
                  <div class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                  </div>
               
                
              <input type="text" class="formelement"  name="dob"  value="<% out.print(birthday ); %>" id="dob" placeholder="Birthday" required > 
                </div>
                
                 <div class="textright">
                   <label>Id</label> 
                 
              <input type="hidden" name="id" id="id" class="formelement" placeholder="Id" required >    
              </div>
                
                
          <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">
  
               
   
   </div>
 </form>
    </div>      
        
             
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#dob').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });   
    
    
 </script>
     </body>
</html>