<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%  request.setCharacterEncoding("UTF-8")  ;%>
<%!
	//換行
	String newline(String str)
	{
		int index=0;
		while((index=str.indexOf("\n"))!=-1)
			str=str.substring(0,index)+"<br>"+str.substring(index+1);
		return(str);
	}
%>
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
           sql="use switch";
           con.createStatement().execute(sql);
		   sql = "SELECT * FROM `customers` WHERE `CustomersAccount`='" +session.getAttribute("id")+"';"; 
			ResultSet rs =con.createStatement().executeQuery(sql);
			String id="";
			while(rs.next()){
				id=rs.getString("CustomersID");
			}
           String new_cid=id;
		   String new_pid=request.getParameter("page");
           String new_content=request.getParameter("content");
		   new_content=newline(new_content);
		   String new_star=request.getParameter("rating");
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT `message` (`CustomersID`, `ProductID`, `MessageContent`, `MessageStar`, `MessageDate`) ";
           sql+="VALUE ('" + new_cid + "', ";
           sql+="'"+new_pid+"\', ";
           sql+="'"+new_content+"', ";
           sql+="'"+new_star+"', ";    
		   sql+="'"+new_date+"')";

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();		   
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("../../pages/information.jsp?page="+new_pid+"&page1=1");
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
