<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

 <%
String studentroleid = session.getAttribute("roleid").toString();
 %>
 <% if(studentroleid.equals("1"))
                     { }else{ %>  
 <div class="textleft">
               <label>SubjectName</label>
<select name="sub" id="sub" class="formelement" onchange="fetchMarks(this.value)" > 
                 <option value="">Subject</option> 
<%  
    String courseid=request.getParameter("courseid");
    String semesterid=request.getParameter("semesterid");
     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from  addsubject where  CourseName='"+courseid+"' and Semster="+semesterid;
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
              {%>
                  
              <option value="<% out.print(rs.getString(1)); %>"><% out.print(rs.getString(4)); %></option>      
   <%
              }
%>
              
               
              
            
</select> 
 </div>



 <div class="textright" >
               <label>StudentName</label>
 <select name="std" id="std" class="formelement" > 
                 <option value="">Student</option> 
                 
<%
    
   String query1="Select * from  addstudent where CourseName='"+courseid+"' and Semester="+semesterid;
             Statement st1=con.createStatement();
              st1.execute(query1);
              ResultSet rs1=st1.getResultSet();
              int a1=0;
              while(rs1.next())
              {%>
                  
              <option value="<% out.print(rs1.getString(1)); %>"><% out.print(rs1.getString(4)+" - "+rs1.getString(5)); %></option>    
   <%
              }
%>
              
               
       
</select>
 </div>
<% } %>