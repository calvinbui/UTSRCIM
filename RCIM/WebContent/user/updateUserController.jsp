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
	int empId = Integer.parseInt(request.getParameter("empIdProfile"));
	Connection con = MySQL.connect();
	PreparedStatement stmt;
	if (request.getParameter("updateButton") != null)
	{
		if (request.getParameter("newPassword").equals(""))
		{
			stmt = con.prepareStatement("UPDATE employee SET activated = ? WHERE empID = " + empId);
		}
		else
		{
			stmt = con.prepareStatement("UPDATE employee SET activated = ?, password = ? WHERE empID = " + empId);
			stmt.setString(2, MySQL.md5(request.getParameter("newPassword")));
		}
		stmt.setString(1, request.getParameter("status"));
		stmt.executeUpdate();
		response.sendRedirect("listUsers.jsp");
	}
	else if (request.getParameter("deleteButton") != null)
	{
		stmt = con.prepareStatement("DELETE FROM employee WHERE empID = " + empId);
		stmt.executeUpdate();
		session.setAttribute("userDeleted", true);
		response.sendRedirect("listUsers.jsp");
	}
	else if (request.getParameter("modifyButton") != null)
	{	
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateProfile.jsp");
		dispatcher.forward(request, response);
	}
	con.close();
%>
</body>
</html>