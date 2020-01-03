<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<html>
<head>
<%!
	String newline(String str)
	{
		int index=0;
		while((index=str.indexOf("\n"))!=-1)
			str=str.substring(0,index)+"<br>"+str.substring(index+1);
		return (str);
	}
	

%>
<title>新增評論</title>
</head>
<body>
<%           
	String content1=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
	String message=newline(content1);
	String rating=new String(request.getParameter("rating"));
	String page_string = request.getParameter("page");  
	if (page_string == null) 
        page_string = "1";  //無留言時將頁數指標訂為1      
    Integer current_page=Integer.valueOf(page_string);
	
	String sql="use nocat";
    con.createStatement().execute(sql);
    sql="select * from products where no='"+page_string+"'";
    ResultSet rs=con.createStatement().executeQuery(sql);
	
	if(rs.next()){
    String product=rs.getString(3);
	int no=rs.getInt(1);
	
	
	if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	rs=con.createStatement().executeQuery(sql);
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
           sql="insert messages (name, message, product,mesDate,rating) ";
           sql+="value ('" + name + "', ";
           sql+="'"+message+"', ";  
           sql+="'"+product+"', ";		   
           sql+="'"+mesDate+"', ";  
			sql+="'"+rating+"') ";		   

           con.createStatement().execute(sql);
//Step 6: 關閉連線
	
			
//Step 5: 顯示結果 con.close();
          //直接顯示最新的資料
           response.sendRedirect("../goods.jsp?page="+no+"&page1=1");
		   
	}else{
		response.sendRedirect("../registered_again.html");
	}
	}
	else{}
%>
</body>
</html>
