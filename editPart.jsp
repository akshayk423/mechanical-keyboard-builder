<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Switch Parts: Keyboard Part Picker</title>
    </head>
  <body>
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