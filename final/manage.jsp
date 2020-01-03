<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ include file="function/config.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title>管理系統</title>
	</head>
	<body>
		<!-- 導覽欄 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#"><img src="image/image.png" alt="" width="50px;" height="50px;">&nbsp;網路管理後台系統</a>
		</nav>
		<!-- 管理畫面 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2 pr-0 pl-0" style="border: 1px solid black;">
					<div class="list-group list-group-flush" id="list-tab" role="tablist">
						<a class="list-group-item list-group-item-light list-group-item-action active" id="list-keeper-list" data-toggle="list" href="#list-keeper" role="tab" aria-controls="keeper">管理者</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-member-list" data-toggle="list" href="#list-member" role="tab" aria-controls="member">會員</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-goods-list" data-toggle="list" href="#list-goods" role="tab" aria-controls="goods">產品</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-order-list" data-toggle="list" href="#list-order" role="tab" aria-controls="order">訂單</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-shopcar-list" data-toggle="list" href="#list-shopcar" role="tab" aria-controls="shopcar">購物車</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-shoprecord-list" data-toggle="list" href="#list-shoprecord" role="tab" aria-controls="shoprecord">購買紀錄</a>
						<a class="list-group-item list-group-item-light list-group-item-action" id="list-message-list" data-toggle="list" href="#list-message" role="tab" aria-controls="message">留言板</a>
					</div>
				</div>
				<div class="col-md-10 pr-0 pl-0" style="border: 1px solid black;">
					<div class="tab-content" id="nav-tabContent">
						<!-- 管理者 -->
						<div class="tab-pane fade show active" id="list-keeper" role="tabpanel" aria-labelledby="list-keeper-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>管理者系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal2">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal3">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal -->
							<form  name="form1" method="POST" action="function/newMan.jsp">
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增管理員</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">姓名:</label>
														<input type="text" class="form-control" id="exampleInputName" name="manName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAccount">帳號:</label>
														<input type="text" class="form-control" id="exampleInputAccount" name="mname">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPassword">密碼:</label>
														<input type="password" class="form-control" id="exampleInputPassword" name="manPass">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal2 -->
							<form  name="form1" method="POST" action="function/DelMan.jsp">
								<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除管理員</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">管理員姓名:</label>
														<input type="text" class="form-control" id="exampleInputName" name="manName">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal3 -->
							<form  name="form1" method="POST" action="function/changeMan.jsp">
								<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">更改管理員密碼</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">管理員姓名:</label>
														<input type="text" class="form-control" id="exampleInputName" name="manName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPassword">修改密碼:</label>
														<input type="password" class="form-control" id="exampleInputPassword" name="manPass">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">管理員姓名</th>
										<th scope="col">管理員帳號</th>
										<th scope="col">管理員密碼</th>
									</tr>
								</thead>
								<tbody>
									<%
								
										String sql="";
										con=DriverManager.getConnection(url,"root","1234");   						
										if(con.isClosed())
											out.println("連線建立失敗");
										else
										{
											sql="USE nocat";
											con.createStatement().execute(sql);   
				
											String sql1 = "SELECT manNum,manName,mname,manpass FROM manager";  //查詢語句
											con.createStatement().execute(sql1); 
											ResultSet rs = con.createStatement().executeQuery(sql1);      
											int i=1;
											while (rs.next()) {
					
												out.println("<tr><th>"+i+"</th><td>"+rs.getString("manName") +"</td><td>"+ rs.getString("mname") +"</td><td>" +rs.getString("manpass")+"</td></tr>"); 
												i++;
											} 
										}
										con.close();
        							
							%>
								</tbody>
							</table>
						</div>
						<!-- 會員 -->
						<div class="tab-pane fade" id="list-member" role="tabpanel" aria-labelledby="list-member-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>會員系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal5">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal6">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal4">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal4 -->
							<form  name="form1" method="POST" action="function/newUser.jsp">
								<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增會員</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													
													<div class="form-group">
														<label for="exampleInputAccount">帳號:</label>
														<input type="text" class="form-control" id="exampleInputAccount" name="userName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPassword">密碼:</label>
														<input type="password" class="form-control" id="exampleInputPassword" name="password">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">暱稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="name">
													</div><br>
													<div class="form-group">
														<label for="exampleInputNSex">性別:</label>
														<input type="text" class="form-control" id="exampleInputSex" name="sex">
													</div><br>
													<div class="form-group">
														<label for="exampleInputBirth">生日:</label>
														<input type="text" class="form-control" id="exampleInputBirth" name="birth">
													</div><br>
													<div class="form-group">
														<label for="exampleInputMail">信箱:</label>
														<input type="text" class="form-control" id="exampleInputMail" name="mail">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal5 -->
							<form  name="form1" method="POST" action="function/DelUser.jsp">
								<div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除會員</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">會員帳號:</label>
														<input type="text" class="form-control" id="exampleInputName" name="userName">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal6 -->
							<form  name="form1" method="POST" action="function/change.jsp">
								<div class="modal fade" id="exampleModal6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">更改會員資料</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													
													<div class="form-group">
														<label for="exampleInputAccount">會員帳號:</label>
														<input type="text" class="form-control" id="exampleInputAccount" name="userName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPassword">會員密碼:</label>
														<input type="password" class="form-control" id="exampleInputPassword" name="Password">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">會員暱稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="name">
													</div><br>
													<div class="form-group">
														<label for="exampleInputNSex">會員性別:</label>
														<input type="text" class="form-control" id="exampleInputSex" name="sex">
													</div><br>
													<div class="form-group">
														<label for="exampleInputBirth">會員生日:</label>
														<input type="text" class="form-control" id="exampleInputBirth" name="birth">
													</div><br>
													<div class="form-group">
														<label for="exampleInputMail">會員信箱:</label>
														<input type="text" class="form-control" id="exampleInputMail" name="mail">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">會員帳號</th>
										<th scope="col">會員密碼</th>
										<th scope="col">會員暱稱</th>
										<th scope="col">會員性別</th>
										<th scope="col">會員生日</th>
										<th scope="col">會員信箱</th>
									</tr>
								</thead>
								<tbody>
									<%
								
										sql="";
										con=DriverManager.getConnection(url,"root","1234");   						
										if(con.isClosed())
											out.println("連線建立失敗");
										else
										{
											sql="USE nocat";
											con.createStatement().execute(sql);   
				
											String sql1 = "SELECT userName,password,name,sex,birth,mail FROM member";  //查詢語句
											con.createStatement().execute(sql1); 
											ResultSet rs = con.createStatement().executeQuery(sql1);      
											int i=1;
											while (rs.next()) {
					
												out.println("<tr><th>"+i+"</th><td>"+rs.getString("userName") +"</td><td>"+ rs.getString("password") +"</td><td>" +rs.getString("name")+"</td><td>"+ rs.getString("sex")+"</td><td>"+ rs.getString("birth")+"</td><td>"+ rs.getString("mail")+"</td></tr>"); 
												i++;
											} 
										}
										con.close();
        							
									%>
								</tbody>
							</table>
						</div>
						<!-- 產品 -->
						<div class="tab-pane fade" id="list-goods" role="tabpanel" aria-labelledby="list-goods-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>產品系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal8">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal9">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal7">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal7 -->
							<form  name="form1" method="POST" action="function/newPro.jsp">
								<div class="modal fade" id="exampleModal7" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增產品</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputNumber">編號:</label>
														<input type="text" class="form-control" id="exampleInputNumber" name="proNumb">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">名稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="proName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">價格:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="proPrice">
													</div><br>
													<div class="form-group">
														<label for="exampleInputNote">說明:</label>
														<input type="text" class="form-control" id="exampleInputNote" name="proNote">
													</div><br>
													<div class="form-group">
														<label for="exampleInputDiscount">優惠:</label>
														<input type="text" class="form-control" id="exampleInputDiscount" name="proDis">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal8 -->
							<form  name="form1" method="POST" action="function/DelPro.jsp">
								<div class="modal fade" id="exampleModal8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除產品</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">產品名稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="proName">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal9 -->
							<form  name="form1" method="POST" action="function/changePro.jsp">
								<div class="modal fade" id="exampleModal9" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改產品資訊</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputNumber">產品編號:</label>
														<input type="text" class="form-control" id="exampleInputNumber" name="proNumb">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">產品名稱:</label>
														<input type="ptext" class="form-control" id="exampleInputName" name="proName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">產品價格:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="proPrice">
													</div><br>
													<div class="form-group">
														<label for="exampleInputNote">產品說明:</label>
														<input type="text" class="form-control" id="exampleInputNote" name="proNote">
													</div><br>
													<div class="form-group">
														<label for="exampleInputDiscount">產品優惠:</label>
														<input type="text" class="form-control" id="exampleInputDiscount" name="proDis">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">產品編號</th>
										<th scope="col">產品名稱</th>
										<th scope="col">產品價格</th>
										<th scope="col">產品圖片</th>
										<th scope="col">產品說明</th>
										<th scope="col">產品優惠</th>
									</tr>
								</thead>
								<tbody>
									<%
										sql="";
										con=DriverManager.getConnection(url,"root","1234");   						
										if(con.isClosed())
											out.println("連線建立失敗");
										else
										{
											sql="USE nocat";
											con.createStatement().execute(sql);   
				
											String sql1 = "SELECT proNumb,proName,proPrice,proPic,proNote,proDis FROM products";  //查詢語句
											con.createStatement().execute(sql1); 
											ResultSet rs = con.createStatement().executeQuery(sql1);      
											int i=1;
											while (rs.next()) {
					
												out.println("<tr><th>"+i+"</th><td>"+rs.getString("proNumb") +"</td><td>"+ rs.getString("proName") +"</td><td>" +rs.getInt("proPrice")+"</td><td>"+ rs.getString("proPic")+"</td><td>"+ rs.getString("proNote")+"</td><td>"+ rs.getString("proDis")+"</td></tr>"); 
												i++;
											} 
										}
										con.close();
        							
							%>
								</tbody>
							</table>
						</div>
						<!-- 訂單 -->
						<div class="tab-pane fade" id="list-order" role="tabpanel" aria-labelledby="list-order-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>訂單系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal11">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal12">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal10">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal10 -->
							<form  name="form1" method="POST" action="function/newOr.jsp">
								<div class="modal fade" id="exampleModal10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增訂單</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputUsernum">會員編號:</label>
														<input type="text" class="form-control" id="exampleInputUsernum" name="userNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPayway">付款方式:</label>
														<input type="text" class="form-control" id="exampleInputPayway" name="payWay">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPickway">取貨方式:</label>
														<input type="text" class="form-control" id="exampleInputPickway" name="pickPro">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">收件人名稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="reiName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAdd">收件人地址:</label>
														<input type="text" class="form-control" id="exampleInputAdd" name="reiAdd">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTel">收件人電話:</label>
														<input type="text" class="form-control" id="exampleInputTel" name="reiTel">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal11 -->
							<form  name="form1" method="POST" action="DelOr.jsp">
								<div class="modal fade" id="exampleModal11" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除訂單</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputName" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal12 -->
							<form  name="form1" method="POST" action="changeOr.jsp">
								<div class="modal fade" id="exampleModal12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改訂單資訊</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputUsernum">會員編號:</label>
														<input type="text" class="form-control" id="exampleInputUsernum" name="userNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPayway">付款方式:</label>
														<input type="text" class="form-control" id="exampleInputPayway" name="payWay">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPickway">取貨方式:</label>
														<input type="text" class="form-control" id="exampleInputPickway" name="pickPro">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">收件人名稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="reiName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAdd">收件人地址:</label>
														<input type="text" class="form-control" id="exampleInputAdd" name="reiAdd">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTel">收件人電話:</label>
														<input type="text" class="form-control" id="exampleInputTel" name="reiTei">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">訂單編號</th>
										<th scope="col">會員編號</th>
										<th scope="col">購買產品</th>
										<th scope="col">購買數量</th>
										<th scope="col">付款總價</th>
										<th scope="col">付款方式</th>
										<th scope="col">取貨方式</th>
										<th scope="col">收件人名稱</th>
										<th scope="col">收件人地址</th>
										<th scope="col">收件人電話</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<!-- 購物車 -->
						<div class="tab-pane fade" id="list-shopcar" role="tabpanel" aria-labelledby="list-shopcar-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>購物車系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal14">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal15">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal13">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal13 -->
							<form  name="form1" method="POST" action="newCar.jsp">
								<div class="modal fade" id="exampleModal13" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增購物車</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">產品編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="proNumb">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal14 -->
							<form  name="form1" method="POST" action="DelCar.jsp">
								<div class="modal fade" id="exampleModal14" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除購物車</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">產品編號:</label>
														<input type="text" class="form-control" id="exampleInputName" name="proNumb">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal15 -->
							<form  name="form1" method="POST" action="changeCar.jsp">
								<div class="modal fade" id="exampleModal15" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改購物車資訊</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">產品編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="proNumb">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">產品編號</th>
										<th scope="col">購買產品</th>
										<th scope="col">購買數量</th>
										<th scope="col">付款總價</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 購買紀錄 -->
						<div class="tab-pane fade" id="list-shoprecord" role="tabpanel" aria-labelledby="list-shoprecord-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>購買紀錄系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal20">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal21">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal19">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal19 -->
							<form  name="form1" method="POST" action="newRec.jsp">
								<div class="modal fade" id="exampleModal19" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增購買紀錄</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTime">購買時間:</label>
														<input type="text" class="form-control" id="exampleInputTime" name="payTime">
													</div><br>
													<div class="form-group">
														<label for="exampleInputState">商品狀態:</label>
														<input type="text" class="form-control" id="exampleInputState" name="proRec">
													</div><br>
													<div class="form-group">
														<label for="exampleInputGrade">評價:</label>
														<input type="text" class="form-control" id="exampleInputGrade" name="grade">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal20 -->
							<form  name="form1" method="POST" action="DelRec.jsp">
								<div class="modal fade" id="exampleModal20" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除購買紀錄</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputName" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal21 -->
							<form  name="form1" method="POST" action="changeRec.jsp">
								<div class="modal fade" id="exampleModal21" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改購買紀錄資訊</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputOrnum">訂單編號:</label>
														<input type="text" class="form-control" id="exampleInputOrnum" name="orNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputProduct">購買產品:</label>
														<input type="text" class="form-control" id="exampleInputProduct" name="product">
													</div><br>
													<div class="form-group">
														<label for="exampleInputAmount">購買數量:</label>
														<input type="text" class="form-control" id="exampleInputAmount" name="amount">
													</div><br>
													<div class="form-group">
														<label for="exampleInputPrice">付款總價:</label>
														<input type="text" class="form-control" id="exampleInputPrice" name="price">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTime">購買時間:</label>
														<input type="text" class="form-control" id="exampleInputTime" name="payTime">
													</div><br>
													<div class="form-group">
														<label for="exampleInputState">商品狀態:</label>
														<input type="text" class="form-control" id="exampleInputState" name="proRec">
													</div><br>
													<div class="form-group">
														<label for="exampleInputGrade">評價:</label>
														<input type="text" class="form-control" id="exampleInputGrade" name="grade">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">訂單編號</th>
										<th scope="col">購買產品</th>
										<th scope="col">購買數量</th>
										<th scope="col">付款總價</th>
										<th scope="col">購買時間</th>
										<th scope="col">商品狀態</th>
										<th scope="col">評價</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 留言板 -->
						<div class="tab-pane fade" id="list-message" role="tabpanel" aria-labelledby="list-smessage-list">
							<table class="table table-dark my-0">
								<tbody>
									<tr>
										<td>
											<p>留言板系統</p>
										</td>
										<td>
											<form class="form-inline my-2 my-lg-0">
												<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
												<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>&nbsp;
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal17">刪除</button>
											</form>
										</td>
										<td class="float-right">
											<form>
												<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#exampleModal18">修改</button>
											</form>
										</td>
										<td class="float-right">
											<!-- Button trigger modal -->
											<form>
												<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal16">
												+新增
												</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- Modal16 -->
							<form  name="form1" method="POST" action="newMes.jsp">
								<div class="modal fade" id="exampleModal16" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">新增留言</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputNumber">留言板編號:</label>
														<input type="text" class="form-control" id="exampleInputNumber" name="mesNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTheme">留言板主題:</label>
														<input type="text" class="form-control" id="exampleInputTheme" name="mesName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputContent">留言板內容:</label>
														<input type="text" class="form-control" id="exampleInputContent" name="message">
													</div><br>
													<div class="form-group">
														<label for="exampleInputDate">留言板日期:</label>
														<input type="text" class="form-control" id="exampleInputDate" name="mesDate">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">會員暱稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="name">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-info">送出</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal17 -->
							<form  name="form1" method="POST" action="DelMes.jsp">
								<div class="modal fade" id="exampleModal17" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">刪除留言</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputName">留言板編號:</label>
														<input type="text" class="form-control" id="exampleInputName" name="mesNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Modal18 -->
							<form  name="form1" method="POST" action="changeMes.jsp">
								<div class="modal fade" id="exampleModal18" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">修改留言板資訊</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="form-group">
														<label for="exampleInputNumber">留言板編號:</label>
														<input type="text" class="form-control" id="exampleInputNumber" name="mesNum">
													</div><br>
													<div class="form-group">
														<label for="exampleInputTheme">留言板主題:</label>
														<input type="text" class="form-control" id="exampleInputTheme" name="mesName">
													</div><br>
													<div class="form-group">
														<label for="exampleInputContent">留言板內容:</label>
														<input type="text" class="form-control" id="exampleInputContent" name="message">
													</div><br>
													<div class="form-group">
														<label for="exampleInputDate">留言板日期:</label>
														<input type="text" class="form-control" id="exampleInputDate" name="mesDate">
													</div><br>
													<div class="form-group">
														<label for="exampleInputName">會員暱稱:</label>
														<input type="text" class="form-control" id="exampleInputName" name="name">
													</div><br>
													<div class="form-group">
														<label for="exampleInput">驗證碼:</label>
														<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;">
														<small id="Help" class="form-text text-muted">(驗證碼正確才能進行修改)</small>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-info">送出</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 後臺可自行更改欄數 -->
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">#</th>
										<th scope="col">留言板編號</th>
										<th scope="col">留言板主題</th>
										<th scope="col">留言板內容</th>
										<th scope="col">留言板日期</th>
										<th scope="col">會員暱稱</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
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