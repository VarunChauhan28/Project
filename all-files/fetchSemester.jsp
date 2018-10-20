<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<select name="sem" id="sem" class="form-control" required> 
                   <option value="">Semester </option> 
<%  
    String courseid=request.getParameter("courseid");
     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where id="+courseid;
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
              {
                  a=rs.getInt(3);

              }
for(int i=1;i<=a;i++){
%>
              
           <option value="<% out.print(i); %>"><% out.print(i); %></option>      
              
             <%  } %>
 </select>