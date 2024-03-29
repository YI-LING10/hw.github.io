<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%@include file="../assets/jsp/config.jsp" %>
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
    <link rel="stylesheet" href="../assets/css/cart.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>購物小車車</title>
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
        <a href="aboutus.jsp">關於我們</a>
        <a href="member.jsp">會員專區</a>
        <a href="cart.jsp">購物車</a>
<%
if(session.getAttribute("id") != null ){
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

    <div class="container all">
      <div class="row">
        <div class="col-4" id="content">
          <div style="width: 200px; height: 580px; border-right: solid 1px gray;">
            &nbsp;會員專區<br><br>
            <div class="vertical-menu">
            <a href="member.jsp" >會員基本資料</a>
            <a href="order.jsp" >訂單查詢</a>
            <a href="cart.jsp"  class="active">購物車</a>
            </div>
          </div>
        </div>
        <div class="col-8 cart">
          <div class="cart2">
            <h3>購物車</h3>
<% 
                    //顯示會員資料
					sql = "SELECT * FROM `customers` WHERE `CustomersAccount`='" +session.getAttribute("id")+"'";
                    rs =  con.createStatement().executeQuery(sql);    
					while(rs.next()){
%> 
              <form action="../assets/jsp/orderadd.jsp" class="checkout" name="check1" onsubmit="chk()">
                <div class="name">
                  <label for="name">姓名:</label>
                  <p><%=rs.getString("CustomersName")%></p>
                </div>
                <div class="phone">
                  <label for="phone">電話:</label>
                  <p><%=rs.getString("CustomersPhone")%></p>
                </div>
                <div class="ship">
                  <p>運送方式:</p>
                  <label>
                    <input type="radio" class="nes-radio" name="s" value="宅配" checked />
                    <span>宅配</span>
                  </label>
                  <label>
                    <input type="radio" class="nes-radio" name="s" value="7-11"/>
                    <span>7-11</span>
                  </label>
                  <label>
                    <input type="radio" class="nes-radio" name="s" value="全家"/>
                    <span>全家</span>
                  </label>
                </div>
                <div class="pay">
                  <p>付款方式:</p>
                  <label>
                    <input type="radio" class="nes-radio" name="p" value="貨到付款" checked />
                    <span>貨到付款</span>
                  </label>
                  <label>
                    <input type="radio" class="nes-radio" name="p" value="信用卡支付"/>
                    <span>信用卡支付</span>
                  </label>
                </div>
                <div class="note">
                  <label for="note">備註:</label>
                  <textarea name="note" id="note" class="nes-textarea" cols="50" rows="4"></textarea>
                </div>
                <div class="cartnext">
                  <input type="button" value="上一步" class="nes-btn is-primary" onclick="location.href='cart.jsp'"></input>
                  <input type="submit" name="" value="下訂單GOGO" class="nes-btn is-primary">
                </div>
             </form>
<%
					}
}
// 關閉連線					
                    con.close();
%>
          </div>
        </div>
          <!-- <h3>購物車</h3>
          <div class="cart_img">
            <img src="../assets/img/1.jpg" width="150px" alt="">
            <form action="">
              <p class="name">寶可夢 劍</p>
              <p style="color: red;font-weight: bold;">$1790</p>
              <p>x2</p>
              <input type="submit" class="nes-btn is-primary" value="不要了"></input>
            </form>
          </div> -->
            <!-- 1.商品內容價錢數量刪除
            2.選擇付款方式地址 備註 下訂單 -->
        </div>
        
          <!-- <div class="col-7">
            <form action="">
            <h3>寶可夢 劍</h3>
            <p>$1790</p>
            <p>x2</p>
            <input type="submit" class="nes-btn is-primary" value="不要了"></input>
            </form>
          </div> -->
      </div>
    </div>
  </div>
  <br><a name="down"></a><br>

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
			  <button type="button" class="close mr-3" data-dismiss="modal" style="font-size:30px;">&times;</button>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script>
      function chk(){
        if(document.check1.na.value==""){
          alert('名字呢?');
          document.check1.na.focus();
          return false;
        }
        if(document.check1.ph.value==""){
          alert('電話呢?');
          document.check1.ph.focus();
          return false;
        }
        return true;
      }
    </script>
  </body>
</html>