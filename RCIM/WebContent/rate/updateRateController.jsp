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
	int rateId = Integer.parseInt(request.getParameter("level"));
	PreparedStatement stmt;
	Connection con = MySQL.connect();
	String message = "";
	if (request.getParameter("updateButton") != null)
	{
		stmt = con.prepareStatement("UPDATE rate SET type = ?, description = ?, price = ? WHERE rateLevel = " + rateId);
		stmt.setString(1, request.getParameter("type"));
		stmt.setString(2, request.getParameter("description"));
		stmt.setString(3, request.getParameter("price"));
		stmt.executeUpdate();
		message = "updated";
	}
	else if (request.getParameter("deleteButton") != null)
	{
		stmt = con.prepareStatement("DELETE FROM rate WHERE rateLevel = " + rateId);
		stmt.executeUpdate();
		message = "deleted";
	}
	con.close();
	session.setAttribute("message", message);
	response.sendRedirect("listRates.jsp");

%>
</body>
</html>