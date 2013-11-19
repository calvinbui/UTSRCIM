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
	String subjectID = request.getParameter("subjectID");
	PreparedStatement stmt = con.prepareStatement("select * from subject where subjectID = '" + subjectID + "'");
	ResultSet rs = stmt.executeQuery();
	if(rs.next())
	{
		String message = "subjectIDExists";
		session.setAttribute("message", message);
		response.sendRedirect("createSubject.jsp");
		return;
	}
	else
	{
	stmt = con.prepareStatement("INSERT INTO subject (subjectID, name, activated, coordinatorID, facultyID) VALUES (?, ?, ?, ?, ?)");
	stmt.setString(1, request.getParameter("subjectID"));
	stmt.setString(2, request.getParameter("subjectName"));
	stmt.setString(3, request.getParameter("status"));
	stmt.setString(4, request.getParameter("subjectCoordinator"));
	stmt.setString(5, request.getParameter("faculty"));
	stmt.execute();
	con.close();
	response.sendRedirect("listSubjects.jsp");
	}
%>
</body>
</html>