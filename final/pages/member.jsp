<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../assets/jsp/config.jsp" %>
<%  request.setCharacterEncoding("UTF-8")  ;%>
<!doctype html>
<html lang="en">
  <head>
	<link rel="shortcut icon" href="../assets/img/favicon.ico">
    <link rel="bookmark" href="../assets/img/favicon.ico">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- minify -->
    <link href="https://unpkg.com/nes.css@2.3.0/css/nes.min.css" rel="stylesheet" />
    <!-- latest -->
    <link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
    <!-- core style only -->
    <link href="https://unpkg.com/nes.css/css/nes-core.min.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/information.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/member.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>會員專區</title>
  </head>
  <body>
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
<%
//判斷是否登入
if(session.getAttribute("id") != null ){
//判斷管理者之後台管理鍵
sql = "SELECT * FROM `managers` WHERE `ManagersAccount`='"+session.getAttribute("id")+"'";
ResultSet rs =  con.createStatement().executeQuery(sql);  
if(rs.next()){
%>
		  <a href="backstage01.jsp">後臺管理</a>
<%
}
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
    <!--內容-->
    <div class="container all">
        <div class="content">
          <div style="width: 200px; height:500px; border-right: solid 1px gray;">
            &nbsp;會員專區<br><br>
            <div class="vertical-menu">
            <a href="member.jsp" class="active">會員基本資料</a>
            <a href="order.jsp">訂單查詢</a>
            <a href="cart.jsp">購物車</a>
            </div>
          </div>
          <div class="box">
              <h3>會員基本資料修改</h3>
              <div class="content01">
                <div class="container_c1">
                  <div class="mySlides">
                    <img src="../assets/img/hahe.png">
                  </div>
                
                  <div class="mySlides">
                    <img src="../assets/img/pica.png">
                  </div>
                
                  <div class="mySlides">
                    <img src="../assets/img/kirby.png">
                  </div>
                    
                  </div>
                
                  <div class="caption-container">
                    <p id="caption"></p>
                  </div>
                
                  <div class="row">
                    <div class="column">
                      <img class="demo cursor" src="../assets/img/hahe.png" style="width:50px;" onclick="currentSlide(1)" alt="嘿呵">
                    </div>
                    <div class="column">
                      <img class="demo cursor" src="../assets/img/pica.png" style="width:60px;" onclick="currentSlide(2)" alt="皮卡丘">
                    </div>
                    <div class="column">
                      <img class="demo cursor" src="../assets/img/kirby.png" style="width:50px;" onclick="currentSlide(3)" alt="卡比">
                    </div>
                  </div>
                </div>
              </div>
<%
    //顯示會員資料
	sql = "SELECT * FROM `customers` WHERE `CustomersAccount`='" +session.getAttribute("id")+"';"; 
	rs =con.createStatement().executeQuery(sql);
	String CusName="",gender="",id="", pwd="",email="",tel="",addr="";
	while(rs.next()){
		CusName=rs.getString("CustomersName");
		gender=rs.getString("CustomersGendre");
	    id=rs.getString("CustomersAccount");
		pwd=rs.getString("CustomersPassword");
		email=rs.getString("CustomersEmail");
		tel=rs.getString("CustomersPhone");
		addr=rs.getString("CustomersAddress");
	}
%> 
              <form action="../assets/jsp/memberupdate.jsp" method="POST">
			  <div class="content02">
				  <div class="ipt01" >姓　　名：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=CusName%></div> 
                  <div class="ipt03" >性　　別：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=gender%></div>
                  <div class="ipt01" >帳　　號：  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=id%></div> 
                  <div class="ipt01" >密　　碼：  <input type="password" name="pwd" value="<%=pwd%>" required ><br></div>
                  <div class="ipt01" >E M A I L：<input type="email" name="email" value="<%=email%>" required ></div> 
                  <div class="ipt01" >手　　機：  <input type="text" name="tel" value="<%=tel%>" required ></div>
                  <div class="ipt01" >地　　址：  <input type="text" name="addr" value="<%=addr%>" required ><br></div>
              </div>
              <div class="btn">
                <input type="reset" class="nes-btn is-error" value="取消" require >
                <input type="submit" class="nes-btn is-primary" value="儲存變更" require >
              </div>
			  </form>
          </div>
        </div>
    </div>
<%
}else{
	out.println("<script type='text/javascript'>");
		out.println("alert('請先登入!');location.href='index.jsp'; ");
	out.println("</script>");
}
// 關閉連線					
        con.close();
%>    
    <!--內容-->
	
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
			  <button type="button" class="close mr-3 mt-3" data-dismiss="modal" style="font-size:30px;">&times;</button>
			  <%
			  }else{
			  %>
			  <form action="../assets/jsp/logout.jsp" method="post">
			  <button class="tablinks" onclick="openCity(event, '登出')">登出</button>
			  <button type="button" class="close mr-3 mt-3" data-dismiss="modal" style="font-size:30px;">&times;</button>
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
                <span class="ipt2" ><input type="text" placeholder="輸入帳號" name="id" required ></span>
                <br>
                <label for="psw"><b class="hig2">密碼</b></label>
                <span class="ipt2"><input type="password" placeholder="輸入密碼" name="pwd" required ></span>
                <br>
				<label for="uname"><b class="hig6">姓名</b></label>
                <span class="ipt2" ><input type="text" placeholder="輸入姓名" name="cname" required ></span>
                <br>
                <label for="uname"><b class="hig7">性別　</b></label>
                <span class="ipt3" ><input type="radio" class="gander" name="gender" value="M" checked> 男　&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="gander" name="gender" value="F" required> 女</span>
                <br><br>
                <label for="email"><b class="hig3">EMAIL</b></label>
                <span class="ipt2"><input type="email" placeholder="輸入EMAIL" name="email" required style="width:243px; height:42px; border-radius:4px; border:0.5px rgb(200,200,200) solid;" ></span>
                <br>
                <label for="phone"><b class="hig4">手機</b></label>
                <span class="ipt2"><input type="text" placeholder="輸入手機" name="tel" required ></span>
                <br>
                <label for="add"><b class="hig5">地址</b></label>
                <span class="ipt2"><input type="text" placeholder="輸入地址" name="addr" required ></span>
                <br>
                <span class="btn02"><button type="submit">確認</button></span>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div> 
    <!--會員登入彈出框-->
    
    <script src="../assets/js/index.js"></script>
    <script src="../assets/js/member.js"></script>
    <script type="text/javascript" src="../assets/js/jquery-1.8.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!--簡介-->	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>