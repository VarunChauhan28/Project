  <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<div class="drop">
<ul class="drop_menu">
    <%  
      
     Class.forName("com.mysql.jdbc.Driver");
             Connection conm=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
               String roleid = session.getAttribute("roleid").toString();
              
        String queryrole="Select * from addrole where id='"+roleid+"'";
          Statement stmrole=conm.createStatement();
              stmrole.execute(queryrole);
              ResultSet rsmrole=stmrole.getResultSet();
            String rolevalue ="";  
              while(rsmrole.next())
              {
              rolevalue =rsmrole.getString(2);    
              }
             
              String rolearray[] =rolevalue.split(",");
   String querym="Select * from menu";
             Statement stm=conm.createStatement();
              stm.execute(querym);
              ResultSet rsm=stm.getResultSet();
              
              while(rsm.next())
              {
                  int flag=0;
    for(int i=0;i<=rolearray.length-1;i++){
    if(rolearray[i].equals(rsm.getString(3))){
    flag=1;
    }
    }
    if(flag==1){
    %>
              <li><a href='#'><% out.print(rsm.getString(2)); %></a>
	<ul>
            <% 
              String parentid = rsm.getString(3);
             String querysm="Select * from submenu where parentid='"+parentid+"'";
             Statement stsm=conm.createStatement();
              stsm.execute(querysm);
              ResultSet rssm=stsm.getResultSet();
              
              while(rssm.next())
              {
                  int flag1=0;
    for(int i=0;i<=rolearray.length-1;i++){
    if(rolearray[i].equals(rssm.getString(3))){
    flag1=1;
    }
    }
if(flag1==1){
            %>
	<li><a href='<% out.print(rssm.getString(5)); %>'><% out.print(rssm.getString(4)); %></a></li>
	
        <% }} %>
	</ul>
       
</li>
<% }} %>
 <li><a href='<% out.print("Logout.jsp"); %>'><% out.print("Logout");%></a></li>
</div>