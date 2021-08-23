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
			if(session.getAttribute("id")!=null){
			sql = "UPDATE `customers` SET `CustomersPassword`='"+request.getParameter("pwd")+"' WHERE `CustomersAccount`='"+session.getAttribute("id")+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersEmail`='"+request.getParameter("email")+"' WHERE `CustomersAccount`='"+session.getAttribute("id")+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersPhone`='"+request.getParameter("tel")+"' WHERE `CustomersAccount`='"+session.getAttribute("id")+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `customers` SET `CustomersAddress`='"+request.getParameter("addr")+"' WHERE `CustomersAccount`='"+session.getAttribute("id")+"'";
			con.createStatement().execute(sql);	
//Step 4: 關閉連線
			con.close();
			out.println("<script type='text/javascript'>");
				out.println("alert('更新成功!');location.href='../../pages/member.jsp'; ");
		    out.println("</script>");
			}
			else{
			  con.close();
			  out.print("更新失敗!! <a href='../../pages/member.jsp'>按此</a>回會員頁面!!");
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