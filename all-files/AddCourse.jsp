<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html>
<head>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    <title>Add Course</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
  <% 
        if(request.getParameter("submit")!=null)
         {
             String cname=request.getParameter("cname").toString();
             out.print(cname); 
             String semname=request.getParameter("semname").toString();
             out.print(semname);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
             String query="";
             if(request.getParameter("id")!="") {
                  String id=request.getParameter("id"); 
             
             query="update addcourse set CourseName='"+cname+"',Semester='"+semname+"',Status='1' where id='"+id+"'";    
             }
             else{
                     query="insert into addcourse(CourseName,Semester,Status)values('"+cname+"','"+semname+"','1')"; 
                     }
             PreparedStatement ps=con.prepareStatement(query);
              ps.execute(); 
              if(request.getParameter("id")!="") {
              response.sendRedirect("ViewCourse.jsp");
              }else{
              response.sendRedirect("AddCourse.jsp");
              }
         }
                
          
%>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3><%
          String coursename="";
          String semester="";
        if(request.getParameter("id")!=null) {
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where id='"+id+"' and status='1'";
             Statement st=con.createStatement();
              st.execute(query);
             ResultSet rs =st.getResultSet();
              while(rs.next()){
                  coursename=rs.getString(2); 
                  semester=rs.getString(3);
                          
                          }
            %>
         Update course
         <% } else{ %>
           Add course
         <% } %> </h3>
        </div>
<div id= "form1" method="post">
<form>
    <div class="textleft">
        <label>Course</label>
        
      <input type="hidden" name="id" id="id" value="<% if(request.getParameter("id")!=null) { out.print(request.getParameter("id"));} %>"/>  
   <input type="text"  id="cname" name="cname"class="formelement"value="<% out.print(coursename); %>" placeholder="CourseName">
    </div>
    <div class="textright">
         <label>Semester</label> 
                      
             <input type="text" name="semname"  id="semname"class="formelement"  placeholder="Semester"required >  
           <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">
    </div>
</form>    

 </div>
        
     </body>
</html>