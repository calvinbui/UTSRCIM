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
	String message = "";
	Connection con = MySQL.connect();
	int subjectId = Integer.parseInt(request.getParameter("subjectIDOriginal"));
	PreparedStatement stmt = con.prepareStatement("select * from subject where subjectID = " + request.getParameter("subjectID"));
	ResultSet rs = stmt.executeQuery();
	if(rs.next() && Integer.parseInt(request.getParameter("subjectID")) != subjectId)
	{
		message = "subjectIDExists";
		session.setAttribute("message", message);
		request.setAttribute("updateSubjectId", subjectId);
		request.getRequestDispatcher("updateSubject.jsp").forward(request, response);
		return;
	}
	
	if (request.getParameter("updateButton") != null)
	{
		stmt = con.prepareStatement("UPDATE subject SET subjectID = ?, name = ?, activated = ?, coordinatorID = ?, facultyID = ? WHERE subjectID = " + subjectId);
		stmt.setString(1, request.getParameter("subjectID"));
		stmt.setString(2, request.getParameter("subjectName"));
		stmt.setString(3, request.getParameter("status"));
		stmt.setString(4, request.getParameter("subjectCoordinator"));
		stmt.setString(5, request.getParameter("faculty"));
		stmt.executeUpdate();
		message = "updated";
	}
	else if (request.getParameter("deleteButton") != null)
	{
		stmt = con.prepareStatement("DELETE FROM subject WHERE subjectId = " + subjectId);
		stmt.executeUpdate();
		message = "deleted";
	}
	con.close();
	session.setAttribute("message", message);
	response.sendRedirect("listSubjects.jsp");

%>
</body>
</html>