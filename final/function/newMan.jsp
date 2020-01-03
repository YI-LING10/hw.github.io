<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>

<html>
    <head><title>新增管理員</title></head>
    <body>
    <%
	request.setCharacterEncoding("UTF-8");
		String manName=request.getParameter("manName");
		String mname=request.getParameter("mname");
		String manPass=request.getParameter("manPass");
		
	try {
        	Class.forName("com.mysql.jdbc.Driver");	
        try 
		{
        	String url="jdbc:mysql://localhost:3306/nocat";
			String sql="";
            Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗");
			else
			{
				sql="USE nocat";
				con.createStatement().execute(sql);         
				
				sql="INSERT INTO manager(manName,mname,manpass) VALUES ('"+manName+"','"+mname+"','"+manPass+"')";
				con.createStatement().execute(sql);  

				

			}
		   
           con.close();
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException e) {
          out.println("class錯誤" + e.toString());
    }
		response.sendRedirect("../m_manager.jsp");
    %>
    </body>
</html>