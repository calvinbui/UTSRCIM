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
PreparedStatement stmt = con.prepareStatement("select empId from employee where emailaddress = ? AND password = ? AND activated = true");
stmt.setString(1, request.getParameter("email"));
stmt.setString(2, MySQL.md5(request.getParameter("password")));
ResultSet rs = stmt.executeQuery();
if (rs.next())
{
	session.setAttribute("empId", rs.getInt(1));
	response.sendRedirect("user/landingPage.jsp");
}
else
{
	session.setAttribute("message", "failLogin");
	response.sendRedirect("index.jsp");
}
%>
</body>
</html>