<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>

    <form action="editPart.jsp">
      <input type="submit" value="Go to Edit Page">
    </form>

    <h1>Switch Parts</h1>

    <table border="1">
      <tr>
        <td>PartID</td>
        <td>Name</td>
        <td>SwitchType</td>
        <td>Brand</td>
        <td>Username</td>
        <td>Price</td>
        <td>Url</td>
    </tr>
    </table>
    <% 

    /*
    REFERENCES:
    https://www.tutorialspoint.com/how-to-insert-rows-into-a-resultset-in-jdbc
    https://www.youtube.com/watch?v=3ITdSQ3NmXU
    https://stackoverflow.com/questions/22691711/how-to-check-if-the-a-button-has-been-pressed-in-a-jsp-file
    */
     String db = "team4";
        String user; // assumes database name is the same as username
        //change these
          user = "root";
        String password = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.switches");
            
            //INSERT
            String submitted = request.getParameter("submit");
            if(submitted != null && submitted.equals("Add Entry")){
              String partID = request.getParameter("iPartID");
              String name = request.getParameter("iName");
              String type = request.getParameter("iSwitchType");
              String brand = request.getParameter("iBrand");
              String userName = request.getParameter("iUserName");
              String price = request.getParameter("iPrice");
              String url = request.getParameter("iUrl");

              rs.moveToInsertRow();
              rs.updateString(1, partID);
              rs.updateString(2, name);
              rs.updateString(3, type);
              rs.updateString(4, brand);
              rs.updateString(5, userName);
              rs.updateString(6, price);
              rs.updateString(7, url);
              rs.insertRow();
            }

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

            out.println("<br></br>");
            int i = 1;
            while (rs.next()) {
                out.println("row" + i + ": " + rs.getString(1) + ", " + rs.getString(2) + ", " + rs.getString(3) + ", " + rs.getString(4) + ", " + rs.getString(5) + ", " + rs.getString(6) + ", " + rs.getString(7) + "<br/><br/>");
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