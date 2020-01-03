<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>


<%
	
           
	String page_string = request.getParameter("page");  
	if (page_string == null) 
        page_string = "1";  //無留言時將頁數指標訂為1      
    Integer current_page=Integer.valueOf(page_string);
		  
    sql="select * from products where no='"+page_string+"'";
    ResultSet rs=con.createStatement().executeQuery(sql);
	if(rs.next()){
    
    %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="icon" href="image/logo.ico" type="image/x-icon" / >
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
		<title><%=rs.getString(3)%></title>
		<!-- jquery -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
		<!-- Font Awesome Icon Library -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="assets/js/inputnum.js"></script>
		<script src="assets/js/goods.js"></script>
		<script src="assets/js/goodsbtn.js"></script>
		<style>
		@import url(assets/css/star.css);
		@import url(assets/css/goods.css);
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
		<!-- 商品介紹 -->
		<div class="container">
			<div class="row ml-5">
				<div class="col-md-6">
					<div class="container">
						<div class="mySlides" style="display: block;">
							<div class="numbertext">1 / 3</div>
							<img src="<%=rs.getString("proPic1")%>" style="width:100%">
						</div>
						<div class="mySlides" style="display: none;">
							<div class="numbertext">2 / 3</div>
							<img src="<%=rs.getString("proPic2")%>" style="width:100%">
						</div>
						<div class="mySlides" style="display: none;">
							<div class="numbertext">3 / 3</div>
							<img src="<%=rs.getString("proPic3")%>" style="width:100%">
						</div>
						
						
						<a class="prev" onclick="plusSlides(-1)">❮</a>
						<a class="next" onclick="plusSlides(1)">❯</a>
						<div class="caption-container">
							<p id="caption"></p>
						</div>
						<div class="row">
							<div class="column">
								<img class="demo cursor" src="<%=rs.getString("proPic1")%>" style="width:100%" onclick="currentSlide(1)">
							</div>
							<div class="column">
								<img class="demo cursor" src="<%=rs.getString("proPic2")%>" style="width:100%" onclick="currentSlide(2)">
							</div>
							<div class="column">
								<img class="demo cursor" src="<%=rs.getString("proPic3")%>" style="width:100%" onclick="currentSlide(3)">
							</div>
							
						</div>
					</div>
					<br>
					<p>分享到</p>
					<a href="" title=""><img src="image/image4.png" alt="" style="width: 50px; height:50px;"></a>
					<a href="" title=""><img src="image/image5.png" alt="" style="width: 50px; height:50px;"></a>
					<a href="" title=""><img src="image/image6.png" alt="" style="width: 50px; height:50px;"></a>
				</div>
				<div class="col-md-6">
				<h2><%=rs.getString(3)%>
					</h2><br>
					<p style="border-left: 1px solid black">&nbsp;全店 宅配滿$120免運<br>&nbsp;全店 超商滿$120免運</p>
					<p><br><b><del>NT$<%=rs.getString("proPrice")%></del></b><br><b><span>NT$<%=rs.getString("proDis")%></span></p><b><br>
					<form action="function/newCar.jsp?page=<%=rs.getString("no")%>" method="POST">
						<div class="form-row">
							<p>數量</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="min" name="" type="button" value="-" style=" width:30px; float: left;" />
							<input id="text_box" name="proamount" type="text" value="1" style=" width:30px;text-align: center; float: left;" />
							<input id="add" name="" type="button" value="+" style=" width:30px; float: left;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<p>庫存：<%=rs.getString("stoNum")%></p>
						</div><br><br>
						<button type="submit" class="btn btn-outline-info mt-1 col-md-4" onclick="car()">加入購物車</button>
					</form><br>
					<a href='function/newLove.jsp?page=<%=rs.getString("no")%>'><button type="button" class="btn btn-outline-danger mt-1 col-md-4" onclick="love()"><img src="image/love3.png" alt="" style="width: 20px; height:20px;">&nbsp;&nbsp;&nbsp;加入我的最愛</button></a>
				</div>
			</div>
			<hr>
			<h3><%=rs.getString(9)%></h3><br>
			<hr>
			<ul class="nav nav-tabs" id="pmyTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><span class="check">商品評論</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><span class="check">填寫評論</span></a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"><br>
				
				<%
				
					sql="select * from messages where product='"+rs.getString(3)+"'";
					ResultSet rs1=con.createStatement().executeQuery(sql);
					rs1.last();
					int n=rs1.getRow();
					
					int n1=(int)Math.ceil((double)n/5.0);
					if (n1==0) 
						n1=1;
					
					
					String p_string = request.getParameter("page1");  
					if (p_string == null) 
						p_string = "1";  //無留言時將頁數指標訂為1      
					Integer c_page=Integer.valueOf(p_string);
					int s_record=(c_page-1)*5;
					
					sql="SELECT * FROM  messages where product='"+rs.getString(3)+"' ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
					sql+=s_record+",5";
					
					rs1=con.createStatement().executeQuery(sql);
					
				
					for(int i=0;i<n;i++ )
					{	
					while(rs1.next()){
					out.println("<div class='row'>");
						out.println("<div class='col-md-1'>");
							out.println("<img src='image/image1.jpg' style='idth:50px; height:50px; border-radius: 20px;'>");
						out.println("</div>");
						out.println("<div class='col-md-11 my-auto'>");
							out.println("<h5><b>"+rs1.getString(2)+"</b></h5>");
							out.println("<div>");
							
							for(int j=1;j<=rs1.getInt(6);j++)
							{
								out.println("<span class='fa fa-star checked'></span>");
							}
							for(int j=1;j<=5-rs1.getInt(6);j++)
							{
								out.println("<span class='fa fa-star'></span>");
							}
								
							out.println("</div>");
							out.println("<p>"+rs.getString(3)+"</p>");
							out.println("<p>"+rs1.getString(4)+"</p>");
							out.println("<p>"+rs1.getString(5)+"</p>");
						out.println("</div>");
					out.println("</div><hr>");
						}
					}
				%>	
					<div class="row justify-content-end">
						<div class="col-md-auto">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<%
									if(c_page!=1){
										out.println("<li class='page-item'>");
											out.println("<a class='page-link' href='goods.jsp?page="+rs.getString("no")+"&page1=1' aria-label='Previous'>");
											out.println("<span aria-hidden='true'>&laquo;</span>");
											out.println("</a>");
										out.println("</li>");
									}
									
									for(int i=2;i<=n1;i++){
										if(c_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goods.jsp?page="+rs.getString("no")+"&page1="+(i-1)+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&lt;</span>");
												out.println("</a>");
											out.println("</li>");
										}
									}
									
										//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
										for(int i=1;i<=n1;i++) //使用get傳輸方式,建立1,2,...頁超連結
										{
											
											out.println("<li class='page-item'><a class='page-link' href='goods.jsp?page="+rs.getString("no")+"&page1="+i+"'>"+i+"</a></li>");
											
										}
									for(int i=1;i<=n1-1;i++){
										if(c_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goods.jsp?page="+rs.getString("no")+"&page1="+(i+1)+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&gt;</span>");
												out.println("</a>");
											out.println("</li>");
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='goods.jsp?page="+rs.getString("no")+"&page1="+n1+"' aria-label='Previous'>");
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
				
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><br>
					<form action="function/newMes.jsp?page=<%=rs.getString("no")%>" class="form-container" method="post">
						<p><%=rs.getString(3)%></p><br>
						<div class="form-row align-items-center">
							<%
							}else
							{
			
							}
							%>
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
							<p style="vertical-align: middle;">你好!<%=name%></p>&nbsp;&nbsp;
							<%	}else{
								%>
								<a href="registered_again.html"><button type="button" class="btn btn-info">登入</button></a>
							<%	
							}
							%>	
						</div><br>
						<p>評分</p>					

						<div class="rating">
							<input type="radio" id="star5" name="rating" value="5" hidden/>
							<label for="star5"></label>
							<input type="radio" id="star4" name="rating" value="4" hidden/>
							<label for="star4"></label>
							<input type="radio" id="star3" name="rating" value="3" hidden/>
							<label for="star3"></label>
							<input type="radio" id="star2" name="rating" value="2" hidden/>
							<label for="star2"></label>
							<input type="radio" id="star1" name="rating" value="1" hidden/>
							<label for="star1"></label>
						</div><br>
						<div class="form-inline">
							<div class="form-group">
								<label>評論</label>&nbsp;&nbsp;&nbsp;
								<textarea class="form-control" id="validationTextarea" name="content" placeholder="歡迎留言~" required style="width: 1000px;"></textarea>
							</div>
						</div><br>
						<div class="row justify-content-end">
							<button type="submit" class="btn btn-info">送出</button>
						</div>
					</form>
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
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
	</body>
</html>