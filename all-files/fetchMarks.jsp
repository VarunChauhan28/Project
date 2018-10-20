 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%  
    String subjectid=request.getParameter("subjectid");

     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from  addsubject where  id='"+subjectid+"'";
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              String a="";
              while(rs.next())
              {
                  
              a=rs.getString(5);    
  
              }
%>
 <div class="textright">
     <label>TotalMarks <label>
<input type="text" value="<%out.print(a);%>"name="tmarks" id="tmarks"class="formelement" placeholder="TotalMarks" readonly required>    
     </div>        