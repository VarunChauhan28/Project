<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
     <title>Add Marks</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
<script>
    function getXMLHTTP() { //fuction to return the xml http object
        var xmlhttp=false;
        try{
            xmlhttp=new XMLHttpRequest();
        }
        catch(e)    {
            try{
                xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e){
                try{
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1){
                    xmlhttp=false;
                }
            }
        }

        return xmlhttp;
    }

  function fetchSemester(courseid) {

        var strURL="fetchSemester.jsp?courseid="+courseid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('sem').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	  

    function fetchSubjectandstudentname() {
        var semestervalue=document.getElementById('sem').value;
          var coursevalue=document.getElementById('cname').value;
        var strURL="FetchSubjectAndStudent.jsp?courseid="+coursevalue+"&semesterid="+semestervalue;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('subjectstudent').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
    
   function fetchMarks(subjectid) {

        var strURL="fetchMarks.jsp?subjectid="+subjectid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                        
                     document.getElementById('tmarksdiv').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
 
    
</script>	  
</head>
<% 
        if(request.getParameter("submit")!=null)
         {
             String cname=request.getParameter("cname").toString();
            
              String sem=request.getParameter("sem").toString();
              
               String sec=request.getParameter("sec").toString();
            
              String std=request.getParameter("std").toString();
             
              String sub=request.getParameter("sub").toString();
             
             String ename=request.getParameter("ename").toString();
            
             String tmarks=request.getParameter("tmarks").toString();
           
             String omarks=request.getParameter("omarks").toString();
            
             String rmarks=request.getParameter("rmarks").toString();
          
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
           String query="";
           
             if(!request.getParameter("id").equals("")) {
                  String id=request.getParameter("id");
             
                 query="update addmarks set CourseName='"+cname+"',Semester='"+sem+"',Subject='"+sub+"',StudentName='"+std+"',ExaminationName='"+ename+"',EnterTotalMarks='"+tmarks+"',EnterObtainMarks='"+omarks+"',Remarks='"+rmarks+"',Section='"+sec+"',Status='1'  where id='"+id+"'";    
                 }
             else{
                   query="insert into addmarks(CourseName,Semester,Subject,StudentName,ExaminationName,EnterTotalMarks,EnterObtainMarks,Remarks,Section,Status)values('"+cname+"','"+sem+"','"+sub+"','"+std+"','"+ename+"','"+tmarks+"','"+omarks+"','"+rmarks+"','"+sec+"','1')"; 
                     }
            
             PreparedStatement ps=con.prepareStatement(query);
              ps.execute();
             if(!request.getParameter("id").equals("")){
             response.sendRedirect("ViewMarks.jsp");
              }else{
              response.sendRedirect("AddMarks.jsp");
              }
         }

         
%>
<body style="background-color:#d7ddea">
     <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3> <%
          String coursename=""; 
          String semester="";
          String subject="";
          String studentname=""; 
           String enterexamination=""; 
            String totalmarks=""; 
             String obtainmarks=""; 
             String remarks="";
        if(request.getParameter("id")!=null) {
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addmarks where id='"+id+"' and status='1'";
             Statement st=con.createStatement();
              st.execute(query);
             ResultSet rs =st.getResultSet();
              while(rs.next()){
                  coursename=rs.getString(2); 
                  semester=rs.getString(3);
                  subject=rs.getString(4); 
                   studentname=rs.getString(5);
                    enterexamination=rs.getString(6);
                     totalmarks=rs.getString(7);
                      obtainmarks=rs.getString(8); 
                    remarks=rs.getString(9);
                      
                }
              %>
         Update Marks
         <% } else{ %>
           Add Marks
         <% } %>
</h3>
        </div>
 
<div id= "form1" >
<form method="get">
    <div class="textleft">
   <label>CourseName</label> 
  
     <select name="cname" id="cname"class="formelement"  onchange="fetchSemester(this.value)" required>  
      <option value="">CourseName </option> 
       <%  
     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where status='1'";
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a=0;
               while(  rs.next())
              { 
                if(rs.getString(1).toString().equals(coursename)){
                %>
                <option value="<% out.print(rs.getString(1)); %>" selected="selected"><% out.print(rs.getString(2)); %></option>  
             <% } else{ %>
               <option value="<% out.print(rs.getString(1)); %>"><% out.print(rs.getString(2)); %></option>  
         
               <% }} %>
       </select>
     </div>
    <div class="textright">
        <label>Semester</label>
               <select name="sem" id="sem" class="formelement" onChange="fetchSubjectandstudentname(this.value)" required> 
                 <option value="">Semester </option> 
                  <%  
              if(!coursename.equals("")){
    String courseid=coursename;
     Class.forName("com.mysql.jdbc.Driver");
            String querys="Select * from addcourse where id="+courseid;
             Statement sts=con.createStatement();
              sts.execute(querys);
              ResultSet rss=sts.getResultSet();
              int as=0;
              while(rss.next())
              {
                  as=rss.getInt(3);

              }
for(int i=1;i<=as;i++){
    if(i==Integer.parseInt(semester)){
%> 
<option value="<% out.print(i); %>" selected="selected"><% out.print(i); %></option>      
              <% }else{ %>
               <option value="<% out.print(i); %>"><% out.print(i); %></option>     
             <%  }}} %>          
                
             </select>
        </div>
            <div class="textleft">
                 <label>Section</label>
                     <select name="sec" id="sec" class="formelement" required >   
                     <option value="id">Section</option> 
                     <option value="1">A</option>
                     <option value="2">B</option> 
                     <option value="3">C</option>
                  </select>
                 </div> 
             
      <div id="subjectstudent">
     <div class="textright">  
               <label>SubjectName</label>
               <select name="sub" id="sub" class="formelement"  onchange="fetchMarks(this.value)" required> 
                 <option value="">Subject</option> 
                 
                 <%  
              if(!coursename.equals("")){
    String courseid=coursename; 
    String semesterid=semester;
     Class.forName("com.mysql.jdbc.Driver");
            String querys="Select * from  addsubject where  id='"+courseid+"' and id="+semesterid;
             Statement sts=con.createStatement();
              sts.execute(querys);
              ResultSet rss=sts.getResultSet();
              int as=0;
              while(rss.next())
              {
                  as=rss.getInt(4);

              }
for(int i=1;i<=as;i++){
    if(i==Integer.parseInt(studentname)){
%> 
<option value="<% out.print(i); %>" selected="selected"><% out.print(i); %></option>      
              <% }else{ %>
               <option value="<% out.print(i); %>"><% out.print(i); %></option>     
             <%  }}} %>
                 
                 
                 
               </select>
        </div>
             
    
    <div class="textleft">
            <Label>StudentName</label>
    
               <select name="std" id="std"class="formelement"  required>  
                 <option value="">Student</option>
                    <%  
              if(!coursename.equals("")){
    String courseid=coursename; 
    String semesterid=semester;
     Class.forName("com.mysql.jdbc.Driver");
            String querys="Select * from  addstudent where  id='"+courseid+"' and id="+semesterid;
             Statement sts=con.createStatement();
              sts.execute(querys);
              ResultSet rss=sts.getResultSet();
              int as=0;
              while(rss.next())
              {
                  as=rss.getInt(4);

              }
for(int i=1;i<=as;i++){
    if(i==Integer.parseInt(studentname)){
%> 
<option value="<% out.print(i); %>" selected="selected"><% out.print(i); %></option>      
              <% }else{ %>
               <option value="<% out.print(i); %>"><% out.print(i); %></option>     
             <%  }}} %>
                 </select>
           </div>      
        </div>
      <div class="textright">
    <label>Enter Examination</label>
                <select name="ename" id="ename" class="formelement"  required> 
                 <option value="">ExaminationName</option>
                  <%  
     Class.forName("com.mysql.jdbc.Driver");
         
   String query1="Select * from addexamination where status='1'";
             Statement st1=con.createStatement();
              st1.execute(query1);
              ResultSet rs1=st1.getResultSet();
              int a1=0;
              while(rs1.next())
              {%>
              <option value="<% out.print(rs1.getString(1)); %>"><% out.print(rs1.getString(2)); %></option>  
              <% } %>
  
             </select>
                 
                
    </div>
               
          <div  id="tmarksdiv">
    
      <div class="textleft">
     <label>Total Marks</label>
               <input type="text"  value="" name="tmarks"  value="<% out.print(totalmarks ); %>" id="tmarks" class="formelement" placeholder="TotalMarks" readonly required>    
       
                   </div>
          </div>
                
             <div class="clearfix"></div>
                  
              
                 <div class="textright">
                       <div class="col-md-6" required>
                      <label>Obtain Marks</label> 
              
             <input type="text"  name="omarks"  id="omarks" class="formelement" value="<% out.print(obtainmarks ); %>"  placeholder="ObtainMarks" required>    
                </div>
                </div>
               
                <div class="textleft">
               <label>Remarks</label> 
               
              <input type="text"name="rmarks" id="rmamks"class="formelement" value="<% out.print(remarks ); %>" placeholder="Remarks" required >    
                </div>
                 <input type="hidden" name="id" id="id" value="<% if(request.getParameter("id")!=null) { out.print(request.getParameter("id"));} %>"/>    
         
           
    <div class="textright">
          <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">
    </div>
             </form>
    
   </div>
    
    

 </div>
                
        
     </body>
</html>
    