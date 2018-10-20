<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<% 
String id=request.getParameter("id");
 Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="update addsubject set status='0' where  id='"+id+"'";
               PreparedStatement ps=con.prepareStatement(query);
              ps.execute();

response.sendRedirect("ViewSubject.jsp");
%>