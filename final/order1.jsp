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
	
	sql="SELECT * FROM  shoppingcar where name='"+userName+"'";
		
		ResultSet rs=con.createStatement().executeQuery(sql);
	
	rs.last();
	int n=rs.getRow();
	
	
	sql="SELECT * FROM  shoppingcar where name='"+userName+"' ORDER BY orNum ASC  ";
		
		ResultSet rs1=con.createStatement().executeQuery(sql);
		
		
		
    %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="icon" href="image/logo.ico" type="image/x-icon" / >
		<!-- Required meta tags -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
		<title>訂貨</title>
		<script src="assets/js/detect.js"></script>
		<style>
			@import url(assets/css/order.css);
			@import url(assets/css/final.css);
			@import url(assets/css/text.css);
		</style>
	</head>
	<body>
		<!-- 導覽欄 -->
		<div class="top">
			<nav class="navbar navbar-expand-lg navbar-light bg-light d-flex justify-content-between">
				<a class="navbar-brand" href="index.jsp"><img src="image/image0.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mr-auto" style="align-items: center;">
						<li class="nav-item">
							<a class="nav-link" href="act1.html">優惠活動</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="act2.html">最新消息</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								全部商品
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="goodsall.jsp">全部</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="goods1.jsp">筆</a>
								<a class="dropdown-item" href="goods2.jsp">筆記本</a>
								<a class="dropdown-item" href="goods3.jsp">便利貼</a>
								<a class="dropdown-item" href="goods4.jsp">筆袋</a>
								<a class="dropdown-item" href="goods5.jsp">其他</a>
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								會員專區
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="member.jsp">基本資料</a>
								<a class="dropdown-item" href="function/mycollect.jsp">我的收藏</a>
								<a class="dropdown-item" href="function/myshoppingcar.jsp">購物車</a>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="contact.html">關於我們</a>
						</li>
					</ul>
					<form class="form-inline my-2 my-lg-0 mr-0">
						<ul  class="navbar-nav mr-0 list-group-horizontal">
							<li class="nav-item">
								<a class="nav-link" href="member.jsp"><img src="image/image2.png" alt=""></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="function/myshoppingcar.jsp"><img src="image/image3.png" alt=""></a>
							</li>
						</ul>
					</form>
				</div>
			</nav>
		</div><br>
		<!-- 內容 -->
		<div class="container">
			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th>商品資料</th>
							<th>單件價格</th>
							<th>數量</th>
							<th>小計</th>
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
							out.println("<td>NT$"+rs1.getString(4)+"</td>");
							out.println("<td>"+rs1.getString(5)+"</td>");
							out.println("<td>NT$"+rs1.getString(6)+"</td>");
						out.println("</tr>");
						total=total+rs1.getInt(6);
					}
					}
						out.println("<tr>");
							out.println("<td colspan='3'></td>");
							out.println("<td colspan='1'>運費:60<br>合計:"+(total+60)+"</td>");
						out.println("</tr>");
						%>
						<tr>
							<td colspan="2"><a href="shoppingcar.jsp?name1=<%=userName%>" class="go"><返回購物車</a></td>
							<td colspan="2" style="text-align: right;"><a href="goodsall.jsp" class="go">Go Shopping</a></td>
						</tr>
					</tbody>
				</table>
			</div><br>
			<form  class="needs-validation" novalidate action="function/newOr.jsp?name1=<%=userName%>" method="POST">
				<div class="row px-5 py-5" style="border: 1px solid black;">
					<div class="col-md-6">
						<h3>顧客資料</h3>
						<label for="exampleInputName">名稱</label>
						<p><%=name%></p>
						<label for="exampleInputEmail">信箱</label>
						<p><%=mail%></p>
						<label for="exampleInputPhone">手機</label>
						<input type="text" style="width: 60%;" name="relTel" class="form-control" id="exampleInputPhone" placeholder="phone" required>
					</div>
					<div class="col-md-6 my-auto">
						<label for="exampleInputAdd">收件地址</label>
						<input type="text" style="width: 60%;" name="relAdd"class="form-control" id="exampleInputAdd" placeholder="Address" required><br>
						<label>送貨方式:宅配</label><br>
						<label>付款方式:貨到付款</label><br><br>
						<label for="exampleInputNote">訂單備註</label>
						<input class="form-control" type="text" placeholder="?" name="notes"id="exampleInputNote" style="width: 60%;">
					</div>
				</div><br>
				<div class="row justify-content-end">
					<button type="submit" class="btn btn-info">提交訂單</button>
				</div>
			</form>
		</div><br>
		<!-- footer -->
		<div class="foot">
			<div class="container-fluid">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<br>
							<h2><b>服務專線</b></h2>
							<h2><b>0800-056-868</b></h2>
							<p>	客服時間/週一~週五10:00-12:00，13:00~17:00<br>
								客服信箱/   @gmail.com<br>
							客服電話/0800-056-868</p>
							<a href=""><img src="image/image4.png"></a>&nbsp;&nbsp;
							<a href=""><img src="image/image6.png" alt=""></a>&nbsp;&nbsp;
							<a href=""><img src="image/image5.png"></a><br><br>
							<p>Copyright &copy; 2019 All Rights Reserved Design By MEOW</p>
						</div>
					</div>
				</div>
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
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
	</body>
</html>