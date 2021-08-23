<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>delete</title>
</head>
<body>
<%  request.setCharacterEncoding("UTF-8")  ;%>
<%
if(session.getAttribute("id") != null ){
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use switch";
           con.createStatement().execute(sql);
		   
//Step 4: 執行 SQL 指令	
			String page_string = request.getParameter("page");
			sql = "SELECT * FROM `shoppingcar`,`product` WHERE (`ShoppingcarID`='" +page_string+"') AND (`shoppingcar`.`ProductID`=`product`.`ProductID`);"; 
			ResultSet rs =con.createStatement().executeQuery(sql);
			int reserve=0,new_quantity=0;
			String pid="";
			while(rs.next()){
				reserve=Integer.parseInt(rs.getString("Reserve"));
				new_quantity=Integer.parseInt(rs.getString("Quantity"));
				pid=rs.getString("ProductID");
			}
			sql = "DELETE FROM `shoppingcar` WHERE `ShoppingcarID`='"+page_string+"'";
			con.createStatement().executeUpdate(sql);

//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("../../pages/cart.jsp");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
}else{
	response.sendRedirect("../../pages/index.jsp") ;
}
%>
</body>