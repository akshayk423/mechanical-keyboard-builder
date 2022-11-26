<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Manage Listings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

      .signOut {
        border: none;
        background: none;
        color:aliceblue!important;
      }
      .move{
        margin: 0;
        position: absolute;
        left: 1%;
      }
      th, td {
            padding: 5px;
        }

    </style>
  </head>
  <body>
    <%if(session.getAttribute("username") == null){
        %><h1>No Permission To Access Page</h1><%
    }else{%>
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

    <div class="move">
    <h1>Manage Listings:</h1>
    <hr></hr>
    <% 
     String user = (String) session.getAttribute("dbuser");
     String password = (String) session.getAttribute("dbpassword");
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

            //get current username
            String username = (String) session.getAttribute("username");

            
            //REMOVE
            String removed = request.getParameter("removeListing");
            if(removed != null && removed.equals("Remove Listing")){
              String id = request.getParameter("partID");
              String prefix = id.charAt(0) + "" + id.charAt(1);

                rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

                rs.beforeFirst();
                rs.next();
                
                Map<String, String> dict = new HashMap<String, String>();
                dict.put("SW", "switches");
                dict.put("PB", "prebuilt");
                dict.put("PC", "pcb");
                dict.put("SB", "stabilizers");
                dict.put("KC", "keycap");
                dict.put("CS", "kbcase");
                dict.put("AC", "accessories");

                //find the ID
                rs.beforeFirst();
                while(rs.next()){
                    if(id.equals(rs.getString(1))){
                    rs.deleteRow();
                    break;
                    }
                }

                rs = stmt.executeQuery("SELECT * FROM mkdb." + dict.get(prefix));
                rs.beforeFirst();
                while(rs.next()){
                    if(id.equals(rs.getString(1))){
                    rs.deleteRow();
                    break;
                    }
                }
            }

            //INSERT FOR EACH PART

            String add = request.getParameter("addPartButton");
            if(add != null && add.equals("Add Entry")){
                rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

                //GENERATE NEW ID

                Set<String> idSet = new HashSet<String>();
                //populate map with ID's
                rs.moveToInsertRow();
                while(rs.next()){
                    idSet.add(rs.getString(1));
                }

                //generate new id
                boolean unique = false;
                Random random = new Random();
                String id = "0000";
                while(!unique){
                    String curId = String.format("%04d", random.nextInt(10000));
                    if(!idSet.contains(id)){
                        id = curId;
                        unique = true;
                        break;
                    }
                }

                //with the new ID and part Type attributes from the post call
                //we can now add it to the database

                String kbPartType = request.getParameter("partType");

                //Update ID with prefix
                switch(kbPartType){
                    case "prebuilt":
                        id = "PB" + id;
                        break;
                    case "pcb": 
                        id = "PC" + id;
                        break;
                    case "stabilizers": 
                        id = "SB" + id;
                        break;
                    case "keycaps": 
                        id = "KC" + id;
                        break;
                    case "kbcase":
                        id = "CS" + id;
                        break;
                    case "accessories":
                        id = "AC" + id;
                        break;
                    case "switches":
                        id = "SW" + id;
                        break;
                    default:
                        break;
                }

                String name = request.getParameter("pName");
                String url = request.getParameter("pURL");
                String brand = request.getParameter("pBrand");
                String price = request.getParameter("pPrice");

                rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

                //add entry
                rs.moveToInsertRow();
                rs.updateString(1, id);
                rs.updateString(2, url);
                rs.updateString(3, name);
                rs.updateString(4, brand);
                rs.updateString(5, price);
                rs.updateString(6, username);
                rs.insertRow();

                switch(kbPartType){
                    case "prebuilt": {
                        String switchName = request.getParameter("pSwitchName");
                        String hotSwap = request.getParameter("pHotSwappable");
                        
                        rs = stmt.executeQuery("SELECT * FROM mkdb.prebuilt");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, switchName);
                        rs.updateString(3, hotSwap);
                        rs.insertRow();
                        break;
                    }
                    case "pcb": {
                        String containsRGB = request.getParameter("pContainsRGB");
                        String hotSwap = request.getParameter("pHotSwappable");
                        String size = request.getParameter("pSize");

                        rs = stmt.executeQuery("SELECT * FROM mkdb.pcb");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, containsRGB);
                        rs.updateString(3, hotSwap);
                        rs.updateString(4,size);
                        rs.insertRow();
                        break;
                    }
                    case "stabilizers": {
                        String info = request.getParameter("pInfo");

                        String type1 = request.getParameter("2U");
                        String type2 = request.getParameter("6.25U");
                        String type3 = request.getParameter("7U");
                        String stabType = "";
                        ArrayList<String> stabList = new ArrayList<String>();

                        if(type1 != null) {stabList.add(type1);}
                        if(type2 != null) {stabList.add(type2);}
                        if(type3 != null) {stabList.add(type3);}
                        if(stabList.isEmpty()){
                            stabType = "Unknown";
                        }else{
                            stabType = String.join(", ", stabList);
                        }

                        rs = stmt.executeQuery("SELECT * FROM mkdb.stabilizers");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, stabType);
                        rs.updateString(3, info);
                        rs.insertRow();
                        break;
                    }
                    case "keycaps": {
                        String profile = request.getParameter("pProfile");
                        String material = request.getParameter("pMaterial");

                        rs = stmt.executeQuery("SELECT * FROM mkdb.keycaps");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, profile);
                        rs.updateString(3, material);
                        rs.insertRow();
                        break;
                    }
                    case "kbcase":{
                        String size = request.getParameter("pSize");

                        rs = stmt.executeQuery("SELECT * FROM mkdb.kbcase");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, size);
                        rs.insertRow();
                        break;
                    }
                    case "accessories": {
                        String type = request.getParameter("pType");

                        rs = stmt.executeQuery("SELECT * FROM mkdb.accessories");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, type);
                        rs.insertRow();
                        break;
                    }
                    case "switches": {
                        String type = request.getParameter("pType"); 
                        String stem = request.getParameter("pStem");

                        rs = stmt.executeQuery("SELECT * FROM mkdb.");
                        rs.moveToInsertRow();
                        rs.updateString(1, id);
                        rs.updateString(2, type);
                        rs.updateString(3, stem);
                        rs.insertRow();
                        break;
                    }
                    default:
                        break;
                }
            }
    %>
    <h2>Add a Listing:</h2>
    <h3>Select Keyboard Part Type:</h3>
    <form action="manageListings.jsp">
        <select name="selectPart">
            <option value="prebuilt">Prebuilt</option>
            <option value="pcb">PCB</option>
            <option value="stabilizers">Stabilizer</option>
            <option value="keycaps">Keycaps</option>
            <option value="kbcase">Case</option>
            <option value="accessories">Accessory</option>
            <option value="switches">Switches</option>
        </select>
        <input type="submit" value="Select" name="selectPartButton">
    </form>

    <%
    String selectPart = request.getParameter("selectPartButton");
    if(selectPart != null && selectPart.equals("Select")){
       String partType = request.getParameter("selectPart");

       HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("switches", "Adding Switches Entry:");
        dict.put("prebuilt", "Adding Prebuilt Entry:");
        dict.put("pcb", "Adding PCB Entry:");
        dict.put("stabilizers", "Adding Stabilizers Entry:");
        dict.put("keycaps", "Adding Keycaps Entry:");
        dict.put("kbcase", "Adding Case Entry:");
        dict.put("accessories", "Adding Accessory Entry:");


        %>
        <h3><%=dict.get(partType)%></h3>
        <form name="addEntry" action="manageListings.jsp" method="post">
        <div style="display: inline-block;text-align:right">
        <tr>
        <td>Name:</td>
        <td><input type="text" name="pName"></td></br>
        <td>URL:</td>
        <td><input type="text" name="pURL"></td></br>
        <td>Brand:</td>
        <td><input type="text" name="pBrand"></td></br>
        <td>Price:</td>
        <td><input type="number" name="pPrice"></td></br>
        <input type="hidden" name="partType" value="<%= partType %>">
        <%


       switch(partType) {
        case "prebuilt":
            %>
                <td>Switch Name:</td>
                <td><input type="text" name="pSwitchName"></td></br>
                <td>HotSwappable:</td>
                <select name="pHotSwappable">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>
                </tr>
                <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
            break;
        case "pcb":
            %>
                <td>containsRGB:</td>
                <select name="pContainsRGB">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>

                <td>Hot Swappable:</td>
                <select name="pHotSwappable">
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select></br>

                <td>Size:</td>
                <select name="pSize">
                    <option value="40%">40%</option>
                    <option value="60%">60%</option>
                    <option value="65%">65%</option>
                    <option value="75%">75%</option>
                    <option value="TKL">Tenkeyless</option>
                    <option value="Full Sized">Full Sized</option>
                    <option value="Numpad">Numpad</option>
                </select></br>
                </tr>
                <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
            break;
        case "stabilizers":
            %>
                <select name="pInfo">
                <option value="plate mount">Plate Mount</option>
                <option value="screw-in, pcb mount">PCB Mount</option>
                </select></br>

                <input type="checkbox" name="2U" value="2U" checked>2U</label><br />
                <input type="checkbox" name="6.25U" value="6.25U">6.25U</label><br />
                <input type="checkbox" name="7U" value="7U">7U</label><br />

                <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
            break;
        case "keycaps":
            %>
            <td>Profile:</td>
            <td><input type="text" name="pProfile"></td></br>
            <td>Material:</td>
            <td><select name="Material">
                <option value="PBT">PBT</option>
                <option value="ABS">ABS</option>
            </select></td></br>

            <br></br>
            <input type="submit" value="Add Entry" name="addPartButton">
            </div>
            </form>
            <%
            break;
        case "kbcase":
            %>
                <td>Size:</td>
                <select name="pSize">
                    <option value="40%">40%</option>
                    <option value="60%">60%</option>
                    <option value="65%">65%</option>
                    <option value="75%">75%</option>
                    <option value="TKL">Tenkeyless</option>
                    <option value="Full Sized">Full Sized</option>
                    <option value="Numpad">Numpad</option>
                </select></br>

                <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
            break;
        case "accessories":
            %>
            <td>Type:</td>
            <td><input type="text" name="pType"></td></br>

            <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
        break;
        case "switches":
            %>
                <td>Type:</td>
                    <select name="pType">
                        <option value="Linear">Linear</option>
                        <option value="Clicky">Clicky</option>
                        <option value="Tactile">Tactile</option>
                    </select></br>
                <td>Stem:</td>
                <td><input type="text" name="pStem"></td></br>

                <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
                </div>
                </form>
            <%
        break;
        default:
            break;
       }
    }

    
            //PRINT EACH LIST FOR EACH PART
            %>
            <hr></hr>
            <h2>Your Parts:</h2><br></br>
            <h3>Prebuilts:</h3>
            <%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.prebuilt WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'PB%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Switches:</th>
                        <th>Hot Swappable:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>PCB:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.pcb WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'PC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Contains RGB:</th>
                        <th>Hot Swappable:</th>
                        <th>Size:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>Stabilizers:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.stabilizers WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'SB%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Stabilizer Type(s):</th>
                        <th>Info:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>Keycaps:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.keycaps WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'KC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Profile:</th>
                        <th>Material:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                    </tr>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>Cases:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.kbcase WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'CS%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Size:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>Accessories:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.accessories WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'AC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Type:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
            <%

            %><h3>Switches:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.switches WHERE seller = '" + username  + "' AND keyboardpart.PartID LIKE 'SW%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                        <td>No Listings</td><br></br>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <th>Name:</th>
                        <th>URL:</th>
                        <th>Brand:</th>
                        <th>Price:</th>
                        <th>Type:</th>
                        <th>Stem:</th>
                        <th>Edit Listing:</th>
                        <th>Remove Listing:</th>
                <%
                while (rs.next()) {
                    String name = rs.getString(3);
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString(2);
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=name%></td>
                        <td><%=url%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>

                        <td>
                            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Remove Listing' name='removeListing'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>
                </div>
                <%
    rs.close();
    stmt.close();
    con.close();
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}
    }
%>
</body>
</html>