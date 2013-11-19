<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = MySQL.connect();
	PreparedStatement stmt = con.prepareStatement("INSERT INTO rate (type, price, description) VALUES (?, ?, ?)");
	stmt.setString(1, request.getParameter("rateType"));
	stmt.setString(2, request.getParameter("ratePrice"));
	stmt.setString(3, request.getParameter("description"));
	stmt.executeUpdate();
	
	con.close();
	
	response.sendRedirect("listRates.jsp");
%>
</body>
</html>