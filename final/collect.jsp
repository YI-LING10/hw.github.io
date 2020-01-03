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
	
	sql="SELECT * FROM  p_collect where name='"+userName+"'";//LIMIT是限制傳回筆數
		
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
	
	sql="SELECT * FROM  p_collect where name='"+userName+"' ORDER BY p_no ASC LIMIT ";//LIMIT是限制傳回筆數
		sql+=s_record+",5";
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
			<h1>我的收藏</h1><br>
			
				<table class="table" >
					<thead>
						<tr class='row'>
							<th class='col-2'>圖片</th>
							<th class='col-2'>名稱</th>
							<th class='col-5'>說明</th>
							<th class='col-1'>價錢</th>
							<th class='col-2'>加入/取消</th>
						</tr>
					</thead>
					<tbody>
						<%
						for(int i=0;i<n;i++ )
						{	
							while(rs1.next())
							{
								out.println("<tr class='row'>");
								out.println("<td class='col-2'><a href='goods.jsp?page="+rs1.getString(2)+"'><img src='"+rs1.getString(4)+"' style='height:100px;'></a></td>");
								out.println("<td class='col-2'>"+rs1.getString(3)+"</td>");
								out.println("<td class='col-5'>"+rs1.getString(6)+"</td>");
								out.println("<td class='col-1'>$"+rs1.getString(5)+"</td>");
								out.println("<td class='col-2'>");
									out.println("<a href='function/DelLove.jsp?no="+rs1.getString(2)+"'><button type='button' class='btn btn-secondary'>取消收藏</button></a>");
								out.println("</td>");
								out.println("</tr>");
							}
						}
						%>
						
					</tbody>
				</table>
			
			<div class="row justify-content-end">
						<div class="col-md-auto">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<%
									if(c_page!=1){
										out.println("<li class='page-item'>");
											out.println("<a class='page-link' href='collect.jsp?page1=1&name1="+name1+"' aria-label='Previous'>");
											out.println("<span aria-hidden='true'>&laquo;</span>");
											out.println("</a>");
										out.println("</li>");
									}
									
									for(int i=2;i<=n1;i++){
										if(c_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='collect.jsp?page1="+(i-1)+"&name1="+name1+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&lt;</span>");
												out.println("</a>");
											out.println("</li>");
										}
									}
									
										//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
										for(int i=1;i<=n1;i++) //使用get傳輸方式,建立1,2,...頁超連結
										{
											
											out.println("<li class='page-item'><a class='page-link' href='collect.jsp?page1="+i+"&name1="+name1+"'>"+i+"</a></li>");
											
										}
									for(int i=1;i<=n1-1;i++){
										if(c_page==i){
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='collect.jsp?page1="+(i+1)+"&name1="+name1+"' aria-label='Previous'>");
												out.println("<span aria-hidden='true'>&gt;</span>");
												out.println("</a>");
											out.println("</li>");
											out.println("<li class='page-item'>");
												out.println("<a class='page-link' href='collect.jsp?page1="+n1+"&name1="+name1+"' aria-label='Previous'>");
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