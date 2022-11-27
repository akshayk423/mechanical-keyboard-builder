<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
    <div>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
          <a class="navbar-brand" href="/CS157A-team4/home.jsp">
              <img alt src="logo.png" width="50" height="50">
              Mechanical Keyboard Builder
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
              <li class="nav-item">
                <form action="login.jsp" method="post" value = "Sign Out" name="signOut">
                  <button type="submit" class="signOut" value = "Sign Out" name="signOut">Sign Out</button>
                </form>
              </li>
          </ul>
          </div>
        </div>
      </nav>
    </div>
    <form action="partPage.jsp">
        <input type="submit" value="View Part Page">
      </form>

    <h1>Add Entry:</h1>

    <form name="addEntry" action="partPage.jsp" method="post">
      <tr>
        <td>PartID:</td>
        <td><input type="text" name="iPartID"></td></br>
        <td>Name:</td>
        <td><input type="text" name="iSwitchType"></td></br>
        <td>SwitchType:</td>
        <td><input type="text" name="iStem"></td></br>

      </tr>
      <br></br>
      <input type="reset" value="Clear Input" name="clear">
      <input type="submit" value="Add Entry" name="submit">

    </form>

    <h1>Remove Entry:</h1>

    <form name="removeEntry" action="partPage.jsp" method="post">
        <td>PartID:</td>
        <td><input type="text" name="rPartID"></td></br>

        <input type="submit" value="Remove Entry" name="removeEntryButton">
    </form>

    
  </body>
</html>