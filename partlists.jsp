<%@ page import="java.sql.*"%>
<html>
    <head>
        <title>
            Partlists
        </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .bg-light{
                background-color: #7A62CB!important  ;
            }

            .navbar-brand{
                color:aliceblue!important;
                --bs-navbar-brand-hover-color: yellow!important;
            }

            .navbar-brand .nav-item:hover{
                color: pink!important;
            }

            .nav-link{
                color:aliceblue!important;
            }

            .navbar-nav .nav-link.active, .navbar-nav .show>.nav-link {
                color:aliceblue!important;
            }

            .navbar-nav{
                --bs-nav-link-hover-color: yellow!important;
            }

            button, input, optgroup, select, textarea {
                margin: 10;
                font-family: inherit;
                font-size: inherit;
                line-height: inherit;
            }

            .btn {
                padding-top: 0.15rem!important;
                padding-right: 0.15rem!important;
                padding-bottom: 0.15rem!important;
                padding-left: 0.15rem!important;
            }
        </style>
    </head>

    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="/home.jsp">
                        <img alt src="logo.png" width="50" height="50">
                        Mechanical Keyboard Builder
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                        <a class="nav-link" href="/partlists.jsp">Partlists <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="/login.jsp">Login</a>
                        </li>
                    </ul>
                    </div>
                </div>
            </nav>
        </div>

        <div>
			<table width="80%">
				<thead>
					<tr>
						<th>List</th>
						<th>Keyboard</th>
						<th>Case</th>
						<th>PCB</th>
						<th>Switches</th>
						<th>Keycaps</th>
						<th>Stabilizers</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<% 
                        String user = "root";
                        String password = "Akshayk123!";
                        try {
                            java.sql.Connection con; 
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
                            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs = stmt.executeQuery("SELECT * FROM mkbb.partlist;");
                            
                            rs.beforeFirst();
                            while(rs.next()){
                                %>
                                <tr>
                                    <td><%out.println(rs.getString(1));%></td>
                                    <td><% 
                                        String prebuilt = rs.getString("prebuilt_id");
                                        if(prebuilt.length() > 0)
                                            out.println(prebuilt);
                                        else{
                                        %>            
                                        <a href="/prebuilts.jsp" type="button" class="btn btn-primary">Add Prebuilt</button>
                                        <%  
                                        }
                                        %>
                                    </td>
                                    <td>
                                    <%
                                        String case_id = rs.getString("case_id");
                                        if(case_id.length() > 0)
                                            out.println(case_id);
                                        else{
                                    %>
                                            <a href="/cases.jsp" type="button" class="btn btn-primary">Add Case</button>
                                    <%
                                        }
                                    %>
                                    </td>
                                    
                                    <td>
                                    <%
                                        String pcb_id = rs.getString("pcb_id");
                                        if(pcb_id.length() > 0)
                                            out.println(pcb_id);
                                        else{
                                    %>
                                            <a href="/pcbs.jsp" type="button" class="btn btn-primary">Add PCB</button>
                                    <%
                                        }
                                    %>
                                    </td>
                                    <td>
                                    <%
                                        String switch_id = rs.getString("switches_id");
                                        if(switch_id.length() > 0)
                                            out.println(switch_id);
                                        else{
                                    %>
                                            <a href="/switches.jsp" type="button" class="btn btn-primary">Add PCB</button>
                                    <%
                                        }
                                    %>
                                    
                                    </td>
                                    <td>
                                    <%
                                        String keycaps_id = rs.getString("keycaps_id");
                                        if(keycaps_id.length() > 0)
                                            out.println(keycaps_id);
                                        else{
                                    %>
                                            <a href="/keycaps.jsp" type="button" class="btn btn-primary">Add Keycaps</button>
                                    <%
                                        }
                                    %>
                                    </td>
                                    <td>
                                    <%
                                        String stab_id = rs.getString("stab_id");
                                        if(stab_id.length() > 0)
                                            out.println(stab_id);
                                        else{
                                    %>
                                            <a href="/stabs.jsp" type="button" class="btn btn-primary">Add Stabilizers</button>
                                    <%
                                        }
                                    %>
                                    </td>
                                    <td><button type="button" class="btn btn-danger">Delete</button></td>
                                    <td><%out.println(rs.getString(3));%></td>
                                    <td><%out.println(rs.getString(2));%></td>
                                </tr>
                            <%
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        }catch(SQLException e) { 
                            out.println("SQLException caught: " + e.getMessage()); 
                        }
                    %>
				</tbody>
			</table>
		</div>


    </body>



</html>