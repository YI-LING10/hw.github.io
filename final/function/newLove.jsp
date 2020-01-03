<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<html>
<head>

<title>新增我的收藏</title>
</head>
<body>
<%           
	
	String page_string = request.getParameter("page");  
	if (page_string == null) 
        page_string = "1";  //無留言時將頁數指標訂為1      
    Integer current_page=Integer.valueOf(page_string);
	
	String sql="use nocat";
    con.createStatement().execute(sql);
    sql="select * from products where no='"+page_string+"'";
    ResultSet rs=con.createStatement().executeQuery(sql);
	
	if(rs.next()){
	int no=rs.getInt(1);
    String product=rs.getString(3);
	int proPrice=rs.getInt(4);
	String proPics=rs.getString(6);
	String proNote=rs.getString(9);
	
	
	if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	rs=con.createStatement().executeQuery(sql);
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
					

           java.sql.Date mesDate=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="insert p_collect (no, product, proPrice,propics,proNote,name) ";
           sql+="value ('" + no + "', ";
           sql+="'"+product+"', ";  
           sql+="'"+proPrice+"', ";		   
           sql+="'"+proPics+"', ";  
			sql+="'"+proNote+"', ";	
			sql+="'"+userName+"') ";	

           con.createStatement().execute(sql);
//Step 6: 關閉連線
	
			
//Step 5: 顯示結果 con.close();
          //直接顯示最新的資料
           response.sendRedirect("../goods.jsp?page="+no+"");
		   
	}else{
		response.sendRedirect("../registered_again.html");
	}
	}
	else{}
%>
</body>
</html>
