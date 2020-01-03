<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<html>
<head>

<title>取消我的收藏</title>
</head>
<body>
<%           
	
	String no = request.getParameter("no");  
	
    
	
	String sql="use nocat";
    con.createStatement().execute(sql);
    
	
	
	if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	ResultSet rs=con.createStatement().executeQuery(sql);
	String userName="", password="",name="",sex="",birth="",mail="";
	String name1="";
	while(rs.next()){
	    userName=rs.getString("userName");
		password=rs.getString("password");
		name=rs.getString("name");
		name1=rs.getString("userName");
		sex=rs.getString("sex");
		birth=rs.getString("birth");
		mail=rs.getString("mail");
	}
					

           
//Step 4: 執行 SQL 指令	
           sql="DELETE FROM p_collect WHERE name='"+userName+"' and no='"+no+"' ";
           

           con.createStatement().execute(sql);
//Step 6: 關閉連線
	
			
//Step 5: 顯示結果 con.close();
          //直接顯示最新的資料
           response.sendRedirect("../collect.jsp?page1=1&name1="+name1+"");
		   
	}else{
		response.sendRedirect("../registered_again.html");
	}
	
%>
</body>
</html>
