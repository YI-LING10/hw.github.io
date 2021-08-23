<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
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
		   
		   sql = "SELECT * FROM `customers`,`shoppingcar` WHERE (`customers`.`CustomersID`=`shoppingcar`.`CustomersID`) AND (`CustomersAccount`='" +session.getAttribute("id")+"');";
		   ResultSet rs =con.createStatement().executeQuery(sql);
		   if(rs.next()){
		   
		    sql = "SELECT * FROM `orders`"; 
			rs =con.createStatement().executeQuery(sql);
			rs.last();
			int new_OID=Integer.parseInt(rs.getString("OrdersID"));
		   
			sql = "SELECT * FROM `customers`,`shoppingcar`,`product` WHERE (`customers`.`CustomersID`=`shoppingcar`.`CustomersID`) AND (`product`.`ProductID`=`shoppingcar`.`ProductID`) AND (`CustomersAccount`='" +session.getAttribute("id")+"');"; 
			rs =con.createStatement().executeQuery(sql);
			String new_ProID="";
			while(rs.next()){
			String new_CusID=rs.getString("CustomersID");
			new_ProID=rs.getString("ProductID");
			int new_quantity=Integer.parseInt(rs.getString("Quantity"));
			int new_price=Integer.parseInt(rs.getString("Price"));			
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
		   String new_transport=new String(request.getParameter("s"));
		   String new_payment=new String(request.getParameter("p"));
		   String new_remarks=new String(request.getParameter("note"));
		   
//Step 4: 執行 SQL 指令	
           sql="INSERT `orders` (`OrdersID`,`CustomersID`, `ProductID`, `TotalPrice`, `PurchaseQuantity`, `PurchaseDate`, `Transport`, `Payment`, `Remarks`) ";
           sql+="VALUE ('" + (new_OID+1) + "', ";
		   sql+="'"+new_CusID+"', ";
           sql+="'"+new_ProID+"', ";
           sql+="'"+(new_price*new_quantity)+"', ";
           sql+="'"+new_quantity+"', ";
		   sql+="'"+new_date+"', "; 	
		   sql+="'"+new_transport+"', "; 	
		   sql+="'"+new_payment+"', ";
           sql+="'"+new_remarks+"')";      

           con.createStatement().execute(sql);
		   
			}
			
			sql = "SELECT * FROM `product`,`shoppingcar` WHERE `product`.`ProductID`=`shoppingcar`.`ProductID`;"; 
			rs =con.createStatement().executeQuery(sql);
			int reserve=0,new_quantity=0;
			while(rs.next()){
				reserve=Integer.parseInt(rs.getString("Reserve"));
				new_quantity=Integer.parseInt(rs.getString("Quantity"));
				sql = "UPDATE `product` SET `Reserve`='"+(reserve-new_quantity)+"' WHERE `ProductID`='"+new_ProID+"'";
			    con.createStatement().execute(sql);
			}
			
			sql = "SELECT * FROM `customers`,`shoppingcar` WHERE (`customers`.`CustomersID`=`shoppingcar`.`CustomersID`) AND (`CustomersAccount`='" +session.getAttribute("id")+"');"; 
			rs =con.createStatement().executeQuery(sql);
			while(rs.next()){
				String new_CarID=rs.getString("ShoppingcarID");
				sql = "DELETE FROM `shoppingcar` WHERE `ShoppingcarID`='"+new_CarID+"'";
				con.createStatement().executeUpdate(sql);
			}
			
           con.close();

		   out.println("<script type='text/javascript'>");
			out.println("alert('購物成功!');location.href='../../pages/order.jsp'; ");
		   out.println("</script>");
		   
		   }else{
			   con.close();
			    out.println("<script type='text/javascript'>");
					out.println("alert('購物失敗!');location.href='../../pages/order.jsp'; ");
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
	response.sendRedirect("../../pages/index.jsp") ;
}
%>
</body>
</html>