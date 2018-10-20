<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>View Marks</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
    <body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>View Marks</h3>
        </div> 
            
      
<table border="1" width="100%" cellpading="10" cellspacing="0">
<tr>
    <th>id</th>
    <th>CourseName</th>
    <th>Semester</th> 
    <th>Subject</th>
    <th>StudentName</th>
    <th>ExaminationName</th> 
    <th>TotalMarks</th>
     <th>ObtainMarks</th>
     <th>Remarks</th>
     <th>Section</th>
     <th>Action</th>
    
  
</tr>
<%  
     Class.forName("com.mysql.jdbc.Driver");
      String marksroleid = session.getAttribute("roleid").toString();
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="";
    String marksid = session.getAttribute("loginid").toString();
    if(marksroleid.equals("1"))
             { 
                 
            query="Select * from addmarks where id='"+marksid+"' and status='1'";
             }
             if(marksroleid.equals(""))
             {
                  String courseid = session.getAttribute("courseid").toString();
                 String semesterid = session.getAttribute("semesterid").toString();
            query="Select * from addmarks  where CourseName='"+courseid+"' and Semester='"+semesterid+"' and status='1'";
             }
            if(marksroleid.equals("3")||marksroleid.equals("2"))
             {
            query="Select * from addmarks  where status ='1' ";
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
                          <td><% String subjectid=rs.getString(4); 
                           String querys="Select * from addsubject where id='"+subjectid+"'";
             Statement sts=con.createStatement();
              sts.execute(querys);
              ResultSet rss=sts.getResultSet();
              
              while(rss.next())
              {
                  out.print(rss.getString(4));
              }
                     %></td> 
               <td><% String studentid=rs.getString (5);
                String querystd="Select * from addstudent where id='"+studentid+"'";
             Statement ststd=con.createStatement();
              ststd.execute(querystd);
              ResultSet rsstd=ststd.getResultSet();
              
              while(rsstd.next())
              {   
                  out.print(rsstd.getString(4));
              }
                              
                              %></td>
                <td><% String examinationid=rs.getString(6);
                 String queryex="Select * from addexamination where id='"+examinationid+"'";
             Statement stex=con.createStatement();
              stex.execute(queryex);
              ResultSet rsex=stex.getResultSet();
              
              while(rsex.next())
              {
                  out.print(rsex.getString(2));
              }
                                
                                %></td> 
                                   <td><% out.print(rs.getString(7)); %></td>
                                            <td><% out.print(rs.getString(8)); %></td> 
                                                     <td><%out.print(rs.getString(9)); %></td> 
                                                      <td><% out.print(rs.getString(10)); %></td>
                                                      <td><% out.print(rs.getString(11)); %></td>
                                                       <td> 
                                                            <%  if(marksroleid.equals("3"))
             { %>
                             <a href="AddMarks.jsp?id=<% out.print(rs.getString(1)); %>">Edit</a>
                       <a href="deletemarks.jsp?id=<% out.print(rs.getString(1)); %>">Delete</a> 
                          <%}%> 
                                                       </td> 
                          </tr>
               
             <% }
              
    %>
    

  
  </table>
    </div>
    </body>
    </html>