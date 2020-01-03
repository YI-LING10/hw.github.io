<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<html>
<head>

<title>新增訂單</title>
</head>
<body>
<%  
	
	String relTel = new String(request.getParameter("relTel").getBytes("ISO-8859-1"),"UTF-8");
	String relAdd = new String(request.getParameter("relAdd").getBytes("ISO-8859-1"),"UTF-8");	
	String note = new String(request.getParameter("notes").getBytes("ISO-8859-1"),"UTF-8");
	
	String sql="use nocat";
    con.createStatement().execute(sql);
    
	
	
	
	if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	ResultSet rs=con.createStatement().executeQuery(sql);
	String userName="", password="",name="",sex="",birth="",mail="";
	while(rs.next()){
	    userName=rs.getString("userName");
		password=rs.getString("password");
		name=rs.getString("name");
		sex=rs.getString("sex");
		birth=rs.getString("birth");
		mail=rs.getString("mail");
	}
					

           java.sql.Date mesDate=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="insert neworder(mesDate,relTel,relAdd,notes,name) ";
           sql+="value ('" + mesDate + "', ";
			sql+="'"+relTel+"', ";	
			sql+="'"+relAdd+"', ";	
			sql+="'"+note+"', ";	
			sql+="'"+userName+"') ";	

           con.createStatement().execute(sql);

	
			

//Step 5: 顯示結果 con.close();//Step 6: 關閉連線
          //直接顯示最新的資料
           response.sendRedirect("../order2.jsp?name1="+userName+"");
	  
	}else{
		response.sendRedirect("../registered_again.html");
	}
	
%>
</body>
</html>