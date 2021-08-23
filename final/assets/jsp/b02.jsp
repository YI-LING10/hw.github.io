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
		   String new_cname=request.getParameter("cname");
		   String new_id=request.getParameter("id");
		   String new_pwd=request.getParameter("pwd");
		   String new_sex=request.getParameter("sex");
		   String new_tel=request.getParameter("tel");
		   String new_addr=request.getParameter("addr");
		   String new_email=request.getParameter("email");
		   //執行 SQL 指令	
           sql="INSERT `customers` (`CustomersName`,`CustomersAccount`, `CustomersPassword`,`CustomersGendre`,`CustomersPhone`,`CustomersAddress`,`CustomersEmail`) ";
           sql+="VALUE ('" + new_cname + "', ";
		   sql+="'"+new_id+"', ";
		   sql+="'"+new_pwd+"', ";
		   sql+="'"+new_sex+"', ";
		   sql+="'"+new_tel+"', ";
           sql+="'"+new_addr+"', ";   
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
			sql = "UPDATE `customers` SET `CustomersName`='"+request.getParameter("cname")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersAccount`='"+request.getParameter("id")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersPassword`='"+request.getParameter("pwd")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersGendre`='"+request.getParameter("sex")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersPhone`='"+request.getParameter("tel")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersAddress`='"+request.getParameter("addr")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);
			sql = "UPDATE `customers` SET `CustomersEmail`='"+request.getParameter("email")+"' WHERE `CustomersID`='"+s_page+"'";
			con.createStatement().execute(sql);	

		// 關閉連線
		con.close();

	}
	else if (action.equals("delete"))
	{
		// 取得參數
		String page_string = request.getParameter("page");

		// 執行 SQL 指令
		sql = "DELETE FROM `customers` WHERE `CustomersID`='"+page_string+"'";
		con.createStatement().executeUpdate(sql);

		// 關閉連線
		con.close();
	}
}

// 跳轉回後台管理頁
response.sendRedirect("../../pages/backstage02.jsp");
%>