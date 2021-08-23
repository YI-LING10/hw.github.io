<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
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
		   //取CustomersID
		    sql = "SELECT * FROM `customers` WHERE `CustomersAccount`='" +session.getAttribute("id")+"';"; 
			ResultSet rs =con.createStatement().executeQuery(sql);
			String id="";
			while(rs.next()){
				id=rs.getString("CustomersID");
			}
		   String new_id=id;
		   //取Quantity
           String new_productid=request.getParameter("page");
		   int new_quantity=Integer.parseInt(request.getParameter("quantity"));
		   //取ProductID
		   sql = "SELECT * FROM `product` WHERE `ProductID`="+new_productid+";"; 
			rs =con.createStatement().executeQuery(sql);
			//取Reserve
			int reserve=0;
			while(rs.next()){
				reserve=Integer.parseInt(rs.getString("Reserve"));
			}

			if(reserve-new_quantity>=0){ 
				sql = "SELECT * FROM `shoppingcar` WHERE (`ProductID`="+new_productid+") AND (`CustomersID`='"+id+"');";
				rs =con.createStatement().executeQuery(sql);
				if(rs.next()){
					sql = "UPDATE `shoppingcar` SET `Quantity`='"+new_quantity+"' WHERE (`ProductID`='"+new_productid+"') AND (`CustomersID`='"+id+"');";
					con.createStatement().execute(sql);
				}else{
					sql="INSERT `shoppingcar` (`CustomersID`, `ProductID`, `Quantity`)VALUE ('" + new_id + "','" + new_productid + "','"+new_quantity+"')";     
					con.createStatement().execute(sql);
				}

				con.close();

				response.sendRedirect("../../pages/cart.jsp");
			}else{
				con.close();
				out.println("<script type='text/javascript'>");
					out.println("alert('數量不足!請重新選擇!');location.href='../../pages/information.jsp?page="+new_productid+"'; ");
				out.println("</script>");
			}

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
	out.println("<script type='text/javascript'>");
		out.println("alert('請先登入!');location.href='../../pages/index.jsp'; ");
	out.println("</script>");
}
%>
</body>
</html>