<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Manage Listings</title>
    </head>
  <body>
    <form action="editPart.jsp">
      <input type="submit" value="Go to Edit Page">
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.switches");


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

                String name = request.getParameter("pName");
                String url = request.getParameter("pURL");
                String brand = request.getParameter("pBrand");
                String price = request.getParameter("pPrice");

                switch(request.getParameter("partType")){
                    case "prebuilt": {
                        id = "PB" + id;
                        String switchName = request.getParameter("pSwitchName");
                        String hotSwap = request.getParameter("pHotSwappable");

                        //add entry
                        out.println(name + "<br>");
                        out.println(url + "<br>");
                        out.println(brand + "<br>");
                        out.println(id + "<br>");
                        out.println(switchName + "<br>");
                        out.println(hotSwap + "<br>");
                        break;
                    }
                    case "pcb": {
                        id = "PC" + id;
                        String containsRGB = request.getParameter("pContainsRGB");
                        String hotSwap = request.getParameter("pHotSwappable");
                        String size = request.getParameter("pSize");

                        out.println(name + "<br>");
                        out.println(url + "<br>");
                        out.println(brand + "<br>");
                        out.println(price + "<br>");
                        out.println(id + "<br>");
                        out.println(containsRGB + "<br>");
                        out.println(hotSwap + "<br>");
                        out.println(size + "<br>");
                        break;
                    }
                    case "stabilizers": {
                        id = "SB" + id;
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

                        //add entry
                        out.println(name + "<br>");
                        out.println(url + "<br>");
                        out.println(brand + "<br>");
                        out.println(price + "<br>");
                        out.println(info + "<br>");
                        out.println(stabType + "<br>");
                        break;
                    }
                    case "keycap": {
                        id = "KC" + id;
                        break;
                    }
                    case "kbcase":{
                        id = "CS" + id;
                        break;
                    }
                    case"accessories": {
                        id = "AC" + id;
                        break;
                    }
                    default:
                        break;
                }
            }

            rs = stmt.executeQuery("SELECT * FROM mkdb.switches");

            //REMOVE
            String removed = request.getParameter("removeEntryButton");
            if(removed != null && removed.equals("Remove Entry")){
              String id = request.getParameter("rPartID");
              //find the ID
              rs.beforeFirst();
              out.println("<br></br>");
              boolean flag = true;
              while(rs.next()){
                if(id.equals(rs.getString(1))){
                  out.println("deleted row: " + rs.getRow());
                  rs.deleteRow();
                  flag = false;
                  break;
                }
              }
              if(flag){
                out.println("Could not find ID: " + id + ", nothing was deleted");
              }
            }

            //VIEW ROWS
            //move cursor back to first position
            rs.beforeFirst();

            int i = 1;
            while (rs.next()) {
                out.println("row" + i + ": " + rs.getString(1) + ", " + rs.getString(2) + ", " + rs.getString(3) + "<br/><br/>");
                i++;
            }
    %>

    <h2>Add a Listing:</h2>
    <h3>Select Keyboard Part Type:</h3>
    <form action="manageListings.jsp">
        <select name="selectPart">
            <option value="prebuilt">Prebuilt</option>
            <option value="pcb">PCB</option>
            <option value="stabilizers">Stabilizer</option>
            <option value="keycap">Keycap</option>
            <option value="kbcase">Case</option>
            <option value="accessories">Accessory</option>
        </select>
        <input type="submit" value="Select" name="selectPartButton">
    </form>

    <%
    String selectPart = request.getParameter("selectPartButton");
    if(selectPart != null && selectPart.equals("Select")){
       String partType = request.getParameter("selectPart");

        %>
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
                    <option value="fullSized">Full Sized</option>
                    <option value="numpad">Numpad</option>
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
        case "keycap":
            %>

            <%
            break;
        case "case":
            %>

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