<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPEhtml>
<html>
<head>
<meta charset="utf-8">
<title>login form</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
<body style="background-color:#d7ddea">
    <% 
        if(request.getParameter("login")!=null)
         {
             String slct=request.getParameter("slct").toString();
             
              String uname=request.getParameter("uname").toString();
        
             String pswd=request.getParameter("pswd").toString();
           
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
              
              String query1="";
              int roleid=0;
              int courseid=0;
              int semesterid=0;
               if(slct.equals("1"))
                 {
                 query1="select * from addstudent where UserName='"+uname+"' and Password='"+pswd+"'";
                  roleid = 1;
                 }
              if(slct.equals("2"))
                 {
                  query1="select * from addfaculty where  UserName='"+uname+"' and Password='"+pswd+"'";
                    roleid = 2;       
                
                 } 
              if(slct.equals("3"))
                 {
                 query1="select * from admin where username='"+uname+"' and password='"+pswd+"'";
                 roleid =  3;
                 }
              Statement stsm=con.createStatement();
              stsm.execute(query1);
              ResultSet rssm=stsm.getResultSet();
              int loginstatus=0;
              int loginid=0;
             
              while(rssm.next())
              {
               loginstatus=1;  
               loginid=rssm.getInt(1);
               if(roleid==2){
                   courseid =rssm.getInt(9);
                   semesterid =rssm.getInt(10);
                        
                  }
              }
              if(loginstatus==1){
                  session.setAttribute("loginid", loginid);
                  session.setAttribute("roleid", roleid);
                  if(roleid==2){
                        session.setAttribute("courseid", courseid);
                  session.setAttribute("semesterid", semesterid);
                  }
                      response.sendRedirect("Home.jsp");
                  
              }else{
              out.print("Wrong username password");
              }
         }    
%>        
<div class="header">
    <h3>Welcome To Result Analyser</h3>
</div>
<div class="loginBox">
<div class="user">
<h2>Log In Here</h2>
<form method="post">
<b>login Type</b><br>
 <div class="textleft">
<select name="slct" id="slct"class="formelement"required >  
<option  value="id">Login Type</option> 
<option value="1">Student</option>
<option value="2">faculty</option> 
<option value="3">Admin</option>
 </select>
    <br> 


 
<label><b>User Name</b></label>
<input type="text" name="uname" id="uname"class="formelement" placeholder="UserName"><br>

<label><b>Password</b></label>
<input type="password" name="pswd" id="pswd"class="formelement" placeholder="Password">
<br>
<div class="loginBotton">
 <input type="submit" name="login" id="login" value="login" class="button button-success"  onclick="submit">
</div>
</div>
</form>
    </div
    </div>
</body>
</html>