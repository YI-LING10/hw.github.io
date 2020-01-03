<%@ page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
	<head>
		<link rel="icon" href="image/logo.ico" type="image/x-icon" / >
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
		<title>這裡沒有 喵</title>
		<style>
			@import url(assets/css/index.css);
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
		<!-- 動態廣告 -->
		<div class="ad">
			<div class="container-fluid">
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="2500">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<a href="goods2.jsp"><img src="image/bg.jpg" class="d-block w-100" alt=""></a>
						</div>
						<div class="carousel-item">
							<a href="act1.html"><img src="image/bg.png" class="d-block w-100" alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div><br>
		<!-- 隨機廣告板 -->
		<div class="">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
		<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {
//Step 3: 選擇資料庫	        
           String sql="use nocat";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="select * from ad"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int n=rs.getRow();
           //設定亂數ran
           Random ran=new Random();
           // current_adid亂數決定值為1-3,//nextInt(3)產生0到2的亂數
           int current_adid=ran.nextInt(n)+1;
//Step 4: 執行 SQL 指令, 只有一筆資料             
           sql="select * from ad where adname= " + current_adid;
           rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
           // 產生廣告需要的連結, 圖片, 替代文字
           while (rs.next()) //只有一筆資料
           {
             out.println("<a href='http://"+rs.getString(3)+"'>");
             out.println("<img src='image/"+rs.getString(2)+"' class='img-fluid' style='border:1px black solid'");
             out.println(" alt='"+rs.getString(4)+"'></a>");
           }
        }
//Step 6: 關閉連線
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
		
		
						
					</div>
				</div>
			</div>
		</div><br>
		<!-- 熱門商品 -->
		<div class="good">
			<div class="container">
				<h1>熱門商品</h1>
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=18'><img src="image/all/item20.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=6'><img src="image/all/item11.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=13'><img src="image/all/item4.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
				</div><br>
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=14'><img src="image/all/item3.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=20'><img src="image/all/item18.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
					<div class="col-md-4 col-xs-12">
						<a href='goods.jsp?page=1'><img src="image/all/item5.jpg" class="img-fluid" alt="" style="border:1px solid black; border-radius:10px;"></a>
					</div>
				</div><br>
				<h3 class="text-right"><a href="goodsall.jsp">更多商品</a></h3>
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
							<h3><b><%
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
        else {
//Step 3: 選擇資料庫   
           sql="use nocat";
           con.createStatement().execute(sql);
		   
String thePath=request.getRealPath("/")+"ch14_2" ; 
//out.println(thePath);
//getRealPath表本網頁所在的根目錄
File count=new File(thePath,"count.txt");//要事先建立
BufferedReader count_in=new BufferedReader(new FileReader(count));//建立檔案輸入串流
//int x=count_in.read(); //使用read讀取檔案, 格式為ASCII
int counter=Integer.parseInt(count_in.readLine());//使用readLine讀取檔案, 格式為字串
count_in.close();//關閉輸入串流
//計數器加1
if(session.isNew())
	counter++;



out.print("您是第"+counter+"位訪客");
FileWriter count_out=new FileWriter(count);
count_out.write(String.valueOf(counter));//將數字轉成字串,寫入輸出串流
count_out.flush();//將buffer寫入
count_out.close();//關閉串流


	sql="UPDATE counter SET counter='"+counter+"'";
           
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%></b></h3>
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