<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>

<html>
    <head><title>新增會員</title></head>
    <body>
    <%
	request.setCharacterEncoding("UTF-8");
		
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String sex=request.getParameter("customRadioInline1");
		String birth=request.getParameter("birth");
		String mail=request.getParameter("mail");
		
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
				
				sql="INSERT INTO member(userName,password,name,sex,birth,mail) VALUES ('"+userName+"','"+password+"','"+name+"','"+sex+"','"+birth+"','"+mail+"')";
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
		response.sendRedirect("../registered_again.html");
    %>
    </body>
</html>