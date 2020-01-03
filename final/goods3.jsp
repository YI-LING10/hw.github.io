<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>

<%
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           
		   
		   sql="SELECT * FROM products WHERE no BETWEEN '6' AND '9'"; //算出共幾筆
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
          
		  
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
		<title>商品-便利貼</title>
		<script src="assets/js/goodsall.js"></script>
		<style>
			@import url(assets/css/goodsall.css);
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
		</div>
		<!-- 商品 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2 mt-5">
					<a href="goodsall.jsp"><img class="rounded ml-3 d-block" src="image/goodall.jpg" >&nbsp;&nbsp;&nbsp;全部</a><br>
					<a href="goods1.jsp"><img class="rounded ml-3 d-block" src="image/good1.jpg" >&nbsp;&nbsp;&nbsp;筆</a><br>
					<a href="goods2.jsp"><img class="rounded ml-3 d-block" src="image/good2.jpg">&nbsp;&nbsp;&nbsp;筆記本</a><br>
					<a href="goods3.jsp"><img class="rounded ml-3 d-block" src="image/good3.jpg">&nbsp;&nbsp;&nbsp;便利貼</a><br>
					<a href="goods4.jsp"><img class="rounded ml-3 d-block" src="image/good4.jpg">&nbsp;&nbsp;&nbsp;筆袋</a><br>
					<a href="goods5.jsp"><img class="rounded ml-3 d-block" src="image/good5.jpg">&nbsp;&nbsp;&nbsp;其他</a>
				</div>
				<div class="col-md-10">
					<h2 class="ml-3 my-3">便利貼</h2>
					<%
								for(int i=0;i<4;i++ )
								{
									
									out.println("<div class='row'>");
									
									while(rs.next()){
										
										out.println("<div class='col-md-4'>");
										out.println("<div class='card'>");
										out.println("<a href='goods.jsp?page="+rs.getString("no")+"' target='_blank'><img src='"+rs.getString("proPic1")+"' class='card-img-top'></a>");
										out.println("<div class='card-body'>");
										out.println("<div style='float: right;'>");
										out.println("<a href=''><img src='image/love1.png' style='width: 30px; height: 30px;'></a>");
										out.println("<a href=''><img src='image/image3.png' style='width: 35px; height: 35px;'></a>");
										out.println("</div><br>");
										out.println("<p class='"+"card-text text-center'"+"><br>"+rs.getString("proName")+"<br><del>$"+rs.getString("proPrice")+"</del><br><span>$"+rs.getString("proDis")+"</span></p>");
										
										out.println("</div>");
										out.println("</div>");
										out.println("</div>");
										
									}
									
									out.println("</div>");
								
									
									
								}
								con.close();
								%>
				</div>
			</div>
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
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>