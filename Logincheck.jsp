<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <img src="forum.gif" alt="#" height="80" width="400" /></td><td id="login"></td>
            </tr></table>
            </div>
              <center>
        <div id="main">
<%
    String uid = request.getParameter("uname");
    String pwd = request.getParameter("pwd");
    String utype=request.getParameter("usertype");
  String s="student";
    String f="faculty";
      String a="admin";
  if(s.equals(utype)){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select *from userlogin where uname='"+uid+"' and password='"+pwd+"'");  
   if(rs.next()){
 String name=rs.getString(3); 
 String email=rs.getString(4); 
  out.println("<h5>"+name+"</h5>"); 
session.setAttribute("email",email); 
  session.setAttribute("kname",name);       
session.setAttribute("yname",uid); 
session.setAttribute("pname",pwd); 
response.sendRedirect("newjsp1.jsp");
    }
       else
   {
       out.println("<h1>login failed</h1>");
       out.println("<br><a href='login.jsp'>click here login again</a>");
   }
    rs.close();
    stmt.close();
    conn.close();
    }    
        if(f.equals(utype)){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select *from userfaculty where uname='"+uid+"' and password='"+pwd+"'");  
   if(rs.next()){
  String name=rs.getString(3); 
  String email=rs.getString(4); 
session.setAttribute("kname",name);       
session.setAttribute("yname",uid); 
session.setAttribute("pname",pwd);
response.sendRedirect("newjsp1.jsp");
out.println("<h5>"+name+"</h5>"); 
    }
       else
   {
       out.println("<h1>login failed</h1>");
       out.println("<br><a href='login.jsp'>click here login again</a>");
   }
    rs.close();
    stmt.close();
    conn.close();
    } 
         if(a.equals(utype)){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select *from admin where uname='"+uid+"' and password='"+pwd+"'");  
   if(rs.next()){
 String name=rs.getString(1); 
 
  session.setAttribute("kname",name);       
 

response.sendRedirect("admin.jsp");
    }
       else
   {
       out.println("<h1>login failed");
       out.println("</h1><br><a href='adminlogin.jsp'>click here login again</a>");
   }
    rs.close();
    stmt.close();
    conn.close();
    }        
%>
      <div>
          </center>
        </body>
</html>
