<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />
<h3>All Contracts</h3>
Please select a contract below to update:<br><br>
<form action="viewSubmittedContract.jsp" method="post">
<%
	String message = (String) session.getAttribute("message");
	if (message != null && message == "approved")
	{
		%>
			<div class="alert alert-success"><p>The contract has been approved!</p></div>
		<%
	}
	else if (message != null && message == "declined")
	{
		%>
			<div class="alert alert-danger"><p>The contract has been declined!</p></div>
		<%
	}
	else if (message != null && message == "duplicateContract")
	{
		%>
			<div class="alert alert-warning"><p>This contract already exists.</p></div>
		<%
	}
	session.setAttribute("message", "");
	
	ArrayList<ArrayList<String>> contracts = MySQL.getContracts((Integer)session.getAttribute("empId"));
	if (contracts.size() > 0)
	{
%>
	<table class="table table-striped">
	  <tr>
	  	<th></th>
	    <th>Subject No.</th>
	    <th>Subject Name</th>
	    <th>Status</th>
	    <%
  		if (MySQL.getUserData("type", (Integer)session.getAttribute("empId")).equals("SC"))
  		{ %>
	    <th>Candidate</th>
	    <%} %>
	  </tr>
	  <%
	  	int rowNum = 0;
	  	for (ArrayList<String> contract: contracts)
	  	{
	  		String colour = "";
	  		rowNum++;
	  		if (contract.get(3).equals("Declined"))
	  		{
	  			colour = "danger";
	  		}
	  		else if (contract.get(3).equals("Approved"))
	  		{
	  			colour = "success";
	  		}
	  		%>
	  			<tr class="<%=colour%>">
	  				<td><input type="radio" name="contractRadio" value="<%=contract.get(0) %>" <%if (rowNum == 1) {%> checked <%}%>></td>
	  				<td><%=contract.get(1) %></td>
	  				<td><%=contract.get(2) %></td>
	  				<td><%=contract.get(3) %></td>
	  				<%
	  					if (MySQL.getUserData("type", (Integer)session.getAttribute("empId")).equals("SC"))
	  					{
	  						String name = contract.get(4) + " " + contract.get(5);
	  				%>
	  				<td><%=name	%></td>
	  				<%} %>
	  			</tr>
	  		<%
	  	}
	  %>
	</table>
	<br><br>
	<div class="text-center"><button type="submit" value="View Contract" data-toogle="tooltip" data-placement="right" title="View the selected contract" class="btn btn-info btn-lg"><i class="fa fa-search"></i> View Contract</button></div>
	<%
	}
	else
	{
		out.print("No Contracts currently exists.");
	}
%>
</form>

<jsp:include page="../includes/footer.jsp" />