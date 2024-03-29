<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../assets/jsp/config.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
		<link rel="shortcut icon" href="../assets/img/favicon.ico">
		<link rel="bookmark" href="../assets/img/favicon.ico">
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>關於我們</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="3D Gallery with CSS3 and jQuery" />
        <meta name="keywords" content="3d, gallery, jquery, css3, auto, slideshow, navigate, mouse scroll, perspective" />
		<!-- <meta name="author" content="Codrops" /> -->
		<!-- minify -->
		<link href="https://unpkg.com/nes.css@2.3.0/css/nes.min.css" rel="stylesheet">
		<!-- latest -->
		<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet">
		<!-- core style only -->
		<link href="https://unpkg.com/nes.css/css/nes-core.min.css" rel="stylesheet">
        <!-- <link rel="shortcut icon" href="../favicon.ico">  -->
        <!-- <link rel="stylesheet" type="text/css" href="../assets/css/demo.css" /> -->
		<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
		<link rel="stylesheet" href="../assets/css/aboutus.css">
		<link rel="stylesheet" href="../assets/css/all.css">
		<link rel="stylesheet" href="../assets/css/member.css">
		<link rel="stylesheet" href="../assets/css/information.css">
		<script type="text/javascript" src="../assets/js/modernizr.custom.53451.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    </head>
    <body style="padding-bottom: 0;">
    <!-- 框框 -->
    <div class="top">
      <p></p>
    </div>
    <div class="bottom">
      <p>&copy;switchGame</p>
    </div>
    <div class="right">
      <div class="arrow">
        <a href="#top"><img src="../assets/img/arrowtop.png" class="arrowimg" ></a> <br>
      </div>
      <div class="memberbutton">
        <button type="button" class="memberbutton1" data-toggle="modal" data-target="#ooo">
          <img src="../assets/img/member.png" class="member"  >
        </button>
      </div>
    </div>
    <div class="left">
      <div class="buttonleft">
        <button type="button" class="buttonleft1" data-toggle="modal" >
          <a href="index.jsp"><img src="../assets/img/home.png" class="member"  ></a>
        </button>
        <div class="arrowleft">
          <a href="#down"><img src="../assets/img/arrowdown.png" class="arrowimg" ></a>
        </div>
      </div>
    </div>
    <!-- 框框 -->
    <!--導覽-->
      <div class="container a">
        <div class="a1">
          <a href="product.jsp">遊戲軟體</a>
		  <a href="aboutus.jsp">關於我們</a>
          <a href="member.jsp">會員專區</a>
          <a href="cart.jsp">購物車</a>
<%
//判斷管理者之後台管理鍵
sql = "SELECT * FROM `managers` WHERE `ManagersAccount`='"+session.getAttribute("id")+"'";
ResultSet rs =  con.createStatement().executeQuery(sql);  
if(rs.next()){
%>
		  <a href="backstage01.jsp">後臺管理</a>
<%
}
// 關閉連線					
                    con.close();
