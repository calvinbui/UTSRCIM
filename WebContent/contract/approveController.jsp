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
	PreparedStatement stmt;
	if (request.getParameter("declineButton") != null)
	{
		stmt = con.prepareStatement("UPDATE contract SET status = 'Declined' where contractId = " + request.getParameter("contractId"));
		stmt.executeUpdate();
		session.setAttribute("message", "declined");
		response.sendRedirect("listContracts.jsp");
	}
	else if (request.getParameter("approveButton") != null)
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("approveContract.jsp");
		dispatcher.forward(request, response);
	}
	else
	{
		int empId = (Integer)session.getAttribute("empId");
		int contractId = Integer.parseInt(request.getParameter("contractId"));
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		String role = request.getParameter("role");
		
		stmt = con.prepareStatement("UPDATE contract SET enddate = ?, startdate = ?, hoursperweek = ?, type = ?, rateLevel = ?, status = 'Approved' where contractId = ?");
		stmt.setString(1, request.getParameter("endDate"));
		stmt.setString(2, request.getParameter("startDate"));
		stmt.setString(3, request.getParameter("hoursperweek"));
		stmt.setString(4, role);
		stmt.setString(5, request.getParameter("rateLevel"));
		stmt.setInt(6, contractId);
		stmt.executeUpdate();
		
		if (role.equals("Marker"))
		{
			stmt = con.prepareStatement("INSERT INTO contractperiodical (cPeriodicalID, paidweeks, dayofweek, starttime, endtime) VALUES (?, ?, ?, ?, ?)");
			stmt.setInt(1, contractId);
			stmt.setString(2, request.getParameter("paidweeks"));
			stmt.setString(3, request.getParameter("dayOfWork"));
			stmt.setString(4, request.getParameter("startTime"));
			stmt.setString(5, request.getParameter("endTime"));
			stmt.executeUpdate();
		}
		con.close();
		session.setAttribute("message", "approved");
		response.sendRedirect("listContracts.jsp");
	}
	con.close();
%>
</body>
</html>