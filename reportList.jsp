
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Report Listings</title>
    <script>
        function del(s) {
            console.log(s);
        }
    </script>
    </head>
  <body>
    <%if(session.getAttribute("modUser") == null){
        %><h1>No Permission To Access Page</h1><%
    }else{%>
    <form action="modlogin.jsp" method="post">
    <button type="submit" value = "Sign Out" name="signOut">Sign Out</button>
    </form>
    <h1>Report Listings</h1>
    <table border="1">
        <thead>
          <tr>
            <td>ReportID</td>
            <td>PartID</td>
            <td>Name</td>
            <td>URL</td>
            <td>Brand</td>
            <td>Price</td>
            <td>Seller</td>
            <td>Remove Listing:</td>
          </tr>
        </thead>
        <tbody>
            <% 
            String db = "team4";
            String user;
            user = "root";
            String password = "157a1965";
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings");

            try {
                // rs.beforeFirst();
                // rs.next();
                // String asd = rs.getString(2);
                // String fds = asd.charAt(0) + "" + asd.charAt(1);
                // out.println(fds);

                // Map<String, String> dict = new HashMap<String, String>();
                // dict.put("SW", "switches");
                // dict.put("PB", "prebuilt");
                // dict.put("PC", "pcb");
                // dict.put("SB", "stabilizers");
                // dict.put("KC", "keycap");
                // dict.put("CS", "kbcase");
                // dict.put("AC", "accessories");

                // rs = stmt.executeQuery("SELECT * FROM mkdb." + dict.get(fds));

            String removed = request.getParameter("removeReport");
            if(removed != null && removed.equals("Remove Report")){
                String id = request.getParameter("partID");

                String prefix = id.charAt(0) + "" + id.charAt(1);

                Map<String, String> dict = new HashMap<String, String>();
                dict.put("SW", "switches");
                dict.put("PB", "prebuilt");
                dict.put("PC", "pcb");
                dict.put("SB", "stabilizers");
                dict.put("KC", "keycap");
                dict.put("CS", "kbcase");
                dict.put("AC", "accessories");

                rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings");
                rs.beforeFirst();
                boolean couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in Report Listings, nothing was deleted<br>");
                }

                //delete from keyboard part table
                rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");
                rs.beforeFirst();
                couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in keyboard parts, nothing was deleted<br>");
                }
                
                //something was deleted in reported listing, therefore also delete in listings
                rs = stmt.executeQuery("SELECT * FROM mkdb." + dict.get(prefix));
                rs.beforeFirst();
                couldNotFind = true;
                while(rs.next()){
                  if(id.equals(rs.getString("PartID"))){
                    rs.deleteRow();
                    couldNotFind = false;
                    break;
                  }
                }
                if(couldNotFind){
                  out.println("Could not find ID: " + id + " in " + dict.get(prefix) + ", nothing was deleted<br>");
                }
            }

                rs = stmt.executeQuery("SELECT * FROM mkdb.reportlistings NATURAL JOIN mkdb.keyboardpart");
                rs.beforeFirst();
                while (rs.next()) {
                    String name = rs.getString("name");
                    if(name.length() > 40){ name = name.substring(0,40) + "...";}
                    String url = rs.getString("URL");
                    if(url.length() > 40){ url = url.substring(0,40) + "...";}
                    %>
                    <tr>
                        <td><%=rs.getString("ReportListID")%></td>
                        <td><%=rs.getString("PartID")%></td>
                        <td><%=name%></td>
                        <td><a href=<%=rs.getString("URL")%>>(<%=url%></td>
                        <td><%=rs.getString("brand")%></td>
                        <td><%=rs.getString("price")%></td>
                        <td><%=rs.getString("username")%></td>
                        <td>
                            <form action='reportList.jsp' method='post'>
                            <input type='submit' value='Remove Report' name='removeReport'>
                            <input type='hidden' value="<%=rs.getString("PartID")%>" name='partID'>
                            </form>
                        </td>
                    </tr>
                <%
                }
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