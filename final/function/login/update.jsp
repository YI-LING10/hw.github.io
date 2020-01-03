<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("userName") != null ){
    if(request.getParameter("userName")!=null){
    sql = "UPDATE `member` SET `userName`='"+request.getParameter("userName")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);
    sql = "UPDATE `member` SET `password`='"+request.getParameter("password")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `name`='"+request.getParameter("name")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `sex`='"+request.getParameter("customRadioInline1")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `birth`='"+request.getParameter("birth")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `mail`='"+request.getParameter("mail")+"' WHERE `userName`='"+session.getAttribute("userName")+"'";
	con.createStatement().execute(sql);	
	response.sendRedirect("../../member.jsp") ;
	}
	else{
	out.print("更新失敗!! 請填寫完整，<a href='../../member.jsp'>按此</a>回會員頁面!!");
	}

}
else{
	response.sendRedirect("../../registered_again.html") ;
}
%>