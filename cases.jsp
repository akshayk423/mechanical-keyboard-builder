<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
    <head>
        <title>Cases Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>

            table{
                
                border: 1px solid !important;
                border-collapse: collapse!important;
            }

            thead{
                font-weight: bold;
            }
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
                    <li class="nav-item">
                      <form action="login.jsp" method="post" value = "Sign Out" name="signOut">
                        <button type="submit" class="signOut" value = "Sign Out" name="signOut">Sign Out</button>
                      </form>
                    </li>
                </ul>
                </div>
              </div>
            </nav>
        </div>


        <div>
            <h1>Cases</h1>
        <table width="100%">
            
            <thead>
                <tr>
                    <td>

                        <form action="cases.jsp" method="post">
                            <input type="hidden" value = "name" name="sortCase">
                            <button type="submit" value = "sort" name="sort">Name</button>
                        </form>
                            
                    </td>
                        
                    <td>
                    <form action="cases.jsp" method="post">
                        <input type="hidden" value = "brand" name="sortCase">
                        <button type="submit" value = "sort" name="sort">Brand</button>
                    </form>
                    
                    </td>
                    <td> 
                        <form action="cases.jsp" method="post">
                            <input type="hidden" value = "price" name="sortCase">
                            <button type="submit" value = "sort" name="sort">Price</button>
                        </form> 
                    </td>
                    <td>Url</td>
                    <td>
                        <form action="cases.jsp" method="post">
                                <input type="hidden" value = "size" name="sortCase">
                                <button type="submit" value = "sort" name="sort">Size</button>
                        </form>
                    </td>
                
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
                    String query = "SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.kbcase WHERE keyboardpart.PartID LIKE 'CS%';";
                    HashMap<String,Boolean> ascending = new HashMap<>();
                    ascending.put("brand",true);
                    ascending.put("name",true);
                    ascending.put("price",true);
                    ascending.put("size",true);
                    String sort = request.getParameter("sort");
                    String partListID = "";
                    String addCase = request.getParameter("addCase");
                    if(addCase != null && addCase.equals("Add Case")){
                        partListID = request.getParameter("partListID");
                    }
                    out.println(partListID);

                    if(sort != null && sort.equals("sort")){
                            ascending.put(request.getParameter("sortCase"), !ascending.get(request.getParameter("sortCase"))); 
                        if(ascending.get(request.getParameter("sortCase")) == true) 
                            query = query.substring(0,query.length()-1) + " ORDER BY " + request.getParameter("sortCase") + ";"; 
                        if(ascending.get(request.getParameter("sortCase")) == false)
                            query = query.substring(0,query.length()-1) + " ORDER BY " + request.getParameter("sortCase") + " DESC;"; 

                    } 
                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next()){

                        String partName = rs.getString("Name");
                        String price = String.format("%.2f",rs.getDouble("Price"));
                        if(price.length() > 5){

                        }
                        if(partName.length() > 40){ partName = partName.substring(0,40) + "...";}
                        %><tr>
                            <td width="25%"><%=partName%></td>
                            <td width="15%"><%=rs.getString("Brand")%></td>
                            <td width="10%"><%=price%></td>
                            <td width="10%"><a href="<%=rs.getString("URL")%>">Purchase</a></td>
                            <td width="10%"><%=rs.getString("Size")%></td>
                            <td>
                                <form action='partlist.jsp' method='post'>
                                    <input type='submit' class="btn btn-primary" value='Add Part' name='addPart'>
                                    <input type='hidden' value='<%=rs.getString(1)%>' name='addPartID'>
                                    <input type='hidden' value='<%=partListID%>' name= 'partListID'>
                                </form>
                            </td>
                            <td width="2%"><button type="button" class="btn btn-dark">Bookmark</button></td>
                            <td width="2%"><button type="button" class="btn btn-danger">Report</button></td>
                        </tr><%
                    }

                }catch(SQLException e) { 
                    out.println("SQLException caught: " + e.getMessage()); 
                }
                %>



            </tbody>

        </div>

    </body>

</html>