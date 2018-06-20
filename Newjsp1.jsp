<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@page import="java.sql.*" %>
    <style>
       
        table
        {
            padding:0px;
            margin: 0px;
          //  border: dotted;
          //  border-color: black;
            
        }
        tr
        {
            padding:0px;
            margin: 0px;
            
        }
        #question
       {
         min-width:40%;
           height:30px;
           font-size:120%;
           font-family: calibri;
           border-radius: 8px;

       }
       #search
       {
           height:80px;
          width:100%; 
       }
       p
       {
           padding:0px;
       }
       #submit
       {
           height:35px;
          min-width:12%;
           border-radius: 8px;
           font-size: 15px;
           font-family: times new roman;
          padding:2px; 
       
       }
       #qinsert{
          background-color: gray;
          margin-top: 10px;
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
        }
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
             <div id="search">
          <center>
            <form method="post" action="newjsp1.jsp">
           <div id="search2"> 
           <p>search question here <input type="text" id="question" name="question">
       <input type="submit" id="submit" value="search" ></p>
            </div>
            </form>
              </center>
            
        </div>
        <%
            
            String question=request.getParameter("question"); 
             if(question== null){
                     out.println("recent questions");
                     Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");
                     Statement prestmt=conn.createStatement();  
             ResultSet ps=prestmt.executeQuery("select *from qinsert order by id desc limit 15");
            
               %>
                <table border=1>
               <%
                                   while(ps.next()) 
            {
              
               String ques=ps.getString(4);
                 String user=ps.getString(2);
                  String email=ps.getString(3);
                Integer kd=ps.getInt(1);
                String dat=ps.getString(5);
                %>
                
             <tr><td>
                     <%
            out.println(kd);
           
                     %>
                 </td><td>
            <a href="sample.jsp?id=<%= kd %>">

                    <%
                    out.println(ques);                    
                    %>
               </a></td>                   
             <td>
                     <%
            out.println(user);           
                     %>
                 </td>                   
             <td>
                     <%
            out.println(email);
           
                     %>
                 </td>      
             <td>
                     <%
            out.println(dat);           
                     %>
                 </td>
                </tr>               
             <% 
                           }            
             %>
            </table>
                          <%
             } else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/discussion2","root","");         
            Statement stmt=conn.createStatement();          
            ResultSet rs=stmt.executeQuery("select *from qinsert where question like '%" +question+ "%' order by id desc");         
                
            if(rs.next()==false)
          { %>
          <%              
              out.println("NO RESULTS FOUND");

          }else{
            %>
                <table border=1>
               <%
            
                out.println("your search results");
                    do  
            {
              
               String ques=rs.getString(4);
                 String user=rs.getString(2);
                  String email=rs.getString(3);
                Integer kd=rs.getInt(1);
                String dat=rs.getString(5);
                %>                
             <tr><td>
                     <%
            out.println(kd);
           
                     %>
                 </td><td>
            <a href="sample.jsp?id=<%= kd %>">
                    <%
                    out.println(ques);
                  
                    %>
               </a></td>
                   
             <td>
                     <%
            out.println(user);           
                     %>
                 </td>
             <td>
                     <%
            out.println(email);
           
                     %>
                 </td>      
             <td>
                     <%
            out.println(dat);
           
                     %>
                 </td>
                </tr>
                              
             <% 
               
            }while(rs.next());
            
             %>
            </table>
            <%
                       }}
           
        %>
        <div id="qinsert">
      <a href="login.jsp" target="_blank"><input type="button" name="qinsert" value="ASK ME IF YOU DONT FIND YOUR QUESTION HERE"></a>
      </div>
        </div>
           </center>
          </body>
</html>
