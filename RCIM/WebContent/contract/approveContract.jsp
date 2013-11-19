<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<form action="approveController.jsp" method="POST">
<h3>Contract Information</h3>

<h4>Subject Information</h4>
<table class="table">
<tr>
<td>Subject No.</td> 
	<td><input class="form-control" type="text" name="subjectId" size="5" value="<%=request.getParameter("subjectId") %>" readonly/></td>
</tr>
<tr>
<td>Subject Name</td>
	<td><input class="form-control" type="text" name="subjectName" value="<%=request.getParameter("subjectName") %>" readonly/></td>
</tr>
<tr>
<td>Contract ID</td>
	<td><input class="form-control" type="text" name="contractId" value="<%=request.getParameter("contractId") %>" readonly/></td>
</tr>
</table>

<h4>Work Period</h4>
<table class="table">
<tr>
<td>Start Date 
	<td><input class="form-control" type="date" name="startDate" required/></td>
</tr>
<tr>
<td>End Date
	<td><input class="form-control" type="date" name="endDate" required/></td>
</tr>
</table>

<h4>Payment Details</h4>
<table class="table">
<tr>
<td>Role</td>
	<td><select id="role" name="role" class="form-control">
			<option value="Lecturer">Lecturer</option>
			<option value="Tutor">Tutor</option>
			<option value="Marker">Marker</option>
	</select></td>
</tr>
<tr>
<td>Rate</td>
	<td><select name="rateLevel" class="form-control">
	<% 
		ArrayList<ArrayList<String>> rates = MySQL.viewArrayArrayList("rate"); 
		for (ArrayList<String> rate : rates){
	%>
			<option value="<%=rate.get(0)%>"><%=rate.get(1) + " $" + rate.get(3) %></option>
	<%} %>
	</select></td>
	</tr>
<tr>
<td>No. Paid Hours per Week</td>
<td><input class="form-control" type="text" placeholder="No." name="hoursperweek" size=1 pattern="\d{0,10}" title="Numbers only" required/> </td>
</table>

<h4>Marker Additional Details</h4>
<table class="table">
<tr>
<td>No. of Paid Weeks</td>
<td><input class="form-control marker" disabled type="text" placeholder="No." name="paidweeks" size=1 pattern="\d{0,10}" title="Numbers only"/> </td>

<tr>
<td>Day of Week</td>
	<td>
	<select name="dayOfWork" disabled class="form-control marker">
			<option value="Monday">Monday</option>
			<option value="Tuesday">Tuesday</option>
			<option value="Wednesday">Wednesday</option>
			<option value="Thursday">Thursday</option>
			<option value="Friday">Friday</option>
			<option value="Saturday">Saturday</option>
			<option value="Sunday">Sunday</option>
	</select>
	</td>
</tr>
<tr>
	<td>Start Time</td>
	<td><input class="form-control marker" disabled type="time" name="startTime"/></td>
</tr>	
<tr>
<td>End Time</td>
	<td><input class="form-control marker" disabled type="time" name="endTime"/></td>
</tr>	
</table>

	<div class="text-center"><button type="submit" data-toogle="tooltip" data-placement="bottom" title="Approve the contract" class="btn btn-success btn-lg" data-loading-text='<i class="fa fa-spinner"></i> Approving...' onclick="loading()" onSubmit="return confirm('Are you sure you want to approve this contract?')" value="Approve">
	<i class="fa fa-check"></i> Approve</button></div>
</form>

<script src="/RCIM/javascript/jquery-1.10.2.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/javascript/approveContract.js"></script>

<script>
function loading()
{
	$('.btn').button('loading');
	setTimeout(function () 
	{
		$('.btn').button('reset');
    }, 3000);
}
</script>

<jsp:include page="../includes/footer.jsp" />