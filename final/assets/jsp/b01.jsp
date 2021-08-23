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
		   String new_id=request.getParameter("id");
		   String new_pwd=request.getParameter("pwd");
		   String new_tel=request.getParameter("tel");
		   String new_email=request.getParameter("email");
           //執行 SQL 指令	
		   sql = "SELECT * FROM `customers`,`managers` WHERE (`CustomersAccount`='"+new_id+"') OR (`ManagersAccount`='"+new_id+"')";
		   ResultSet rs =  con.createStatement().executeQuery(sql);  
		   if(rs.next()){

		   }else{
           sql="INSERT `managers` (`ManagersAccount`,`ManagersPassword`, `ManagersPhone`,`ManagersEmail`) ";
           sql+="VALUE ('" + new_id + "', ";
		   sql+="'"+new_pwd+"', ";
           sql+="'"+new_tel+"', ";   
           sql+="'"+new_email+"')";      
           //out.write(sql); // debug
           con.createStatement().execute(sql);
		   }

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
			sql = "UPDATE `managers` SET `ManagersAccount`='"+request.getParameter("id")+"' WHERE `ManagersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `managers` SET `ManagersPassword`='"+request.getParameter("pwd")+"' WHERE `ManagersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `managers` SET `ManagersPhone`='"+request.getParameter("tel")+"' WHERE `ManagersID`='"+s_page+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `managers` SET `ManagersEmail`='"+request.getParameter("email")+"' WHERE `ManagersID`='"+s_page+"'";
			con.createStatement().execute(sql);

		// 關閉連線
		con.close();

	}
	else if (action.equals("delete"))
	{
		// 取得參數
		String page_string = request.getParameter("page");

		// 執行 SQL 指令
		sql = "DELETE FROM `managers` WHERE `ManagersID`='"+page_string+"'";
		con.createStatement().executeUpdate(sql);

		// 關閉連線
		con.close();
	}
}

// 跳轉回後台管理頁
response.sendRedirect("../../pages/backstage01.jsp");
%>