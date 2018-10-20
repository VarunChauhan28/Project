<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPEhtml>
<html>
<head>
    <title>Add Examination</title>
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
	</script>
</head> <%
            if(request.getParameter("submit")!=null)
                     {
             String fname=request.getParameter("fname").toString();
             out.print(fname);
             String email=request.getParameter("email").toString();
             out.print(email);
             String mnumber=request.getParameter("mnumber").toString();
             out.print(mnumber);
             String uname=request.getParameter("uname").toString();
             out.print(uname);
              String pswd=request.getParameter("pswd").toString();
             out.print(pswd);
             String role=request.getParameter("role").toString();
             out.print(role);
              String cname=request.getParameter("cname").toString();
             out.print(cname);
             String sem=request.getParameter("sem").toString();
             out.print(sem);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
                 String query="insert into addfaculty(Name,Email,MobileNumber,UserName,Password,Role,CourseName,Semester,status)values('"+fname+"','"+email+"','"+mnumber+"','"+uname+"','"+pswd+"','"+role+"','"+cname+"','"+sem+"','1')"; 
                 PreparedStatement ps=con.prepareStatement(query);
                  ps.execute();
         }
            %>
<body style="background-color:#d7ddea">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
        <h3>Faculty</h3>
        </div>
         
<div id= "form1" method="post">
<form>
    <div class="textleft">
       <b>Name</b> 
   <input type="text" id="fname" class="formelement" name="fname" placeholder="Name">
    </div>
    <div class="textright">
        <b>Email</b>
   <input type="text" id="email" class="formelement" name="email" placeholder="Email">
    </div>
    <div class="textleft">
        <b>MobileNumber</b>
   <input type="text" id="mnumber" class="formelement" name="mnumber" placeholder="MobileNumber">
    </div>
    <div class="textright">
        <b>UserName</b>
   <input type="text" id="uname" class="formelement" name="uname" placeholder="UserName">
    </div>
    <div class="textleft">
        <b>password</b>
   <input type="text" id="pswd" class="formelement" name="pswd" placeholder="Password">
    </div>
    <div class="textright">
        <b>Department</b>
<select name="role" id="role"class="formelement" style="height:48px"required >  
<option value="id">dept</option> 
<option value="1">mca</option>
<option value="2">btech</option> 
<option value="3">bca</option>
 </select>
        </div> 
    
      
            <div class="textleft">
                       <label>Course Name</label>
                     <select name="cname" id="cname" class="formelement" onchange="fetchSemester(this.value)"  required >   
                     <option value="">CourseName </option>
                      <%
                       
                       String coursename="";
     Class.forName("com.mysql.jdbc.Driver");
             Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query1="Select * from addcourse where status='1'";
             Statement st1=con1.createStatement();
              st1.execute(query1);
              ResultSet rs1=st1.getResultSet();
              int a=0;  
              while(  rs1.next())
              { 
                if(rs1.getString(1).toString().equals(coursename)){
                %>
                 <option value="<% out.print(rs1.getString(1)); %>" selected="selected"><% out.print(rs1.getString(2)); %></option>  
             <% } else{ %>
               <option value="<% out.print(rs1.getString(1)); %>"><% out.print(rs1.getString(2)); %></option>  
         
               <% }} %>
                     </select></div>
                    
                     <div class="textright">
                     <label>Semester</label>
                 <select name="sem" id="sem"class="formelement" required>
                 <option value="">Semester </option> 
                 <%  
    String courseid=request.getParameter("courseid");
     Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
   String query="Select * from addcourse where id="+courseid;
             Statement st=con.createStatement();
              st.execute(query);
              ResultSet rs=st.getResultSet();
              int a1=0;
              while(rs.next())
              {
                  a1=rs.getInt(3);

              }
for(int i=1;i<=a1;i++){
%>
              
           <option value="<% out.print(i); %>"><% out.print(i); %></option>      
              
             <%  } %>
                 </select>
                </div>
    <div class="textright">
        <input type="submit" name="submit" id="submit" value="submit" class="button button-success" onclick="submit">
    </div>
    
   
    
</form>    

 </div>
  </div>      
     </body>
</html>
    