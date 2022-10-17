<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <h1>Switch Parts</h1>
    
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

   <button>add new entry</button>
    <% 
    //change this
     String db = "team4";
        String user; // assumes database name is the same as username
        //change these
          user = "root";
        String password = "157a1965";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"switches\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.switches");
            out.println("<br></br>");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getDouble(5) + " " + rs.getString(6) + " " + rs.getString(7) + "<br/><br/>");
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