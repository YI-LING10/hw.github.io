<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
	String userName="", password="";
	while(paperrs1.next()){
	    //name=paperrs1.getString(1);
	    userName=paperrs1.getString("userName");
		password=paperrs1.getString("password");
	}

%>
哈囉，<%=userName%>，<a href='logout.jsp'>登出</a><br />
請修改會員資料：<br />
<form action="update.jsp" method="POST">
您的姓名：<input type="text" name="userName" value="<%=userName%>" />
您的密碼：<input type="password" name="password" value="<%=password%>" />
<input type="submit" name="b1" value="更新資料" />
</form>
<%
}
else{
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="userName" /><br />
密碼：<input type="password" name="password" /><br />
<input type="submit" name="b1" value="登入" />
</form>

<%
}
%>
