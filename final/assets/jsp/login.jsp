<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <title></title>
  </head>
  <body>
<%
if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
    sql = "SELECT * FROM `customers` WHERE `CustomersAccount`=? AND `CustomersPassword`=?";
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("id"));
    pstmt.setString(2,request.getParameter("pwd"));
	ResultSet paperrs = pstmt.executeQuery();
	
	sql = "SELECT * FROM `managers` WHERE `ManagersAccount`=? AND `ManagersPassword`=?";
    PreparedStatement mpstmt = null;
	mpstmt=con.prepareStatement(sql);
    mpstmt.setString(1,request.getParameter("id"));
    mpstmt.setString(2,request.getParameter("pwd"));
	ResultSet mpaperrs = mpstmt.executeQuery();
    
    if(paperrs.next()){            
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("../../pages/member.jsp") ;
    }
	else if(mpaperrs.next()){            
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("../../pages/backstage01.jsp") ;
    }
    else{
        con.close();//結束資料庫連結
		out.println("<script type='text/javascript'>");
			out.println("alert('請重新登入!');location.href='../../pages/index.jsp'; ");
		out.println("</script>");
	}
}
%>
  </body>
</html>