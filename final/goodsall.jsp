<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>



<%
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           
		   
		   sql="select * from products"; //算出共幾筆
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int n=rs.getRow();
		   
		   int page_num=(int)Math.ceil((double)n/9.0); //無條件進位
		   if (page_num==0) //無留言時將頁數指標訂為1
		       page_num=1;
			   
           int n1=(int)Math.ceil((double)n);
		   if (n1==0) 
		       n1=1;
           
			
           //每頁顯示9筆, 算出共幾頁
           
			 String page_string = request.getParameter("page");  
			 if (page_string == null) 
               page_string = "1";  //無留言時將頁數指標訂為1      
          Integer current_page=Integer.valueOf(page_string);
           
//Step 5: 顯示結果 
           int start_record=(current_page-1)*9;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM  products ORDER BY no ASC LIMIT ";//LIMIT是限制傳回筆數
           sql+=start_record+",9";
           //上述語法解讀如下:
           // current_page... select * from guestbook order by no desc limit
           //      current_page=1: select * from guestbook order by no desc limit 0, 5 //從第0筆顯示5筆
           //      current_page=2: select * from guestbook order by no desc limit 5, 5 //從第5筆顯示5筆
           //      current_page=3: select * from guestbook order by no desc limit 10, 5//從第10筆顯示5筆

           rs=con.createStatement().executeQuery(sql);
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
		<title>全部商品</title>
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
		</div><br>
		<!-- 產品 -->
		<div class="container-fluid">
			
			<div class="row">
				<div class="col-md-2">
					<a href="goods1.jsp"><img class="rounded ml-3 d-block" src="image/good1.jpg" >&nbsp;&nbsp;&nbsp;筆</a><br>
					<a href="goods2.jsp"><img class="rounded ml-3 d-block" src="image/good2.jpg">&nbsp;&nbsp;&nbsp;筆記本</a><br>
					<a href="goods3.jsp"><img class="rounded ml-3 d-block" src="image/good3.jpg">&nbsp;&nbsp;&nbsp;便利貼</a><br>
					<a href="goods4.jsp"><img class="rounded ml-3 d-block" src="image/good4.jpg">&nbsp;&nbsp;&nbsp;筆袋</a><br>
					<a href="goods5.jsp"><img class="rounded ml-3 d-block" src="image/good5.jpg">&nbsp;&nbsp;&nbsp;其他</a>
				</div>
				<div class="col-md-10">
					<h2>ALL &nbsp; PRODUCT</h2>
								<%
								for(int i=0;i<n;i++ )
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
								%>
					<br>		
					<div class="row">
						<div class="col-md-11">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-end">
									<%
									if(current_page!=1){
										out.println("<li class='page-item'>");
											out.println("<a class='page-link' href='goodsall.jsp?page=1' aria-label='Previous'>");
											out.println("<span aria-hidden='true'>&laquo;</span>");
											out.println("</a>");
										out.println("</li>");
									}
									
									for(int i=2;i<=page_num;i++){
										if(current_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goodsall.jsp?page="+(i-1)+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&lt;</span>");
												out.println("</a>");
											out.println("</li>");
										}
									}
									
										//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
										for(int i=1;i<=page_num;i++) //使用get傳輸方式,建立1,2,...頁超連結
										{
											
											out.println("<li class='page-item'><a class='page-link' href='goodsall.jsp?page="+i+"'>"+i+"</a></li>");
											
										}
									for(int i=1;i<=page_num-1;i++){
										if(current_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goodsall.jsp?page="+(i+1)+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&gt;</span>");
												out.println("</a>");
											out.println("</li>");
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goodsall.jsp?page="+page_num+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&raquo;</span>");
												out.println("</a>");
											out.println("</li>");
										}
									}
									%>
									
								</ul>
							</nav>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		</div><br>
		<%
				con.close();
		%>   

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