<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>All Users</h3>
Please select a user below to update:<br><br>
<form action="updateUser.jsp" method="post">
<%
	if (session.getAttribute("userDeleted") != null)
	{
		Boolean isDeleted = (Boolean) session.getAttribute("userDeleted");
		if (isDeleted == true)
		{
			out.print("<div class='alert alert-danger'>User has been deleted!</div>");
		}
		session.setAttribute("userDeleted", false);
	}

	ArrayList<ArrayList<String>> employees = MySQL.viewArrayArrayList("employee");
	if (employees.size() > 1)
	{
%>
	<table class="table table-striped">
	  <tr>
	    <th></th>
	    <th>Title</th>
	    <th>Last Name</th>
	    <th>First Name</th>
	    <th>Type</th>
	    <th>Email Address</th>
	    <th>Home Phone</th>
	    <th>Date Registered</th>
	  </tr>
	  <%
	  	int rowNum = 0;
		  	for (ArrayList<String> employee: employees)
		  	{
		  		String colour = "";
		  		if (employee.get(12).equals("0"))
		  		{
		  			colour = "danger";
		  		}
		  		rowNum++;
		  		%>
	  <tr class="<%=colour%>">
	    <td><input type="radio" name="empIDRadio" value="<%=employee.get(0) %>" <%if (rowNum == 1) {%> checked <%}%>></td>
	    <td><%=employee.get(1) %></td>
	    <td><%=employee.get(2) %></td>
	    <td><%=employee.get(3) %></td>
	    <td><%=employee.get(5) %></td>
	    <td><%=employee.get(6) %></td>
	    <td><%=employee.get(8) %></td>
	    <td><%=employee.get(11) %></td>
	  </tr>
	  <%
		  	}
		  %>
	</table>
	<br><br>
	<div class="text-center"><button type="submit" data-toogle="tooltip" data-placement="right" title="Update the selected user" class="btn btn-info btn-lg"><i class="fa fa-pencil"></i> Update User</button></div>
<%
	}
	else
	{
		out.print("No other User currently exists.");
	}
%>
</form>

<jsp:include page="../includes/footer.jsp" />