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
    <link rel="stylesheet" href="../assets/css/information.css">
    <link rel="stylesheet" href="../assets/css/cart.css">
    <link rel="stylesheet" href="../assets/css/all_p.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>商品資訊</title>
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
<%
					//顯示產品
					String page_string = request.getParameter("page");
                    sql = "SELECT * FROM `product` WHERE `ProductID`='"+page_string +"'";
                    rs =  con.createStatement().executeQuery(sql);    
					while(rs.next()){
						int reserve=Integer.parseInt(rs.getString("Reserve"));
%> 
    <div class="container">
        <div class="row">
            <div class="col-2 ppic">
                <img src="../assets/img/<%=rs.getString("Pic1")%>" alt="" width="200px">
            </div>
            <div class="col-10 infor">
			<form action="../assets/jsp/caradd.jsp?page=<%=rs.getString("ProductID")%>" method="POST">
                <div class="box">
                    <!-- <h3>寶可夢 劍</h3>
                    <p>類型: 角色扮演</p>
                    <p>價格: $1790</p>
                    <p>發行商: 任天堂株式會社</p> -->
                    <div class="lists">
                        <ul class="nes-list is-circle">
                          <h3><%=rs.getString("ProductName")%></h3>
                          <li>類型: <%=rs.getString("GameClass")%></li>
                          <li>價格: <%=rs.getString("Price")%></li>
                          <li class="qtyb">
                            <label for="">數量: </label>
                            <input type='button' value='-' class='qtyminus' field='quantity' />
                            <input type='text' name='quantity' value='1' class='qty' readonly unselectable="on" />
                            <input type='button' value='+' class='qtyplus' field='quantity' />
                             &nbsp&nbsp(庫存:<%=rs.getString("Reserve")%>)
                          </li>
                          <li>發行商: <%=rs.getString("Publisher")%></li>
                        </ul>
                    </div>
                </div>
                <section>
                    <button type="button" id="atc" class="nes-btn is-primary" onclick="document.getElementById('dialog-rounded').showModal();">
                      Add to Cart
                    </button>
                    <dialog class="nes-dialog is-rounded" id="dialog-rounded">
                      <form method="dialog">
                        <p class="title">確定加入購物車?</p>
                        <p><%=rs.getString("ProductName")%></p>
                        <menu class="dialog-menu">
<%
//判斷庫存
if(reserve!=0){
%>
                          <button class="nes-btn" type="button" id='cancel'>No</button>
                          <button class="nes-btn is-primary" type="sumit">Yes</button>
<%
}else{
%>
						  <button class="nes-btn" type="button" id='cancel'>No</button>
                          <button class="nes-btn is-primary" type="sumit" disabled>Yes</button>
<%
}
%>
                        </menu>
                      </form>
                    </dialog>
                </section>
            </form>
			</div>
            <div class="col intro">
                <h3 class="title">簡介:</h3>
                <p><%=rs.getString("Introduction")%></p>
            </div>
            <div class="col-10 screen">
                <div id="bc">
                    <img src="../assets/img/<%=rs.getString("Pic2")%>" alt="">
                    <img src="../assets/img/<%=rs.getString("Pic3")%>" alt=""> 
                </div>
                <div id="pop">
                    <div class="bg">
                        <img src="" alt="">
                    </div>
                </div>               
            </div>
<%
					}
%>
            <div class="col-10 comment">
                <h3 class="title">評論:</h3>
                <form action="../assets/jsp/boardadd.jsp?page=<%=page_string%>" method="post">
