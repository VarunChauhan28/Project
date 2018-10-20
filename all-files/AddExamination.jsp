
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPEhtml>
<html>
<head>
    <title>Add Examination</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
 <% 
       
        if(request.getParameter("submit")!=null)
         {
             String exname=request.getParameter("exname").toString();
             out.print(exname);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
              out.print("button checked");
             String query="";
             if(request.getParameter("id")!="") {
                  String id=request.getParameter("id");
               query="update  addexamination set ExaminationName='"+exname+"',status='1' where id='"+id+"'"; 
             }else{
              query="insert into addexamination(ExaminationName,Status)values('"+exname+"','1')"; 
           
             }
              PreparedStatement ps=con.prepareStatement(query);
              ps.execute();
              if(request.getParameter("id")!="") {
              response.sendRedirect("ViewExamination.jsp");
              }else{
              response.sendRedirect("AddExamination.jsp");
              }
         }
         
%>


    <body style="background-color:#d7ddea">
              <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
        <h3>   <%
       
        String examname="";
        if(request.getParameter("id")!=null) {
            String id=request.getParameter("id");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addexamination where id='"+id+"' and status='1'";
             Statement st=con.createStatement();
              st.execute(query);
             ResultSet rs =st.getResultSet();
              while(rs.next()){
                  examname=rs.getString(2);
                          
                          }
            %>
         Update Examination
         <% }else{ %>
           Add Examination
         <% } %>     
        </h3>
        </div>
         
<div id= "form1" method="post">
<form>
    <div class="textleft">
        <input type="hidden" name="id" id="id" value="<% if(request.getParameter("id")!=null) { out.print(request.getParameter("id"));} %>"/>
   <input type="text" id="exname" class="formelement" name="exname"value="<% out.print(examname); %>" placeholder="ExaminationName">
    </div>
    <div class="textright">
        <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">
    </div>
    
   
    
</form>    

 </div>
  </div>      
     </body>
</html>
    