<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp"%>
<%@ page import="java.sql.Statement, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Form</title>
</head>
<body>
<%
	
	conn=(Connection)session.getAttribute("conn");
	if(conn!=null){
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from students");
		out.println("<table border='1'><tr><th>Id</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Mobile</th><th>Gender</th><th>Password</th>");
		while(rs.next()){
			out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("fname")+"</td><td>"+rs.getString("lname")+"</td><td>"+rs.getString("email")+"</td><td>"+rs.getString("mobile")+"</td><td>"+rs.getString("gender")+"</td><td>"+rs.getString("password")+"</td></tr>");
		}
		out.println("</table");
	}
%>
</body>
</html>