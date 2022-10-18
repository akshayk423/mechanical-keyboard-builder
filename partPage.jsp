<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <h1>Switch Parts</h1>

    <form name="myForm" action="partPage.jsp" method="post">
      <tr>
        <td>Name:</td>
        <td><input type="text" name="iName"></td></br>
        <td>SwitchType:</td>
        <td><input type="text" name="iSwitchType"></td></br>
        <td>Brand:</td>
        <td><input type="text" name="iBrand"></td></br>
        <td>UserName:</td>
        <td><input type="text" name="iUserName"></td></br>
        <td>Price:</td>
        <td><input type="text" name="iPrice"></td></br>
        <td>URL:</td>
        <td><input type="text" name="iUrl"></td></br>
        <td>PartID:</td>
        <td><input type="text" name="iPartID"></td></br>

      </tr>
      <br></br>
      <input type="reset" value="Clear Input" name="clear">
      <input type="submit" value="Add Entry" name="submit">

    </form>

    <table border="1">
      <tr>
        <td>Name</td>
        <td>SwitchType</td>
        <td>Brand</td>
        <td>userName</td>
        <td>Price</td>
        <td>Url</td>
        <td>PartID</td>
    </tr>
    </table>
    <% 
     String db = "team4";
        String user; // assumes database name is the same as username
        //change these
          user = "root";
        String password = "157a1965";
        try {
            
            String name = request.getParameter("iName");
            String type = request.getParameter("iSwitchType");
            String brand = request.getParameter("iBrand");
            String userName = request.getParameter("iUserName");
            String price = request.getParameter("iPrice");
            String url = request.getParameter("iUrl");
            String partID = request.getParameter("iPartID");

            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.switches");
            
            //INSERT
            rs.moveToInsertRow();
            rs.updateString(1, name);
            rs.updateString(2, type);
            rs.updateString(3, brand);
            rs.updateString(4, userName);
            rs.updateString(5, price);
            rs.updateString(6, url);
            rs.updateString(7, partID);
            rs.insertRow();

            //VIEW ROWS
            //move cursor back to first position
            rs.beforeFirst();

            out.println("<br></br>");
            int i = 1;
            while (rs.next()) {
                out.println("row" + i + ": " + rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5) + " " + rs.getString(6) + " " + rs.getString(7) + "<br/><br/>");
                i++;
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