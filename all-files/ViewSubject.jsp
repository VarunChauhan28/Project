<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>View Subject</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>View Subject</h3>
        </div> 
            
      
<table border="1" width="100%" cellpading="10" cellspacing="0">
<tr>
    <th>id</th>
    <th>CourseName</th>
    <th>Semster</th> 
    <th>Subject</th>
    <th>EnterTotalMarks</th>
    <th>Status</> 
    <th>Action</th>
</tr>
<%  
     Class.forName("com.mysql.jdbc.Driver");
 String subjectroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
 

               String query="Select * from addsubject where status='1'";
             String subjectid = session.getAttribute("loginid").toString();
             
             if(subjectroleid.equals("2"))
             {
                  String courseid = session.getAttribute("courseid").toString();
                 String semesterid = session.getAttribute("semesterid").toString();
            query="Select * from addsubject where CourseName='"+courseid+"' and Semster='"+semesterid+"' and status='1'";
             }
            if(subjectroleid.equals("3"))
             {
            query="Select * from addsubject where status='1'";
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
                            <td> 
                                <%  if(subjectroleid .equals("3"))
             { %>
                         <a href="AddSubject.jsp?id=<% out.print(rs.getString(1)); %>">Edit</a>
                   
                       <a href="deletesubject.jsp?id=<% out.print(rs.getString(1)); %>">Delete</a> 
                     <% } %>     </td>
                         
               </tr>
                 
             <% }
              
    %>
    

  
  </table>
    </div>
    </body>
    </html>
 