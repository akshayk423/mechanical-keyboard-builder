<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>Manage Listings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
      .btn-secondary {
          color: #000;
          background-color: #ffc1078a!important;
          border-color: #ffc1078a!important;
      }
      .bg-light{
          background-color: #7A62CB!important  ;
      }

      .navbar-brand{
          color:aliceblue!important;
          --bs-navbar-brand-hover-color: yellow!important;
      }

      .navbar-brand .nav-item:hover{
          color: pink!important;
      }

      .nav-link{
          color:aliceblue!important;
      }

      .navbar-nav .nav-link.active, .navbar-nav .show>.nav-link {
          color:aliceblue!important;
      }

      .navbar-nav{
          --bs-nav-link-hover-color: yellow!important;
      }

      button, input, optgroup, select, textarea {
          margin: 10;
          font-family: inherit;
          font-size: inherit;
          line-height: inherit;
      }
      .btn-secondary:not(:disabled):not(.disabled).active, .btn-secondary:not(:disabled):not(.disabled):active, .show>.btn-secondary.dropdown-toggle {
          color: #000;
          background-color: #ffc1078a!important;
          border-color: #ffc1078a!important;
      }

      .btn {
          padding-top: 0.15rem!important;
          padding-right: 0.15rem!important;
          padding-bottom: 0.15rem!important;
          padding-left: 0.15rem!important;
      }

      .signOut {
        border: none;
        background: none;
        color:aliceblue!important;
      }
      .move{
        margin: 0;
        position: absolute;
        left: 1%;
      }
      th, td {
            padding: 5px;
        }

    </style>
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

    <div class="move">
    <h1>Manage Listings:</h1>
    <hr></hr>
    <% 
     String user = (String) session.getAttribute("dbuser");
     String password = (String) session.getAttribute("dbpassword");
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mkdb?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("SELECT * FROM mkdb.keyboardpart");

            String edit = request.getParameter("editPrebuilt");
            if(edit != null && edit.equals("Edit Listing")){
              out.println(request.getParameter("partID"));
            }
                    
            
            <form action='editPrebuilt.jsp' method='post'>
                            <input type='submit' class="btn btn-primary" value='Edit Listing' name='editPrebuilt'>
                            <input type="hidden" class="btn btn-primary" name="partID" value="<%=rs.getString(1)%>">
                            </form>
            
            
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    </div>
  </body>
          
</html>