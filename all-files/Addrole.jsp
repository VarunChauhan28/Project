<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

    </script>
    <link href="css1/kendo.common.min.css" rel="stylesheet" />
    <link href="css1/kendo.default.min.css" rel="stylesheet" />
    <link href="css1/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="css1/kendo.dataviz.default.min.css" rel="stylesheet" />
    <script src="js1/jquery.min.js"></script>
    <script src="js1/angular.min.js"></script>
    <script src="js1/kendo.all.min.js"></script>
</head>

<body>

                            <div id="example" style="background:#FFFFFF">

    <div class="demo-section k-header" style="background:#FFFFFF">
        <div class="box-col" style="background:#FFFFFF">
            <h4>Check nodes</h4>
            <div id="treeview" style="background:#FFFFFF"></div>
        </div>
        <div class="box-col" style="background:#FFFFFF">
            
            <p id="result"></p>
			
        </div>
    </div>

    <script>
	$.noConflict();
jQuery( document ).ready(function( $ ) {	

        $("#treeview").kendoTreeView({
            checkboxes: {
                checkChildren: true
            },

            check: onCheck,

            dataSource: [{
                id: 1, text: "Dashboard", expanded: true, spriteCssClass: "", items: [
                    {
                        id: 2, text: "Examination", expanded: true, spriteCssClass: "", items: [
                            { id: "2,21", text: "Add Examination", spriteCssClass: "" },
                            { id: "2,22", text: "View Examination", spriteCssClass: "" },
							
						
                        ]
						
                    },
					{
                            id: 3, text: "Course", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "3,31", text: "Add Course", spriteCssClass: "" },
							{ id: "3,32", text: "View Course", spriteCssClass: "" },
							
						
							
                        ]
                    },
					{
                            id: 4, text: "Subject", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "4,41", text: "Add Subject", spriteCssClass: "" },
							{ id: "4,42", text: "View Subject", spriteCssClass: "" },
							
							
						
							
                        ]
                    },
					{
                            id: 5, text: "Student", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "5,51", text: "Add Student", spriteCssClass: "" },
							{ id: "5,52", text: "View Student", spriteCssClass: "" },
							
							
						
							
                        ]
                    },
					{
                            id: 6, text: "Marks", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "6,61", text: "Add Marks", spriteCssClass: "" },
							{ id: "6,62", text: "View Marks", spriteCssClass: "" }
							
							
						
							
                        ]
                    },
                    {
                            id: 7, text: "Report", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "7,71", text: "Add Report", spriteCssClass: "" }
							
							
						
							
                        ]
                    },
                    {
                            id: 8, text: "Role", expanded: true, spriteCssClass: "", items: [
                            
							{ id: "8,81", text: "Add Role", spriteCssClass: "" }
							
							
						
							
                        ]
                    },
                ]
            }]
        });

        // function that gathers IDs of checked nodes
        function checkedNodeIds(nodes, checkedNodes) {
            for (var i = 0; i < nodes.length; i++) {
                if (nodes[i].checked) {
                    checkedNodes.push(nodes[i].id);
                }

                if (nodes[i].hasChildren) {
                    checkedNodeIds(nodes[i].children.view(), checkedNodes);
                }
            }
        }
 function onCheck() {
            var checkedNodes = [],
                treeView = $("#treeview").data("kendoTreeView"),
                message;

            checkedNodeIds(treeView.dataSource.view(), checkedNodes);

            if (checkedNodes.length > 0) {
                message =checkedNodes.join(",");
				 document.getElementById("hidden").value=message;
            } else {
                message = "No nodes checked.";
            }

           // $("#result").html(message);
        }
		});
        // show checked node IDs on datasource change
       
    </script>

    <style scoped>
        #treeview .k-sprite {
            background-image: url("content/web/treeview/coloricons-sprite.png");
        }

        .rootfolder { background-position: 0 0; }
        .folder     { background-position: 0 -16px; }
        .pdf        { background-position: 0 -32px; }
        .html       { background-position: 0 -48px; }
        .image      { background-position: 0 -64px; }
        
        .box-col { min-width: 100px;}

    </style>
</div>
    <%  
         if(request.getParameter("submit")!=null)
         {
        String hidden=request.getParameter("hidden").toString();
             out.print(hidden);
         String rolename=request.getParameter("rolename").toString();
             out.print(rolename);
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
             String query="insert into addrole(Role,Hidden,status)values('"+rolename+"','"+hidden+"','1')";
                 PreparedStatement ps=con.prepareStatement(query);
              ps.execute();
         
         
         }
        %>
                                <form role="form"  method="post" name="form1" >
                             <div class="form-group">
							 <div class="row">
							 <div class="col-md-6">
                                            <label style="color:#3300FF; font-size:25px;">Role Name</label></div></div>
											<div class="row">
							 <div class="col-md-6">
                                            <input class="form-control" name="rolename" type="text" id="rolename">
                                             <input type="hidden" name="hidden" id="hidden" /></div></div>
											 
                                        </div>
                                        <div class="row">
							 <div class="col-md-6">
                                         <input type="submit" class="btn btn-success" name="submit" value="SAVE">&nbsp;&nbsp;&nbsp;
                                        <button type="reset" class="btn btn-primary">RESET</button></div></div>
                            </form>
                            
                            
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->


</body>

</html>

