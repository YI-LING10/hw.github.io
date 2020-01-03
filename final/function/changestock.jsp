<%@page import = "java.sql.*,java.util.*,java.io.*"%>
<%@page language="java" contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<html>
    <head><title>更改庫存量</title></head>
    <body>
	<%
	String sql="use nocat";
    con.createStatement().execute(sql);
if(session.getAttribute("userName") != null ){
    sql = "SELECT * FROM member WHERE userName='" +session.getAttribute("userName")+"';"; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
	String userName="", password="",name="",sex="",birth="",mail="";
	while(paperrs1.next()){
	    userName=paperrs1.getString("userName");
		password=paperrs1.getString("password");
		name=paperrs1.getString("name");
		sex=paperrs1.getString("sex");
		birth=paperrs1.getString("birth");
		mail=paperrs1.getString("mail");
	}
	

	
	
	sql="SELECT * FROM  shoppingcar where name='"+userName+"' ORDER BY orNum ASC  ";
		
		ResultSet rs1=con.createStatement().executeQuery(sql);
		
	while(rs1.next()){
	
    String product=rs1.getString(3);
	
	int amount=rs1.getInt(5);	
	
    
	sql="SELECT * FROM  products where proName='"+product+"' ORDER BY no ASC  ";
	ResultSet rs2=con.createStatement().executeQuery(sql);
	rs2.next();
	int stoNum=rs2.getInt(10)-amount;
	
	sql="UPDATE products SET stoNum='"+stoNum+"' WHERE proName='"+product+"' ";
	con.createStatement().execute(sql);  
	}
				

			
		   
    con.close();
	response.sendRedirect("../index.jsp");
	
		   
	}else{
		response.sendRedirect("../registered_again.html");
	}
	
        
    %>
    </body>
</html>