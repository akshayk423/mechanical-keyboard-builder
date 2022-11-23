<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Manage Listings</title>
    </head>
  <body>
  <form action="login.jsp" method="post">
        <button type="submit" value = "Sign Out" name="signOut">Sign Out</button>
    </form>

    <h1>Manage Listings:</h1>
    
    <h2>Your Parts:</h2>
    <% 
     String db = "team4";
        String user; // assumes database name is the same as username
        //change these
          user = "root";
        String password = "157a1965";
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

            //PRINT EACH LIST FOR EACH PART
            %><h3>Prebuilts:</h3><%
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.prebuilt WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'PB%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Switches:</td>
                        <td>Hot Swappable:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.pcb WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'PC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Contains RGB:</td>
                        <td>Hot Swappable:</td>
                        <td>Size:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.stabilizers WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'SB%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Stabilizer Type(s):</td>
                        <td>Info:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.keycaps WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'KC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Profile:</td>
                        <td>Material:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.kbcase WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'CS%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Size:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.accessories WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'AC%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Type:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
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
            rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart NATURAL JOIN mkdb.switches WHERE username = '" + username  + "' AND keyboardpart.PartID LIKE 'SW%'");
            //move cursor back to first position
            rs.beforeFirst();
            if(!rs.next()){
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>No Listings</td>
                    </tr>
                <%
            }else{
                rs.beforeFirst();
                %>
                <table>
                    <table border="1">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>URL:</td>
                        <td>Brand:</td>
                        <td>Price:</td>
                        <td>Type:</td>
                        <td>Stem:</td>
                        <td>Edit Listing:</td>
                        <td>Remove Listing:</td>
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
                            <input type='submit' value='Edit Prebuilt' name='editPrebuilt'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                        <td>
                            <form action='manageListings.jsp' method='post'>
                            <input type='submit' value='Remove Listing' name='removeListing'>
                            <input type="hidden" name="partID" value="<%=rs.getString(1)%>">
                            </form>
                        </td>
                    </tr>
                    <%
                }
            }
            %>
                </tbody>
                </table>


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

        %>
        <h3><%=partType%></h3>
        <form name="addEntry" action="manageListings.jsp" method="post">
        <tr>
        <td>Name:</td>
        <td><input type="text" name="pName"></td></br>
        <td>URL:</td>
        <td><input type="text" name="pURL"></td></br>
        <td>Brand:</td>
        <td><input type="text" name="pBrand"></td></br>
        <td>Price:</td>
        <td><input type="text" name="pPrice"></td></br>
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
                </form>
            <%
            break;
        case "accessories":
            %>
            <td>Type:</td>
            <td><input type="text" name="pType"></td></br>

            <br></br>
                <input type="submit" value="Add Entry" name="addPartButton">
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
                </form>
            <%
        break;
        default:
            break;
       }
    }

    rs.close();
    stmt.close();
    con.close();
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}
%>
</body>
</html>