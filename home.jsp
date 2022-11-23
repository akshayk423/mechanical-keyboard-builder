<%@ page import="java.sql.*"%>

<html>
  <head>
    <title>Home Page</title>
    </head>
  <body>
    <form action="login.jsp" method="post">
      <button type="submit" value = "Sign Out" name="signOut">Sign Out</button>
    </form>
    <h1>Home Page</h1>
    <form action="partlists.jsp">
        <input type="submit" value="Home to part lists">
    </form>
    <form action="bookmarks.jsp">
      <input type="submit" value="Home to bookmarks">
    </form>
    <form action="manageListings.jsp">
      <input type="submit" value="Home to manage listings">
    </form>
    
  </body>
</html>