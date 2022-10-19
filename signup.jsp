<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <form action="login.jsp" method="post">

    <h1>Sign Up:</h1>

    <td>Email:</td>
    <td><input type="text" name="iMail"></td></br>
    <td>Username:</td>
    <td><input type="text" name="iUser"></td></br>
    <td>Password:</td>
    <td><input type="text" name="iPass"></td></br>

    <input type="submit" value="Sign Up" name="register">
    
    </form>
    <form action="login.jsp" method="post">
        <input type="submit" value="Back to Login" name="signUpToLogin">
    </form>
  </body>
  </html>