<%
//判斷是否登入
if(session.getAttribute("id") != null ){
%>
                    <label for="textarea_field">
                        <!-- <section class="icon-list">
                            <i class="nes-icon is-medium star"></i>
                            <i class="nes-icon is-medium star is-half"></i>
                            <i class="nes-icon is-medium star is-transparent"></i>
                            <i class="nes-icon is-medium star is-empty"></i>
                        </section> -->
                        <div class="rating">
                            <input type="radio" id="star5" name="rating" value="5" checked hidden/>
                            <label for="star5"></label>
                            <input type="radio" id="star4" name="rating" value="4" hidden/>
                            <label for="star4"></label>
                            <input type="radio" id="star3" name="rating" value="3" hidden/>
                            <label for="star3"></label>
                            <input type="radio" id="star2" name="rating" value="2" hidden/>
                            <label for="star2"></label>
                            <input type="radio" id="star1" name="rating" value="1" hidden/>
                            <label for="star1"></label>
                        </div>
                    </label>
                    <textarea name="content" id="textarea_field" class="nes-textarea" placeholder="How do u think :)" required></textarea>
                    <button type="submit" class="nes-btn is-primary">Send</button>
<%
}else{
%>
					<br><button type="button" class="nes-btn is-primary" data-toggle="modal" data-target="#ooo">請先登入</button>
<%
}
%>
                </form><br>
<%
           sql="SELECT * FROM `message` WHERE `ProductID`="+page_string;
           rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
		   
           //讀取page1變數
           String p_string = request.getParameter("page1");

           if (p_string == null) 
               p_string = "0";  
           int current_page=Integer.valueOf(p_string);
           if(current_page==0) //若未指定page1, 令current_page為1
	          current_page=1; 

           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `message`,`customers` WHERE (`message`.`CustomersID`=`customers`.`CustomersID`) AND (`ProductID`="+page_string+") ORDER BY `MessageID` DESC LIMIT ";
           sql+=start_record+",5";
           rs=con.createStatement().executeQuery(sql);
		   
//逐筆顯示, 直到沒有資料(最多還是5筆)
for(int i=0;i<total_content;i++ )
{
           while(rs.next())
           {
			   int star=Integer.parseInt(rs.getString("MessageStar"));

%>
                <div class="hc">
                    <div class="nes-balloon from-left nes-pointer">
                        <div class="up">
                            <p class="name"><%=rs.getString("CustomersName")%></p>
<%
for(int j=0;j<star;j++){
%>
                            <i class="nes-icon is-small star"></i>
<%
}
for(int j=0;j<5-star;j++){
%>
                            <i class="nes-icon is-small star is-transparent"></i>
<%
}
%>
                        </div>
                        <%=rs.getString("MessageContent")%>
                    </div>
                </div>
<%
			}
}
%> 	
				<nav aria-label="Page navigation example">
                  <ul class="pagination" style="justify-content: center">
<%
//第一頁
if(current_page!=1){
%>
                    <li class="page-item">
                      <a class="page-link" href="information.jsp?page=<%=page_string%>&page1=1" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
<%
}
//第?頁
for(int i=1;i<=page_num;i++){
%>

                    <li class="page-item"><a class="page-link" href="information.jsp?page=<%=page_string%>&page1=<%=i%>"><%=i%></a></li>
<%
}
//最後一頁
if(current_page<page_num){
%>
                    <li class="page-item">
                      <a class="page-link" href="information.jsp?page=<%=page_string%>&page1=<%=page_num%>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
<%
}
%>
                  </ul>
                </nav>
			</div>
        </div>
    </div>

<%

// 關閉連線					
                    con.close();
%>                
    
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
			  <button type="button" class="close mr-3" data-dismiss="modal" style="font-size:30px;">&times;</button>
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
    <script src="../assets/js/qty.js"></script>
    <script type="text/javascript">
        var imgs = document.getElementById("bc").getElementsByTagName("img");
        var lens = imgs.length;
        var popup = document.getElementById("pop");
    
        for(var i = 0; i < lens; i++){
            imgs[i].onclick = function (event){
                event = event||window.event;
                var target = document.elementFromPoint(event.clientX, event.clientY);
                showBig(target.src);
            }
        }
        popup.onclick = function (){
            popup.style.display = "none";
        }
        function showBig(src){
            popup.getElementsByTagName("img")[0].src = src;
            popup.style.display = "block";
        }
    </script>
	<script>
      $(document).ready(function(){
        $('#atc').click(function(){
          $('#dialog-rounded').show();
        })
        $('#cancel').click(function(){
          $('#dialog-rounded').hide();
        })
      })
    </script>
</body>
</html>