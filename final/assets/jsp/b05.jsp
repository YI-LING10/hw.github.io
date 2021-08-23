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
		   String new_sname=request.getParameter("sname");
		   String new_addr=request.getParameter("addr");
		   String new_tel=request.getParameter("tel");
		   String new_email=request.getParameter("email");
           //執行 SQL 指令	
           sql="INSERT `suppliers` (`SuppliersName`,`SuppliersAddress`, `SuppliersPhone`,`SuppliersEmail`) ";
           sql+="VALUE ('" + new_sname + "', ";
		   sql+="'"+new_addr+"', ";
		   sql+="'"+new_tel+"', ";  
           sql+="'"+new_email+"')";       

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
			sql = "UPDATE `suppliers` SET `SuppliersName`='"+request.getParameter("sname")+"' WHERE `SuppliersID`='"+s_page+"'";
			con.createStatement().execute(sql);
			sql = "UPDATE `suppliers` SET `SuppliersAddress`='"+request.getParameter("addr")+"' WHERE `SuppliersID`='"+s_page+"'";
			con.createStatement().execute(sql);
			sql = "UPDATE `suppliers` SET `SuppliersPhone`='"+request.getParameter("tel")+"' WHERE `SuppliersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `suppliers` SET `SuppliersEmail`='"+request.getParameter("email")+"' WHERE `SuppliersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
	

		// 關閉連線
		con.close();

	}
	else if (action.equals("delete"))
	{
		// 取得參數
		String page_string = request.getParameter("page");

		// 執行 SQL 指令
		sql = "DELETE FROM `suppliers` WHERE `SuppliersID`='"+page_string+"'";
		con.createStatement().executeUpdate(sql);

		// 關閉連線
		con.close();
	}
}

// 跳轉回後台管理頁
response.sendRedirect("../../pages/backstage05.jsp");
%>