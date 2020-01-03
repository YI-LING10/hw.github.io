<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title></title>
		<script src="assets/js/detect.js"></script>
	</head>
	<body>
		<div class="container-fluid px-0">
			<div class="row">
				<div class="col-md-12">
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
					<form  name="form1" method="POST" action="function/newMan.jsp"  class="needs-validation" novalidate>
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
												<input type="text" class="form-control" id="exampleInputName" name="manName" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInputAccount">帳號:</label>
												<input type="text" class="form-control" id="exampleInputAccount" name="mname" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInputPassword">密碼:</label>
												<input type="password" class="form-control" id="exampleInputPassword" name="manPass" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInput">驗證碼:</label>
												<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;" required>
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
					<form  name="form1" method="POST" action="function/DelMan.jsp" class="needs-validation" novalidate>
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
												<input type="text" class="form-control" id="exampleInputName" name="manName" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInput">驗證碼:</label>
												<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;" required>
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
					<form  name="form1" method="POST" action="function/changeMan.jsp" class="needs-validation" novalidate>
						<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">更改管理員資料</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="exampleInputName">管理員姓名:</label>
												<input type="text" class="form-control" id="exampleInputName" name="manName" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInputPassword">修改密碼:</label>
												<input type="password" class="form-control" id="exampleInputPassword" name="manPass" required>
											</div><br>
											<div class="form-group">
												<label for="exampleInput">驗證碼:</label>
												<input type="password" class="form-control" id="exampleInput" name="verCode" aria-describedby="Help" style="width: 100px;" required>
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
								<th></th>
								<th scope="col">管理員姓名</th>
								<th scope="col">管理員帳號</th>
								<th scope="col">管理員密碼</th>
							</tr>
						</thead>
						<tbody><%
						try {
								//Step 1: 載入資料庫驅動程式 
								Class.forName("com.mysql.jdbc.Driver");
									try {
										//Step 2: 建立連線 	
										String url="jdbc:mysql://localhost/";
										String sql="";

										Connection con=DriverManager.getConnection(url,"root","1234");   						
										if(con.isClosed())
											out.println("連線建立失敗");
										else
										{
											sql="USE nocat";
											con.createStatement().execute(sql);   
				
											String sql1 = "SELECT manName,mname,manpass FROM manager";  //查詢語句
											con.createStatement().execute(sql1); 
											ResultSet rs = con.createStatement().executeQuery(sql1);      
											int i=1;
											while (rs.next()) {
												out.println("<tr><th>"+i+"</th><td></td><td>"+rs.getString("manName")+"</td><td>"+ rs.getString("mname")+"</td><td>"+rs.getString("manpass")+"</td></tr>"); 
												i++;
											} 
										}
										con.close();
										}
										
									catch (SQLException sExec) {
																out.println("SQL錯誤"+sExec.toString());
									}
								}
								catch (ClassNotFoundException err) {
									out.println("class錯誤"+err.toString());
								}
							
        							
							%>
						</tbody>
					</table>
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