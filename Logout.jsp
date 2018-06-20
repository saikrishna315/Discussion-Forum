<%   
if(session.getAttribute("kname")==null)
    response.sendRedirect("login.jsp");
else{
    session.invalidate();
    response.sendRedirect("login.jsp");
}
%>
