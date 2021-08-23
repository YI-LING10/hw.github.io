<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <title>add</title>
  </head>
<body>
<%
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
           sql="use `switch`";
           con.createStatement().execute(sql);
		   String new_id=request.getParameter("id");
		   String new_pwd=request.getParameter("pwd");
		   String new_cname=new String(request.getParameter("cname").getBytes("ISO-8859-1"),"UTF-8");
		   String new_gender=request.getParameter("gender");
		   String new_email=request.getParameter("email");
		   String new_tel=request.getParameter("tel");
		   String new_addr=new String(request.getParameter("addr").getBytes("ISO-8859-1"),"UTF-8");
//Step 4: 執行 SQL 指令	

		   sql = "SELECT * FROM `customers`,`managers` WHERE (`CustomersAccount`='"+new_id+"') OR (`ManagersAccount`='"+new_id+"')";
		   ResultSet rs =  con.createStatement().executeQuery(sql);  
		   if(rs.next()){
			   out.println("<script type='text/javascript'>");
					out.println("alert('帳號重複!請重新註冊!');location.href='../../pages/index.jsp'; ");
			   out.println("</script>");
		   }else{
           sql="INSERT `customers` (`CustomersName`,`CustomersAccount`, `CustomersPassword`,`CustomersGendre`, `CustomersEmail`, `CustomersPhone`, `CustomersAddress`) ";
           sql+="VALUE ('" + new_cname + "', ";
           sql+="'"+new_id+"', ";
		   sql+="'"+new_pwd+"', ";
		   sql+="'"+new_gender+"', ";
           sql+="'"+new_email+"', ";
           sql+="'"+new_tel+"', ";   
           sql+="'"+new_addr+"')";      

           con.createStatement().execute(sql);
		   }
//Step 6: 關閉連線
           con.close();
		   
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  out.println("<script type='text/javascript'>");
			out.println("alert('註冊成功!');location.href='../../pages/index.jsp'; ");
		  out.println("</script>");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>