<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <form method="post">

    <h1>Login:</h1>

    <td>Username:</td>
    <td><input type="text" name="iUserName"></td></br>
    <td>Password:</td>
    <td><input type="text" name="iPassword"></td></br>

    <input type="submit" value="Sign In" name="signIn">
    <input type="submit" value="Sign Up" name="signUp">
    
    </form>
  </body>
  <% 
            String user = "root";
            String password = "password";
            try {
                java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.users");
                
                String sign = request.getParameter("signIn");
                if(sign != null && sign.equals("Sign In")){
                    String inputUser = request.getParameter("iUserName");
                    String inputPass = request.getParameter("iPassword");
                    //find the ID
                    rs.beforeFirst();
                    out.println("<br></br>");
                    boolean flag = true;
                    while(rs.next()){
                        if(inputUser.equals(rs.getString(1)) && inputPass.equals(rs.getString(2))){
                            response.sendRedirect("success.jsp");
                            flag = false;
                            break;
                        }
                    }
                    if(flag){
                        out.println("Incorrect Username and Password");
                    }
                }

                sign = request.getParameter("signUp");
                if(sign != null && sign.equals("Sign Up")){
                    response.sendRedirect("signup.jsp");
                }

                //IF USER REGISTERD FROM signup.jsp
                sign = request.getParameter("register");
                if(sign != null && sign.equals("Sign Up")){
                    String inputMail = request.getParameter("iMail");
                    String inputUser = request.getParameter("iUser");
                    String inputPass = request.getParameter("iPass");

                    rs.moveToInsertRow();
                    rs.updateString(1, inputMail);
                    rs.updateString(2, inputUser);
                    rs.updateString(3, inputPass);
                    rs.insertRow();
                }


                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) { 
                out.println("SQLException caught: " + e.getMessage()); 
            }
  %>

</html>