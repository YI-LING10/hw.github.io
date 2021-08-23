<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%  request.setCharacterEncoding("UTF-8")  ;%>
<%
if (request.getParameter("action") != null)
{
	String action = request.getParameter("action");
	if (action.equals("insert"))
	{
		try
		{
			// 取得參數
		   String new_pname=request.getParameter("pname");
		   String new_game=request.getParameter("game");
		   String new_price=request.getParameter("price");
		   String new_publisher=request.getParameter("publisher");
		   String new_sid=request.getParameter("sid");
		   String new_mode=request.getParameter("mode");
		   String new_reserve=request.getParameter("reserve");
		   String new_introduction=request.getParameter("introduction");
		   String new_pic1=request.getParameter("pic1");
		   String new_pic2=request.getParameter("pic2");
		   String new_pic3=request.getParameter("pic3");
           //執行 SQL 指令	
           sql="INSERT `product` (`ProductName`,`GameClass`, `Price`,`Publisher`,`SupplierID`,`GameMode`,`Reserve`,`Introduction`,`Pic1`,`Pic2`,`Pic3`) ";
           sql+="VALUE ('" + new_pname + "', ";
		   sql+="'"+new_game+"', ";
           sql+="'"+new_price+"', ";   
		   sql+="'"+new_publisher+"', ";  
		   sql+="'"+new_sid+"', ";  
		   sql+="'"+new_mode+"', ";  
		   sql+="'"+new_reserve+"', ";  
		   sql+="'"+new_introduction+"', ";  
		   sql+="'"+new_pic1+"', ";  
		   sql+="'"+new_pic2+"', ";  
           sql+="'"+new_pic3+"')";      

           con.createStatement().execute(sql);

			// 關閉連線
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	else if (action.equals("update"))
	{
		// 執行 SQL 指令
		    String s_page=request.getParameter("page");
			sql = "UPDATE `product` SET `ProductName`='"+request.getParameter("pname")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `GameClass`='"+request.getParameter("game")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Price`='"+request.getParameter("price")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Publisher`='"+request.getParameter("publisher")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `SupplierID`='"+request.getParameter("sid")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `GameMode`='"+request.getParameter("mode")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Reserve`='"+request.getParameter("reserve")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Introduction`='"+request.getParameter("introduction")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Pic1`='"+request.getParameter("pic1")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Pic2`='"+request.getParameter("pic2")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `product` SET `Pic3`='"+request.getParameter("pic3")+"' WHERE `ProductID`='"+s_page+"'";
			con.createStatement().execute(sql);	

		// 關閉連線
		con.close();

	}
	else if (action.equals("delete"))
	{
		// 取得參數
		String page_string = request.getParameter("page");

		// 執行 SQL 指令
		sql = "DELETE FROM `product` WHERE `ProductID`='"+page_string+"'";
		con.createStatement().executeUpdate(sql);

		// 關閉連線
		con.close();
	}
}

// 跳轉回後台管理頁
response.sendRedirect("../../pages/backstage03.jsp");
%>