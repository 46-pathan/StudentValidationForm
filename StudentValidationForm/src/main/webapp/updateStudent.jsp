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
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile");
	String gender=request.getParameter("gender");
	String password=request.getParameter("password");
	
	conn=(Connection)session.getAttribute("conn");
	if(conn!=null){
		PreparedStatement ps=conn.prepareStatement("update students set fname=?,lname=?,email=?,mobile=?,gender=?,password=? where id=?");
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, email);
		ps.setString(4, mobile);
		ps.setString(5, gender);
		ps.setString(6, password);
		ps.setInt(7, id);
		int rows=ps.executeUpdate();
		out.println(rows>0?"Success update":"failed update");
	}
%>
</body>
</html>