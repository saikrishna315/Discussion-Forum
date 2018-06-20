<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        td
        {
            max-width: 400px;
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
             Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");           
        int k=Integer.parseInt(request.getParameter("id"));
     session.setAttribute("ld",k);
       Statement stmt=conn.createStatement();     
                 ResultSet rs=stmt.executeQuery("select *from ainsert where id='"+k+"'");           
             if(rs.next()==false)
          {
              out.println("<h2>");
              out.println("NO ANSWERS FOUND");
              out.println("</h2>");
                          %>
              <br>
                <a href="ansmid.jsp?pd=<%=k%>"><input type="button" name="qinsert" value="ANSWER THIS QUESTION"></a>
                 <br><br>
            <a href="newjsp1.jsp">go back to search</a> 
              <%
          }else{                
                 String que=rs.getString(4);
            out.println("<h2>");
                 out.println(que);
                 out.println("</h2>");
             %> 
                <table border="1"><tr><th>answer</th><th>name</th><th>email</th><th>date</th></tr><tr>
         <%
                do{             
                int ld=rs.getInt(1);               
                String ans=rs.getString(5); 
                         String uname=rs.getString(2); 
                              String email=rs.getString(3);
                                   String dt=rs.getString(6);                                   
                                  %>
                                 <td>                                   
                                  <%                                  
                                   out.println(ans);
                                   %>                                 
                                     </td>                                 
                                 <td>
                                  <%                               
                                   out.println(uname);
                                    %>
                                 </td><td>
                                  <%                                  
                                   out.println(email);
                                    %>
                                 </td> <td>
                                  <%                                  
                                   out.println(dt);                                   
                                 %>
                                 </td> </tr>
                                         <% 
                out.println("<br><br>");                
            }while(rs.next());
                %>
                </table><br>
     <a href="ansmid.jsp?pd=<%=k%>"><input type="button" name="qinsert" value="ANSWER THIS QUESTION"></a>
      <br><br>
            <a href="newjsp1.jsp">go back to search</a> 
           <%          
             }
        %>            
               <%
            conn.close(); 
        %>
        </div>
   </center>
    </body>
</html>
                                                    
                                            

                                                
