<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
String id1=request.getParameter("id1");
 Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="update addcourse set status='0' where  id='"+id1+"'";
               PreparedStatement ps=con.prepareStatement(query);
              ps.execute();

response.sendRedirect("ViewCourse.jsp");
%>