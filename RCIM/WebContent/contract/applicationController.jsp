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
	int empId = (Integer)session.getAttribute("empId");
	int subjectId = Integer.parseInt(request.getParameter("subject"));
	Connection con = MySQL.connect();
	PreparedStatement stmt = con.prepareStatement("select * from subject where activated = 1 AND subjectId = " + subjectId);
	ResultSet rs = stmt.executeQuery();
	if (rs.next())
	{
		stmt = con.prepareStatement("select * from contract where empId = " + empId + " AND subjectId = " + subjectId);
		rs = stmt.executeQuery();
		if (!rs.next())
		{
			stmt = con.prepareStatement("INSERT INTO contract (empId, subjectId, status) VALUES (?, ?, 'Submitted')");
			stmt.setInt(1, empId);
			stmt.setInt(2, subjectId);
			stmt.executeUpdate();
		}
		else
		{
			session.setAttribute("message", "duplicateContract");
		}
	}
	con.close();
	response.sendRedirect("listContracts.jsp");
%>
</body>
</html>