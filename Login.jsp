<%   
if(session.getAttribute("kname")==null){
%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
        <style>
           #header
       {
           height:80;
           width: 100%;
           margin-top: 0px;
           padding-top: 0px;
           padding-left: 0px;
           border-style: outset;
           border-color: gray;
           border-width: 5px;
           margin-left: 20%;
       }
       #login
       {
           padding-left: 300px;           
       }
          body
        {
            width:70%;
        }
           #main
        {
         width:100%;
            margin-left:2%; 
            background-color: beige;
            background-size: 100% 100%;
    background-repeat: no-repeat;      
        border-style:solid;
          border-color: green;
          box-shadow: 5px 1px 1px #888888;
         margin-left: 20%;
         margin-top: 0%;
        }
    </style>
     </head>
    <body>   
        <div id="header">
            <table><tr><td>
            <img src="forum.gif" alt="#" height="80" width="400" /></td><td id="login"></td>
            </tr></table>
            </div>     
        <center>
        <div id="main">
        <form method="post" action="logincheck.jsp">
          <table><tr><td>
            username:</td><td><input type="text" name="uname" required="required"></td></tr>
          <tr><td>  password:</td><td><input type="password" name="pwd" required="required"></td></tr>
          <tr><td>user type :</td><td>  <select name="usertype">
                <option>student</option>
                <option>faculty</option>
               
            </select></td></tr>
        <tr><td> </td><td> <input type="submit" name="submit" value="Login"></td></tr>
        </form>
            </table>
        </center>
    </body>
</html>
<%
}else{
     response.sendRedirect("askque.jsp");
}
%>