%>
        </div>
        <div class="d">
        <form class="example" action="search.jsp" style="max-width:190px; padding: 12px 15px;">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        </div>
      </div>
    <!--導覽-->
        <div class="container-fluid us" style="background-image: url(../assets/img/bg.jpg); width:1500px; height: 800px; ">
			<div style="text-align:center;clear:both;">
				<script src="../assets/js/gg_bd_ad_720x90.js" type="text/javascript"></script>
				<script src="../assets/js/follow.js" type="text/javascript"></script>
			</div> <br><br><br><br><br><br>
			<h3 style="position: relative;top: -1px;font-size: 30px;">About us</h3><br><br>
			<section id="dg-container" class="dg-container">
				<div class="dg-wrapper">
					<a href="#">
						<img src="../assets/img/us1.jpg" alt="" class="usimg" >
						<p class="usname" id="n1">長文</p>
						<span class="aboutme">
						  生日：01/14<br>
						  星座：魔羯<br>
						  興趣：烹飪、運動
						</span>
					</a>
					<a href="#">
						<img src="../assets/img/us2.jpg" alt="" class="usimg">
						<p class="usname" id="n2">宜玲</p>
						<span class="aboutme">
						  生日：12/03 <br>
						  星座：射手<br>
						  興趣：看小說
						</span>
					</a>
					<a href="#">
						<img src="../assets/img/us3.jpg" alt="" class="usimg">
						<p class="usname" id="n3">沛瑄</p>
						<span class="aboutme">
						  生日：05/07 <br>
						  星座：金牛 <br>
						  興趣：追劇、BTS
						</span>
					</a>
					<a href="https://www.instagram.com/star356694/">
						<img src="../assets/img/us4.jpg" alt="" class="usimg">
						<p class="usname" id="n4">紫歆</p>
						<span class="aboutme">
						  生日：04/08 <br>
						  星座：牡羊 <br>
						  興趣：吃大餐
						</span>
					</a>
				</div>
				<nav >
					<span class="dg-prev" style="color: white; font-size:35px;">&lt;</span>
					<span class="dg-next" style="color: white; font-size:35px;">&gt;</span>
				</nav>
			</section>
		</div>	
		<!--會員登入彈出框-->
    <div id="ooo" class="modal inmodal fade"  tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="true">
      <div class="modal-dialog modal-sm" id="md01">
        <div class="modal-content">
          <div class="modal-body" >
            <div class="tab">
			  <%
			  //判斷是否登入
			  if(session.getAttribute("id") == null ){
			  %>
              <button class="tablinks" onclick="openCity(event, '登入')">登入</button>
              <button class="tablinks" onclick="openCity(event, '註冊')">註冊</button>
			  <button type="button" class="close mr-3 mt-4" data-dismiss="modal" style="font-size:30px;">&times;</button>
			  <%
			  }else{
			  %>
			  <form action="../assets/jsp/logout.jsp" method="post">
			  <button class="tablinks" onclick="openCity(event, '登出')">登出</button>
			  <button type="button" class="close mr-3 mt-4" data-dismiss="modal" style="font-size:30px;">&times;</button>
			  </form>
			  <%
			  }
			  %>

            </div>
            
            <div id="登入" class="tabcontent" id="tb01">
              <form class="login" action="../assets/jsp/login.jsp" method="post">
                <label for="uname"><b>帳號</b></label>
                <span class="ipt"><input type="text" placeholder="輸入帳號" name="id" required ></span>
                <br>     
                <label for="psw"><b>密碼</b></label>
                <span class="ipt"><input type="password" placeholder="輸入密碼" name="pwd" required ></span>
                <br>
                <span class="btn02"><button type="submit">登入</button></span>
                <label>
                  <span class="ipt"><input type="checkbox" checked="checked" name="remember" onclick="myFunction()"> 記住我</span>
                </label>
              </form>
            </div>
            
            <div id="註冊" class="tabcontent">
              <form class="register" action="../assets/jsp/memberadd.jsp" method="post">
				<label for="uname"><b class="hig1">帳號</b></label>
                <span class="ipt2" ><input type="text" placeholder="輸入帳號" name="id" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;" ></span>
                <br>
                <label for="psw"><b class="hig2">密碼</b></label>
                <span class="ipt2"><input type="password" placeholder="輸入密碼" name="pwd" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;"></span>
                <br>
				<label for="uname"><b class="hig6">姓名</b></label>
                <span class="ipt2" ><input type="text" placeholder="輸入姓名" name="cname" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;"></span>
                <br>
                <label for="uname"><b class="hig7">性別　</b></label>
                <span class="ipt3" ><input type="radio" class="gander" name="gender" value="M" checked> 男　&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="gander" name="gender" value="F" required> 女</span>
                <br><br>
                <label for="email"><b class="hig3">EMAIL</b></label>
                <span class="ipt2"><input type="email" placeholder="輸入EMAIL" name="email" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;" ></span>
                <br>
                <label for="phone"><b class="hig4">手機</b></label>
                <span class="ipt2"><input type="text" placeholder="輸入手機" name="tel" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;"></span>
                <br>
                <label for="add"><b class="hig5">地址</b></label>
                <span class="ipt2"><input type="text" placeholder="輸入地址" name="addr" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;"></span>
                <br>
                <span class="btn02"><button type="submit">確認</button></span>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div> 
    <!--會員登入彈出框-->

<!-- <div style="width:700px;margin:10px auto 20px auto;padding:0 0 0 380px;overflow:hidden"> -->
    
<script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<!-- <script type="text/javascript">
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours
();
</script> -->
<!-- Baidu Button END -->
<!-- </div> -->


<div style="text-align:center;clear:both;">
	<!-- <script src="/gg_bd_ad_720x90-2.js" type="text/javascript"></script> -->
</div>

		<script type="text/javascript" src="../assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="../assets/js/jquery.gallery.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#dg-container').gallery();
			});
		</script>
		<script src="../assets/js/index.js"></script>
		<script src="../assets/js/member.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>