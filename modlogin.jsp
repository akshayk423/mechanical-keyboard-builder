<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Moderator Login</title>
    </head>
  <body>
    <form method="post">

    <h1>Moderator Login:</h1>

    <td>Username:</td>
    <td><input type="text" name="modUsername"></td></br>
    <td>Password:</td>
    <td><input type="text" name="modPassword"></td></br>

    <input type="submit" value="Sign In" name="signIn">
    </form>
  </body>
  <% 
            //set username and password
            String user = "root";
            String password = "157a1965";
            try {
                java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.moderators");
                
                String sign = request.getParameter("signIn");
                if(sign != null && sign.equals("Sign In")){
                    String inputUser = request.getParameter("modUsername");
                    String inputPass = request.getParameter("modPassword");
                    //find the ID
                    rs.beforeFirst();
                    out.println("<br></br>");
                    boolean flag = true;
                    while(rs.next()){
                        if(inputUser.equals(rs.getString(1)) && inputPass.equals(rs.getString(2))){
                            session.setAttribute("modUser", inputUser);
                            response.sendRedirect("reportList.jsp");
                            flag = false;       
                            break;
                        }
                    }
                    if(flag){
                        out.println("Incorrect Username and Password");
                    }
                }

                sign = request.getParameter("signOut");
                if(sign != null && sign.equals("Sign Out")){
                    out.println("Logged Out"); 
                    session.invalidate();
                }

                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) { 
                out.println("SQLException caught: " + e.getMessage()); 
            }
  %>

</html>