<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
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
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>首頁</title>
  </head>
  <body>

	<!-- 框框 -->
    <div class="top">
      <p></p>
    </div>
    <div class="bottom">
      <p>訪客人數:
<%
        //計數器
		sql = "SELECT * FROM `counter`";
        ResultSet rs =  con.createStatement().executeQuery(sql);
		while(rs.next()){
			int count=rs.getInt(1);
			if (session.isNew()){
				count++;
				sql = "UPDATE `counter` SET `count`="+count;
				con.createStatement().execute(sql);	
			}
			out.print(count);
		}
%>	  
	  </p>
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
rs =  con.createStatement().executeQuery(sql);  
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
    <!--Banner-->
    <div class="container banban"><a name="top"></a>
      <div class="carousel slide" data-ride="carousel" id="carousel-demo">
           <ol class="carousel-indicators">
             <li data-target="#carousel-demo" data-slide-to="0" class="active"></li>
             <li data-target="#carousel-demo" data-slide-to="1"></li>
             <li data-target="#carousel-demo" data-slide-to="2"></li>
           </ol>
         <div class="carousel-inner">
           <div class="carousel-item active">
             <img class="d-block w-100" src="../assets/img/banner1.png" style="width: 80%; height: 350px; margin-top: 150px;">
           </div>
           <div class="carousel-item">
             <img class="d-block w-100" src="../assets/img/banner2.jpg" style="width: 80%; height: 350px; margin-top: 150px;">
           </div>
		   <div class="carousel-item">
             <img class="d-block w-100" src="../assets/img/banner4.png" style="width: 80%; height: 350px; margin-top: 150px;">
           </div>
         
           <a href="#carousel-demo" class="carousel-control-prev" data-slide="prev" style="height: 150px; margin-top: 250px;">
           <span class="carousel-control-prev-icon"></span>
           </a>
           <a href="#carousel-demo" class="carousel-control-next" data-slide="next" style="height: 150px; margin-top: 250px;">
             <span class="carousel-control-next-icon"></span>
           </a>
         </div>
       </div>
   </div>
    <!--Banner-->

<!--簡介-->		
	<!--商品分類-->		
		<div class="container-fulid mt-5">
		
			<div class="outbox01">
			<span style="font-size:30px;">商品分類</span>   
	        <div class="inbox01" style="border:3px rgb(188, 194, 194) solid; ">
	        	<div class="row m-0 ">
              <div class="col-md-2 mr-4 ml-5 inbox01-s" >
                <img src="../assets/img/1.jpg" style="width:200px; margin-top:35px; margin-left: 20px;">
              </div>

              <div class="col-md-2 mr-4 inbox01-s" >
                <img src="../assets/img/8.jpg" style="width:200px;margin-top:35px;  margin-left: 20px;">
              </div>	

              <div class="col-md-2 mr-4 inbox01-s">
                  <img src="../assets/img/13.jpg" style="width:200px;margin-top:35px;  margin-left: 20px;">
              </div>
              
              <div class="col-md-2 mr-4 inbox01-s">
                <img src="../assets/img/17.jpg" style="width:200px;margin-top:35px;  margin-left: 20px;">
              </div>
              <div class="col-md-2 mr-4 inbox01-s">
                <img src="../assets/img/19.jpg" style="width:200px;margin-top:35px;  margin-left: 20px;">
              </div>
            </div>
            
            <div class="row m-0">
              <div class="col-md-2 inbox01-s pt-1 pb-3 mr-4 ml-5" > 
                <button class="me2" onclick="location.href='cosplay.jsp'" >
                  <span>角色扮演</span>
                </button>
              </div>
              <div class="col-md-2 inbox01-s pt-1 pb-3 mr-4" > 
                <button class="me2" onclick="location.href='adventure.jsp'" >
                  <span>動作冒險</span>
                </button>
              </div>
              <div class="col-md-2 inbox01-s pt-1 pb-3 mr-4"> 
                <button class="me2" onclick="location.href='platform.jsp'" >
                    <span>平台</span>
                </button>
              </div>
              <div class="col-md-2 inbox01-s pt-1 pb-3 mr-4"> 
                <button class="me2" onclick="location.href='sport.jsp'" >
                    <span>運動</span>
                </button>
              </div>
              <div class="col-md-2 inbox01-s pt-1 pb-3 mr-4"> 
                <button class="me2" onclick="location.href='party.jsp'" >
                    <span>聚會</span>
                </button>
              </div>
				    </div>
			    </div>	
			</div>    
		
		</div>
    <!--商品分類-->	

	<!--熱銷-->	
	<div class="container-fulid mb-5">
		
    <div class="col-md-12  mb-1">
      <div style="text-align:center; font-size:30px;">熱銷商品<hr style="width:70%;"></div>
    </div>
 		
		<div class="row one m-0" style="justify-content:space-around; padding:0px 5%;">
