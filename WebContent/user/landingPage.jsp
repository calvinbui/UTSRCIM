<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<div class="jumbotron">
  <h1>Hello, <%=MySQL.getUserData("name", (Integer) session.getAttribute("empId"))%>!</h1>
  <p>Welcome to the RCIM system.</p>
</div>

<jsp:include page="../includes/footer.jsp" />