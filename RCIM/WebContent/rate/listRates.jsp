<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>All Rates</h3>
Please select a rate below to update:<br><br>
<form action="updateRate.jsp" method="post">
<%
	String message = (String) session.getAttribute("message");
	if (message != null && message == "updated")
	{
		%>
			<div class="alert alert-success"><p>Rates has been Updated!</p></div>
		<%
	}
	else if (message != null && message == "deleted")
	{
		%>
			<div class="alert alert-danger"><p>Rates has been Deleted!</p></div>
		<%
	}
	session.setAttribute("message", "");
	
	ArrayList<ArrayList<String>> rates = MySQL.viewArrayArrayList("rate");
	if (rates.size() > 0)
	{
	%>
	<table class="table table-striped">
	  <tr>
	  	<th></th>
	    <th>Level</th>
	    <th>Type</th>
	    <th>Details</th>
	    <th>Price</th>
	  </tr>
	  <%
	  	int rowNum = 0;
	  	for (ArrayList<String> rate: rates)
	  	{
	  		rowNum++;
	  		%>
	  			<tr>
	  				<td><input type="radio" name="rateRadio" value="<%=rate.get(0) %>" <%if (rowNum == 1) {%> checked <%}%>></td>
	  				<td><%=rate.get(0) %></td>
	  				<td><%=rate.get(1) %></td>
	  				<td><%=rate.get(2) %></td>
	  				<td>$<%=rate.get(3) %></td>
	  			</tr>
	  		<%
	  	}
	  %>
	</table>
	<br><br>
	<div class="text-center"><button type="submit" data-toogle="tooltip" data-placement="right" title="Update the selected rate" class="btn btn-info btn-lg"><i class="fa fa-pencil"></i> Update Rate</button></div>
<%
	}
	else
	{
		out.print("No Rates currently exists.");
	}
%>	
</form>
<jsp:include page="../includes/footer.jsp" />