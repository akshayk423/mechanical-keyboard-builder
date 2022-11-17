<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Bookmarks</title>
    <script>
        function del(s) {
            console.log(s);
        }
    </script>
    </head>
  <body>
    <h1>Bookmarks</h1>
    <form action="bookmarks.jsp">
        <td>PartID:</td>
        <td><input type="text" name="removeBookmarkPartID"></td></br>
        <input type="submit" value="Delete bookmark">
    </form>
    <table border="1">
        <thead>
          <tr>
            <td>PartID</td>
            <td>Price</td>
            <td>Remove bookmark</td>
          </tr>
        </thead>
        <tbody>
            <% 
            String db = "team4";
            String user;
            user = "root";
            String password = "password";

            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.bookmarks");
            
            String removed = request.getParameter("removeBookmarkButton");
            if(removed != null && removed.equals("Remove Bookmark")){
                String id = request.getParameter("removeBId");
                String s = "1";
                rs.beforeFirst();
                boolean flag = true;
                while(rs.next()){
                  if(id.equals(rs.getString(1))){
                    rs.deleteRow();
                    flag = false;
                    break;
                  }
                }
                if(flag){
                  out.println("Could not find ID: " + id + ", nothing was deleted");
                }
            }
            
            try {
                rs.beforeFirst();
                int i = 1;
                while (rs.next()) {
                %>
                    <tr>
                        <td><%out.println(rs.getString(1));%></td>
                        <td><%out.println(rs.getString(2));%></td>
                        <td>
                        <%
                            out.println("<form action='bookmarks.jsp?removeBId=" + rs.getString(1) + "' method='post'><input type='submit' value='Remove Bookmark' name='removeBookmarkButton'></form>");
                        %>
                        </td>
                    </tr>
                <%
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