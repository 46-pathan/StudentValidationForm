<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Form</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	
	conn=(Connection)session.getAttribute("conn");
	if(conn!=null){
		PreparedStatement ps=conn.prepareStatement("delete from students where id=?");
		
		ps.setInt(1, id);
		int rows=ps.executeUpdate();
		out.println(rows>0?"Success deletion":"failed deletion");
	}
%>
</body>
</html>