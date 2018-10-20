
<!DOCTYPEhtml>
<html>
<head>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    <title>Add Subject</title>
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
 function fetchMarks(subjectid) {

        var strURL="fetchMarks.jsp?subjectid="+subjectid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('tmarks').innerHTML=req.responseText;


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
             out.print(cname);
              String sem=request.getParameter("sem").toString();
             out.print(sem);
              String subname=request.getParameter("subname").toString();
             out.print(subname);
              String tmarks=request.getParameter("tmarks").toString();
             out.print(tmarks);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
             String query="";
             if(request.getParameter("id")!="") {
                  String id=request.getParameter("id"); 
             
             query="update addsubject set CourseName='"+cname+"',Semster='"+sem+"',Subject='"+subname+"',EnterTotalMarks='"+tmarks+"',Status='1' where id='"+id+"'";    
             }
             else{
                     query="insert into addsubject(CourseName,Semster,Subject,EnterTotalMarks,Status)values('"+cname+"','"+sem+"','"+subname+"','"+tmarks+"','1')"; 
                     }
             PreparedStatement ps=con.prepareStatement(query);
              ps.execute();
              if(request.getParameter("id")!="") {
              response.sendRedirect("ViewSubject.jsp");
              }else{
              response.sendRedirect("AddSubject.jsp");
              }
         }
         
%>
    



 <body style="background-color:#d7ddea">
     <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
       <h3>  <%
           
          String coursename=""; 
          String semster="";
          String subject="";
          String marks="";
        if(request.getParameter("id")!=null) {
            String id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
         Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query1="Select * from addsubject where id='"+id+"' and status='1'";
             Statement st=con1.createStatement();
              st.execute(query1);
             ResultSet rs =st.getResultSet();
              while(rs.next()){
                  coursename=rs.getString(2); 
                  semster=rs.getString(3);
                  subject=rs.getString(4);
                  marks=rs.getString(5);
                  
                          
                          }
              
            %>
         Update subject
         <% } else{ %>
           Add subject
         <% } %>
    </h3>
        </div>
<div id= "form1" method="post">
<form>
    
    <div class="textleft">
        
                     <label>Select Course</label>
             <select name="cname" id="cname"class="formelement" onchange="fetchSemester(this.value)" required>
                 <option value="">CourseName </option> 
                  <%  
     Class.forName("com.mysql.jdbc.Driver");
             Connection cons=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String querys="Select * from addcourse where status='1'";
             Statement st=cons.createStatement();
              st.execute(querys);
              ResultSet rs=st.getResultSet();
              int a=0;
              while(rs.next())
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
        <label>Select Semester</label>
               <select name="sem" id="sem"class="formelement"required> 
                   <option value="">Semester </option> 
                   
                   
                   <%  
              if(!coursename.equals("")){
    String courseid=coursename;
     Class.forName("com.mysql.jdbc.Driver");
            String query2="Select * from addcourse where id="+courseid;
             Statement sts=cons.createStatement();
              sts.execute(querys);
              ResultSet rss=sts.getResultSet();
              int as=0;
              while(rss.next())
              {
                  as=rss.getInt(3);

              }
for(int i=1;i<=as;i++){
    if(i==Integer.parseInt(semster)){
%>

<option value="<% out.print(i); %>" selected="selected"><% out.print(i); %></option>      
              <% }else{ %>
               <option value="<% out.print(i); %>"><% out.print(i); %></option>     
             <%  }}} %>
                     
                   </select>
        </div>
    
    
    <div class="textleft">
             <label>Enter Subject Name</label> 
              <input type="hidden" name="id" id="id" value="<% if(request.getParameter("id")!=null) { out.print(request.getParameter("id"));} %>"/>    
             <input type="text" name="subname" id="subname"class="formelement"value="<% out.print(subject ); %>" placeholder="SubjectName"required>    
             </div>
                    <div class="textright">
               <label>Enter Total Marks</label>
            
             <input type="text"  name="tmarks"id="tmarks" class="formelement"value="<% out.print(marks ); %>" placeholder="EnterTotalMarks" required >    
              </div>
                      <div class="textright">
               <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">   
            </div>
                                                                                                                                     
                 
            </div>
                  
        
 
             
         
        
        
   


        
     </body>
</html>
