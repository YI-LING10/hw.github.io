<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%  
if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
    //sql = "SELECT * FROM members WHERE id='" +request.getParameter("id") + 
	//      "'  AND pwd='" + request.getParameter("pwd") + "'"  ; 
    sql = "SELECT * FROM members WHERE id=? AND pwd=?";
	//' OR 1=1; #
	//out.println(sql);
	//out.close();//程式結束
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("id"));
    pstmt.setString(2,request.getParameter("pwd"));
	
	ResultSet paperrs = pstmt.executeQuery();
	//ResultSet paperrs =con.createStatement().executeQuery(sql);
    
    if(paperrs.next()){            
        out.print("密碼帳號正確");
    }
    else
        out.print("密碼帳號不符 !!");
}
%>