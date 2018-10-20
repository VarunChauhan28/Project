 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]--> 
  </head> 

<div class="col-md-12">
    <div class="panel panel-primary">
     <div class="panel panel-heading">
         View ReportDetail
         </div>
         <div class="panel panel-body">
        
<table class="table table-bordered display responsive" width="100%" cellpading="5" cellspacing="0" >
<tr>
   
    <th>CourseName</th>
    <th>Semester</th> 
    
    <th>StudentName</th>
    <th>ExaminationName</th> 
    <th>TotalMarks</th>
     <th>ObtainMarks</th>
     <th>Result</th>  
    
</tr>

<%
     Class.forName("com.mysql.jdbc.Driver");
     String studentroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
             
             String query="";
            String studentid = session.getAttribute("loginid").toString();
            
                 
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
              String queryq="Select distinct StudentName from addmarks  where CourseName='"+cname+"' and ExaminationName='"+ename+"' and Semester like '%"+sem+"%' and StudentName like '%"+student+"%' and Subject like '%"+sub+"%' ";
              Statement stq=conq.createStatement();
              stq.execute(queryq);
              ResultSet rsq=stq.getResultSet();
        
              while(rsq.next())
              {
              studentid=rsq.getString(1);
              String queryq1="Select sum(EnterTotalMarks) as totalmarks ,sum(EnterObtainMarks) as totalobtainmarks from addmarks  where CourseName='"+cname+"' and ExaminationName='"+ename+"'and StudentName='"+studentid+"'";
              Statement stq1=conq.createStatement();
              stq1.execute(queryq1);
              ResultSet rsq1=stq1.getResultSet();
              double tm=0;double om=0;
              double p=0;
              while(rsq1.next()){
                tm=rsq1.getDouble(1);
                om=rsq1.getDouble(2);
                p=(om/tm)*100;
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
              
       
         
  
              String querya="Select * from addstudent where id="+studentid;
              Statement sta=con.createStatement();
              sta.execute(querya);
              String studentname="";
              ResultSet rsa=sta.getResultSet();
              while(rsa.next()){
              studentname=rsa.getString(4);
              }    
              

%>
    <tr> 
    <td><% out.print(coursename); %></td>
    <td><% out.print(sem); %></td> 
   
    <td><% out.print(studentname); %></td>
    <td><% out.print(examination); %></td> 
    <td><% out.print(""+tm); %></td>
     <td><% out.print(""+om); %></td>
     <td> <% if(p<20){
                studendlessthan20++;
                out.println("below 20%");
                }
                else if(p>=20&&p<40){
                studendlessthan40++;
                out.println("between 20%-40%");
                }
                 else if(p>=40&&p<50){
                studendlessthan50++;
                out.println("between 40%-50%");
                }
                  else if(p>=50&&p<60){
                studendlessthan60++;
                out.println("between 50%-60%");
                }
                   else if(p>=60&&p<70){
                studendlessthan70++;
                out.println("between 60%-70%");
                }
                    else if(p>=70&&p<80){
                studendlessthan80++;
                out.println("between 70%-80%");
                }
                     else if(p>=80&&p<90){
                studendlessthan90++;
                out.println("between 80%-90%");
                }
               else if(p>90){
                above90++;
                out.println("above 90%");
                } %></td>  </tr>
              <%
              }
              %>
             
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