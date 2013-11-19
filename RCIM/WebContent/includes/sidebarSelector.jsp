<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<%
	int empId = 0;
	if (session.getAttribute("empId") != null) {
		empId = (Integer) session.getAttribute("empId");
	} else {
		response.sendRedirect("../index.jsp");
	}
	String userType = MySQL.getUserData("type", empId);
	if (userType == null)
	{
	}
	else if (userType.equals("CAS")) {
%>
<jsp:include page="../includes/CASSidebar.jsp" />
<%
	} else if (userType.equals("SC")) {
%>
<jsp:include page="../includes/SCSidebar.jsp" />
<%
	} else if (userType.equals("SA")) {
%>
<jsp:include page="../includes/SASidebar.jsp" />
<%
	}
%>