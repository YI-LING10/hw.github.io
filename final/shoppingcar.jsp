<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>


<%
if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
	String userName="", password="",name="",sex="",birth="",mail="";
	while(paperrs1.next()){
	    userName=paperrs1.getString("userName");
		password=paperrs1.getString("password");
		name=paperrs1.getString("name");
		sex=paperrs1.getString("sex");
		birth=paperrs1.getString("birth");
		mail=paperrs1.getString("mail");
	}

%>

<%

	String name1 = new String(request.getParameter("name1").getBytes("ISO-8859-1"),"UTF-8");  
	
	sql="SELECT * FROM  shoppingcar where name='"+userName+"'";//LIMIT是限制傳回筆數
		
		ResultSet rs=con.createStatement().executeQuery(sql);
	
	rs.last();
	int n=rs.getRow();
	
	int n1=(int)Math.ceil((double)n/5.0);
	if (n1==0) 
		n1=1;
	
	String p_string = request.getParameter("page1");  
		if (p_string == null) 
			p_string = "1";  //無留言時將頁數指標訂為1      
		Integer c_page=Integer.valueOf(p_string);
		int s_record=(c_page-1)*5;
	
	sql="SELECT * FROM  shoppingcar where name='"+userName+"' ORDER BY orNum ASC  ";//LIMIT是限制傳回筆數
		
		ResultSet rs1=con.createStatement().executeQuery(sql);
		
		
		
    %>



<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="icon" href="image/logo.ico" type="image/x-icon" / >
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title>會員專區-我的收藏</title>
		<style>
			@import url(assets/css/text.css);
		</style>
	</head>
	<body>
		<!-- 導覽頁 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="image/image0.png" alt="" style="width: 300px; height:100px;">
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="index.jsp">首頁</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="act1.html">優惠活動</a>
						<a class="dropdown-item" href="act2.html">最新消息</a>
						<a class="dropdown-item" href="goodsall.jsp">全部商品</a>
						<a class="dropdown-item" href="contact.html">關於我們</a>
					</div>
				</li>
			</ul>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 20px;">
				<ul class="navbar-nav ml-5">
					<li class="nav-item">
						<a class="nav-link" href="member.jsp">基本資料</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-5">
					<li class="nav-item">
						<a class="nav-link" href='function/mycollect.jsp'>我的收藏</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-5">
					<li class="nav-item">
						<a class="nav-link" href="record.html">購買紀錄</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-5">
					<li class="nav-item">
						<a class="nav-link" href="function/myshoppingcar.jsp">
							<img src="image/image3.png" alt="" style="width: 35px; height:35px;">
						</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-5 mr-5">
					<li class="nav-item">
						<a class="nav-link" href="function/login/logout.jsp">登出</a>
					</li>
				</ul>
			</div>
		</nav><br>
		<!-- 內容 -->
		<div class="container">
			<h1>購物車</h1><br>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							
							<th>商品名稱</th>
							<th>價格</th>
							<th>數量</th>
							<th>小計</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<%
					int total=0;
					for(int i=0;i<n;i++ )
					{	
					while(rs1.next())
					{
						out.println("<tr>");
							
							out.println("<td>"+rs1.getString(3)+"</td>");
							out.println("<td>"+rs1.getInt(4)+"</td>");
							out.println("<td>"+rs1.getInt(5)+"</td>");
							out.println("<td>"+rs1.getInt(6)+"</td>");
							out.println("<td>");
								out.println("<a href='function/DelCar.jsp?no="+rs1.getString(2)+"'><button type='button' class='btn btn-outline-danger'>刪除</button></a>");
							out.println("</td>");
						out.println("</tr>");
						total=total+rs1.getInt(6);
					}
					}
					
					out.println("</tbody>");
					out.println("<tfoot>");
					out.println("<tr>");
						out.println("<td class='blockquote text-right' colspan='5'>總計:"+total+"</td>");
					out.println("</tr>");
					out.println("</tfoot>");
					%>
				</table>
			</div>
			<div class="row justify-content-md-center">
				<a href="order1.jsp?name1=<%=userName%>" style="width: 1000px;"><button type="button" class="btn btn-info btn-block">結帳</button></a>
			</div>
		</div>
		<%
}
else{
	response.sendRedirect("registered_again.html") ;
}
%>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>