<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>View Course</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>View Course</h3>
        </div> 
            
      
<table border="1" width="100%" cellpading="10" cellspacing="0">
<tr>
    <th>id</th>
    <th>CourseName</th>
    <th>Semester</th>
    <th>Status</th>
    <th>Action</th>
      
</tr>
<%  
     Class.forName("com.mysql.jdbc.Driver");
String courseroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where status='1'";

             String courseid = session.getAttribute("loginid").toString();
             if(courseroleid.equals("3"))
             {
              query="Select * from addcourse where status='1'";
             }
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
              {%>
               <tr>
                   <td><% out.print(rs.getString(1)); %></td>
                      <td><% out.print(rs.getString(2)); %></td>
                         <td><% out.print(rs.getString(3)); %></td> 
                          <td><% out.print(rs.getString(4)); %></td> 
                          <td>
                               <%  if(courseroleid.equals("3"))
             { %>
                              <a href="AddCourse.jsp?id=<% out.print(rs.getString(1)); %>">Edit</a>
                       <a href="deletecourse.jsp?id1=<% out.print(rs.getString(1)); %>">Delete</a> 
                     <%}%>    </td>
                         
               </tr>
                 
             <% }
              
    %>
    

  
  </table>
    </div>
 </body>   
 </html>