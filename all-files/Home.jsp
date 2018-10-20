<!DOCTYPEhtml>
<html>
<head>
    <title>Add Examination</title>
<link rel="stylesheet" href="style/style1.css" type="text/css"/>
</head>
<body style="background-color:#d7ddea;">
         <%@include file="Menu.jsp" %>
        <div class="maindiv">
    <div class="header">
        
        
            
            <%
                         

              String studentroleid = session.getAttribute("roleid").toString();
              String query="";
               String studentid = session.getAttribute("loginid").toString();
               if(studentroleid.equals("1"))
             {
                
            query="Select * from addstudent where id='"+studentid+"' and status='1'";
                 Statement stsm=conm.createStatement();
              stsm.execute(query);
              ResultSet rssm=stsm.getResultSet();
             String StudentName=""; 
              while(rssm.next())
              {
                StudentName=rssm.getString(4);
               
              }
            %>
            <h3 style="text-align:center;">Welcome <% out.print(StudentName); %> to result analyser</h3>
           <%  }
             if(studentroleid.equals("2"))
             {
                  String courseid = session.getAttribute("courseid").toString();
                 String semesterid = session.getAttribute("semesterid").toString();
            query="Select * from addfaculty where id='"+studentid+"' and status='1'";
 Statement stsm=conm.createStatement();
              stsm.execute(query);
              ResultSet rssm=stsm.getResultSet();
             String facultyName=""; 
              while(rssm.next())
              {
                facultyName=rssm.getString(2);
               
              }
%>
  <h3 style="text-align:center;">Welcome <% out.print(facultyName); %>  to result analyser</h3>
         <%    }
            if(studentroleid.equals("3"))
             {
          %>
        <h3 style="text-align:center;">Welcome admin  to result analyser</h3>
  
          <%
             }
                 %>
            </div>
             </div>
    </body>
    </html>