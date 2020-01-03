<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

  
if(request.getParameter("userName") !=null && request.getParameter("password") != null){
      
    
    //sql = "SELECT * FROM members WHERE id='" +request.getParameter("id") + 
	//      "'  AND pwd='" + request.getParameter("pwd") + "'"  ; 
    sql = "SELECT * FROM member WHERE userName=? AND password=?";
	//' OR 1=1; #
	//out.println(sql);
	//out.close();//程式結束
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("userName"));
    pstmt.setString(2,request.getParameter("password"));
	
	ResultSet paperrs = pstmt.executeQuery();
	//ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        session.setAttribute("userName",request.getParameter("userName"));
        response.sendRedirect("../../member.jsp") ;
    }
    else
        response.sendRedirect("../../forget.html") ;
}
%>