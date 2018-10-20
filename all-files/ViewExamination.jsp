<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>View Examination</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
    <body style="background-color:#d7ddea">
        <%@include file="Menu.jsp" %> 
        <div class="maindiv">
    <div class="header">
       <h3>View Examination</h3>
        </div> 
            
      
<table border="1" width="100%" cellpading="10" cellspacing="0">
<tr>
    <th>id</th>
    <th>ExaminationName</th>
    <th>Status</th> 
    <th>Action</th>
      
</tr>

<%  
     Class.forName("com.mysql.jdbc.Driver");
        String examinationroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addexamination where status='1'";
             String examinationid = session.getAttribute("loginid").toString();
             if(examinationroleid.equals("3"))
             {
              query="Select * from addexamination where status='1'";
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
                         <td><% out.print(rs.getString(3));%></td>
                         <td>
                             <%  if(examinationroleid.equals("3"))
             { %>
                             <a href="AddExamination.jsp?id=<%out.print(rs.getString(1)); %>">Edit</a>
                       <a href="deleteexamination.jsp?id=<%out.print(rs.getString(1)); %>">Delete</a> 
                       <%}%>  </td>
                         
               </tr>
                 
             <% }
              
    %>

    
    </table>
    </div>
    </body>
    </html>