<%
                    //顯示指定的熱門商品1
					sql = "SELECT * FROM `product` WHERE `ProductID`='18'" ;
                    rs =  con.createStatement().executeQuery(sql);                   
                    while(rs.next()){			
%>
      <div class="card card01" id="hot1">
        <div class="cardcontainer">
            <img src="../assets/img/<%=rs.getString("Pic1")%>" class="cardimage">
            <div class="cardoverlay">
              <div class="cardtext ">10萬網友大好評!<br><span style=" font-size: 25px;">快跟我一起動起來～</span>
              </div>
            </div>
          <h1><%=rs.getString("ProductName")%></h1>
          <p class="price">NT.<%=rs.getString("Price")%></p>
          <p class="word">防疫期間，在家也能運動!</p>
        </div>
        <a href="information.jsp?page=<%=rs.getString("ProductID")%>"><button>點擊前往購買</button></a>     
      </div>	
<%
					}
					//顯示指定的熱門商品2
                    sql = "SELECT * FROM `product` WHERE `ProductID`='20'" ;
                    rs =  con.createStatement().executeQuery(sql);                 
                    while(rs.next()){			
%>	
			<div class="card card02" id="hot2">
					<div class="cardcontainer">
            <img src="../assets/img/<%=rs.getString("Pic1")%>" class="cardimage">
            <div class="cardoverlay">
              <div class="cardtext">好評持續增加!<br><span style=" font-size: 25px;">滿意度高達90%</span></div>
            </div>
				    <h1><%=rs.getString("ProductName")%></h1>
				    <p class="price">NT.<%=rs.getString("Price")%></p>
				    <p class="word">建一座屬於自己的島吧!</p>
			</div>
				  <a href="information.jsp?page=<%=rs.getString("ProductID")%>"><button>點擊前往購買</button></a>
				</div>
<%
					}
					//顯示指定的熱門商品3
                    sql = "SELECT * FROM `product` WHERE `ProductID`='10'" ;
                    rs =  con.createStatement().executeQuery(sql);                
                    while(rs.next()){			
%>    
				<div class="card card03" id="hot3">
					<div class="cardcontainer">
					    <img src="../assets/img/<%=rs.getString("Pic1")%>" class="cardimage">
					    <div class="cardoverlay">
							<div class="cardtext">銷售量持續上升!<br><span style=" font-size: 25px;">你還在等什麼?!</span></div>
						</div>
				    <h1><%=rs.getString("ProductName")%></h1>
				    <p class="price">NT.<%=rs.getString("Price")%></p>
				    <p class="word">跟著路易吉，一起去冒險吧!</p>
				    </div>
				    <a href="information.jsp?page=<%=rs.getString("ProductID")%>"><button>點擊前往購買</button></a>
				</div>
<%
					}
// 關閉連線					
                    con.close();
%>				  
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
                <label for="email"><b class="hig3">EMAIL</b></label><br>
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