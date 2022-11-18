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
                String id = 0000;
                while(!unique){
                    curId = String.format("%04d", random.nextInt(10000));
                    if(!idSet.contains(id)){
                        id = curId;
                        unique = true;
                        break;
                    }
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