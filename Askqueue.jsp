<%   
if(session.getAttribute("kname")==null)
    response.sendRedirect("login.jsp");
else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> <head>
        <title>ask question</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@page import="java.sql.*" %>
        <style>
        .qi{
            width:40%;
            height:50px;
                 font-size: 20px;
        } #header
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
        
        b
        {
       font-size:25px;
        }
    </style>
     </head>
    <body>
   
        <div id="header">
            <table><tr><td>
            <img src="forum.gif" alt="#" height="80" width="400" /></td><td id="login"><a href="logout.jsp">logout</a></td>
            </tr></table>
            </div>     
        <center>
        <div id="main">   
            <%
    out.println("Welcome");
           out.println(session.getAttribute("kname"));  
                                              %>    
            <form action="qinsert.jsp" method="POST">
           <br><br>
          <b>your question</b><input type="text" name="question" required="required" class="qi" id="qi"/>
                <input type="submit" value="submit">                   
            </form>
             <br><br>
            <a href="newjsp1.jsp">go back to search</a>             
        </div>
        </center>
    </body>
</html>
<%
}           
%>
