<%@ page import="java.sql.*"%>
<html>
    <head>

        <title>
            Partlists
        </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <style>
            .btn-secondary {
                color: #000;
                background-color: #ffc1078a!important;
                border-color: #ffc1078a!important;
            }
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
            .btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
                color: #000;
                background-color: #ffc1078a!important;
                border-color: #ffc1078a!important;
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
                    <a class="navbar-brand" href="/CS157A-team4/home.jsp">
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
			<table width="100%">
				<thead>
					<tr>
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
                        String user = (String) session.getAttribute("dbuser");
                        String password = (String) session.getAttribute("dbpassword");
                        try {
                            java.sql.Connection con; 
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
                            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            
                            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.partlist;");
                            rs.beforeFirst();
                            while(rs.next()){
                                %>
                                <tr>

                                    <td>
                                        <% 
                                        String prebuilt = rs.getString("prebuilt_id");
                                        if(prebuilt.length() > 0){
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + prebuilt + "';");
                                            rs1.next();
                                            String prebuilt_url = rs1.getString("URL");
                                        %>
                                        <div class="dropdown show">
                                            <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <%       if(rs1.getString("name").length() < 50)
                                                    out.println(rs1.getString("name"));
                                                else
                                                    out.println(rs1.getString("brand"));
                                                rs1.close();
                                                stmt1.close();
                                        %>
                                            </a>
                                          
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                              <a class="dropdown-item" href="<%=prebuilt_url%>" onclick="window.open('<%=prebuilt_url%>'),'_blank'">Purchase</a>
                                              <a class="dropdown-item" href="#">Delete</a>
                                            </div>
                                        </div>
                                        <%
                                        }
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
                                        if(case_id.length() > 0){
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + case_id + "';");
                                            rs1.next();
                                            String case_url = rs1.getString("URL");
                                    %>
                                    <div class="dropdown show">
                                        <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%
                                             if(rs1.getString("name").length() < 50)
                                                out.println(rs1.getString("name"));
                                            else
                                                out.println(rs1.getString("brand"));
                                            rs1.close();
                                            stmt1.close();
                                    %>
                                            </a>
                                                    
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="<%=case_url%>" onclick="window.open('<%=case_url%>'),'_blank'">Purchase</a>
                                            <a class="dropdown-item" href="#">Delete</a>
                                            </div>
                                        </div>
                                    <%
                                        }
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
                                        {
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + pcb_id + "';");
                                            rs1.next();
                                            String pcb_url = rs1.getString("URL");
                                        %>
                                        <div class="dropdown show">
                                            <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%
                                             if(rs1.getString("name").length() < 50)
                                                out.println(rs1.getString("name"));
                                            else
                                                out.println(rs1.getString("brand"));
                                            rs1.close();
                                            stmt1.close();
                                    %>
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                <a class="dropdown-item" href="<%=pcb_url%>" onclick="window.open('<%=pcb_url%>'),'_blank'">Purchase</a>
                                                <a class="dropdown-item" href="#">Delete</a>
                                                </div>
                                            </div>
                                    <%
                                        }
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
                                        {
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + switch_id + "';");
                                            rs1.next();
                                            String switch_url = rs1.getString("URL");
                                    %>
                                        <div class="dropdown show">
                                            <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%
                                             if(rs1.getString("name").length() < 30)
                                                out.println(rs1.getString("name"));
                                            else
                                                out.println(rs1.getString("brand"));
                                            rs1.close();
                                            stmt1.close();
                                    %>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="<%=switch_url%>" onclick="window.open('<%=switch_url%>'),'_blank'">Purchase</a>
                                    <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                    <%
                                        }
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
                                        {
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + keycaps_id + "';");
                                            rs1.next();
                                            String keycap_url = rs1.getString("URL");
                                    %>
                                        <div class="dropdown show">
                                            <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%
                                             if(rs1.getString("name").length() < 50)
                                                out.println(rs1.getString("name"));
                                            else
                                                out.println(rs1.getString("brand"));
                                            rs1.close();
                                            stmt1.close();
                                    %>
                                            </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="<%=keycap_url%>" onclick="window.open('<%=keycap_url%>'),'_blank'">Purchase</a>
                                            <a class="dropdown-item" href="#">Delete</a>
                                            </div>
                                        </div>
                                    <%
                                        }
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
                                        {
                                            Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM mkdb.keyboardpart WHERE PartID = '" + stab_id + "';");
                                            rs1.next();
                                            String stab_url = rs1.getString("URL");
                                    %>
                                    <div class="dropdown show">
                                        <button class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%
                                            if(rs1.getString("name").length() < 50)
                                                out.println(rs1.getString("name"));
                                            else
                                                out.println(rs1.getString("brand"));
                                            rs1.close();
                                            stmt1.close();
                                    %>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="<%=stab_url%>" onclick="window.open('<%=stab_url%>'),'_blank'">Purchase</a>
                                            <a class="dropdown-item" href="#">Delete</a>
                                        </div>
                                    </div>
                                    <%
                                        }
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
                        } catch(SQLException e) { 
                            out.println("SQLException caught: " + e.getMessage()); 
                        }
                    %>
				</tbody>
			</table>
		</div>
        
    </body>
   

</html>