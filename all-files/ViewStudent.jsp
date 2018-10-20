<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>View Student</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>View Student</h3>
        </div> 
            
      
<table border="1" width="100%" cellpading="10" cellspacing="0">
<tr>
    <th>id</th>
    <th>CourseName</th>
    <th>Semster</th>  
     <th>StudentName</th> 
    <th>RollNo</th>
    <th>Email</th> 
    <th>Phone</th> 
    <th>Birthday</th>
    <th>Status</th>
    <th>Section</th>
    <th>Action</th>
   
</tr>
<%  
     Class.forName("com.mysql.jdbc.Driver");
      String studentroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
            String query="";
            String studentid = session.getAttribute("loginid").toString();
             if(studentroleid.equals("1"))
             {
                
            query="Select * from addstudent where id='"+studentid+"' and status='1'";
             }
             if(studentroleid.equals(""))
             {
                  String courseid = session.getAttribute("courseid").toString();
                 String semesterid = session.getAttribute("semesterid").toString();
            query="Select * from addstudent where CourseName='"+courseid+"' and Semester='"+semesterid+"' and status='1'";
           
             }
            
            if(studentroleid.equals("3")||studentroleid.equals("2"))
             {
            query="Select * from addstudent where status='1'";
             }
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
              {%>
               <tr>
                   <td><% out.print(rs.getString(1)); %></td>
                       <td><% String courseid=rs.getString(2);
                       String queryc="Select * from addcourse where id="+courseid;
             Statement stc=con.createStatement();
              stc.execute(queryc);
              ResultSet rsc=stc.getResultSet();
              
              while(rsc.next())
              {
                  out.print(rsc.getString(2));
              }
                                 %></td>
                         
                       <td><% out.print(rs.getString(3)); %></td> 
                       <td><% out.print(rs.getString(4)); %></td>
                         
                           <td><% out.print(rs.getString(5)); %></td> 
                            <td><% out.print(rs.getString(6)); %></td> 
                             <td><% out.print(rs.getString(7)); %></td> 
                              <td><% out.print(rs.getString(8)); %></td> 
                               <td><% out.print(rs.getString(9)); %></td>
                                <td><% out.print(rs.getString(13)); %></td>
                               <td>
                                   <%  if(studentroleid.equals("3"))
             { %>
                              <a href="AddStudent.jsp?id=<% out.print(rs.getString(1)); %>">Edit</a>
                       <a href="deletestudent.jsp?id=<% out.print(rs.getString(1)); %>">Delete</a> 
                        <% } %> </td>
                               </tr>
                 
             <% }
              
    %>
    

  
  </table>
 </div>
</body>
</html>
    