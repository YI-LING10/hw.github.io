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
    <link rel="stylesheet" href="../assets/css/order.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <title>後台</title>
  </head>
  <body>
<%
//判斷管理者之後台管理鍵
sql = "SELECT * FROM `managers` WHERE `ManagersAccount`='"+session.getAttribute("id")+"'";
ResultSet rs =  con.createStatement().executeQuery(sql);  
if(rs.next()){
%>
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
		<a href="backstage01.jsp">後台管理</a>
      </div>
      <div class="d">
        <form class="example" action="search.jsp" style="max-width:190px; padding: 12px 15px;">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
      </div>
    </div>
  <!--導覽-->

    <div class="container">
      
      <div class="row">
        <div class="col-4" id="content">
          <div style="width: 200px; height:500px; border-right: solid 1px gray;">
            &nbsp;後台管理<br><br>
            <div class="vertical-menu">
            <a href="backstage01.jsp" >管理者</a>
            <a href="backstage02.jsp">會員</a>
			<a href="backstage03.jsp">產品</a>
			<a href="backstage04.jsp" >訂單</a>
			<a href="backstage05.jsp" class="active">供應商</a>
            </div>
          </div>
        </div>
        <div class="col-8">
          <div class="order">
            <h3>供應商瀏覽</h3>
			<input type="submit" name="" value="新增供應商" class="nes-btn is-primary" data-toggle="modal" data-target="#exampleModal" >
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
	  <form action="../assets/jsp/b05.jsp" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">新增供應商</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	    <div class="form-group">
			<input type="hidden" name="action" value="insert" class="form-control">
		</div>
        <div class="form-group">
			<label for="exampleInputAccount">名稱</label>
			<input type="text" class="form-control" id="exampleInputAccount" name="sname">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword">地址</label>
			<input type="text" class="form-control" id="exampleInputPassword" name="addr">
		</div>
		<div class="form-group">
			<label for="exampleInputTel">電話</label>
			<input type="text" class="form-control" id="exampleInputTel" name="tel">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">信箱</label>
			<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">新增</button>
      </div>
	  </form>
    </div>
  </div>
</div>
            <table class="o_content">
              <tr style="border-bottom:2px solid red;">
                <th>供應商編號</th>
                <th>名稱</th>	
                <th>地址</th>
                <th>電話</th>
                <th>信箱</th>
				<th></th>	
				<th></th>
              </tr>
<% 
                    //顯示
					sql = "SELECT * FROM `suppliers`" ;
                    rs =  con.createStatement().executeQuery(sql); 
					while(rs.next()){
%>
        <form action="../assets/jsp/b05.jsp" method="post">
		<input type="hidden" name="action" value="delete" class="form-control">
		<input type="hidden" name="page" value="<%=rs.getString("SuppliersID")%>" class="form-control">
			  <tr>
                <td><%=rs.getString("SuppliersID")%></td>
                <td><%=rs.getString("SuppliersName")%></td>	
                <td><%=rs.getString("SuppliersAddress")%></a></td>
                <td><%=rs.getString("SuppliersPhone")%></td>
                <td><%=rs.getString("SuppliersEmail")%></td>  
				<td><input type="submit" style="background-color:#00000000; border-style:none;" value="X"></input></td>
				<td><a data-toggle="modal" data-target="#exampleModal1-<%=rs.getString("SuppliersID")%>">修改</a></td>
              </tr> 
		</form>
		
<!-- Modal1 -->
<div class="modal fade" id="exampleModal1-<%=rs.getString("SuppliersID")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
	  <form action="../assets/jsp/b05.jsp" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">修改供應商</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	    <div class="form-group">
			<input type="hidden" name="action" value="update" class="form-control">
			<input type="hidden" name="page" value="<%=rs.getString("SuppliersID")%>" class="form-control">
		</div>
		<div class="form-group">
			<label for="exampleInputAccount">名稱</label>
					<input type="text" class="form-control" id="exampleInputAccount" name="sname" value="<%=rs.getString("SuppliersName")%>">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword">地址</label>
			<input type="text" class="form-control" id="exampleInputPassword" name="addr" value="<%=rs.getString("SuppliersAddress")%>">
		</div>
		<div class="form-group">
			<label for="exampleInputTel">電話</label>
			<input type="text" class="form-control" id="exampleInputTel" name="tel" value="<%=rs.getString("SuppliersPhone")%>">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">信箱</label>
			<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" value="<%=rs.getString("SuppliersEmail")%>">
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">儲存變更</button>
      </div>
	  </form>
    </div>
  </div>
</div>
<%
					}
}else{
	response.sendRedirect("index.jsp");
}
// 關閉連線					
                    con.close();
%>

              </table>
			  <h3></h3>
          </div>
        </div>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>