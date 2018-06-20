<%   
if(session.getAttribute("kname")==null)
    response.sendRedirect("login.html");
else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*" %>
   
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
         padding-top: 30px;
         padding-bottom: 30px;
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
            String question=request.getParameter("question");
             java.util.Date date = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date( date.getTime() );
            Class.forName("com.mysql.jdbc.Driver")
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");           
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select *from idgenerator");
            while(rs.next()){
                int id=rs.getInt(1);           
           String kname=(String)session.getAttribute("kname");
            String email=(String)session.getAttribute("email");
                String sql="insert into qinsert values(?,?,?,?,?)";
            PreparedStatement pstmt=conn.prepareStatement(sql);
           pstmt.setInt(1,id);
         pstmt.setString(2,kname);
         pstmt.setString(3,email);
           pstmt.setString(4,question);
        pstmt.setDate(5,sqlDate);
          int newid= id+1;       
                   String ustmt="update idgenerator set id=?;";
           PreparedStatement uustmt=conn.prepareStatement(ustmt);
           uustmt.setInt(1,newid);
           uustmt.executeUpdate();
           pstmt.executeUpdate();
           out.println("<h1>your question posted successfully</h1>");
           pstmt.close();
            uustmt.close();
            } 
           conn.close();           
            %>
             <a href="newjsp1.jsp">go back to search</a> 
            </center>
    </body>
</html>
<%
}           
%>
