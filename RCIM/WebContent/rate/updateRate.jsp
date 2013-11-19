<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>Update Rate</h3>

<form action="updateRateController.jsp" method="post">
<%
	int rateId = Integer.parseInt(request.getParameter("rateRadio"));
	ArrayList<String> rate = MySQL.getData("rate", rateId);
%>
<table class="table">
	<tr>
		<td>Rate Level</td>
		<td><input class="form-control" type="text" placeholder="Level" name="level" value="<%=rate.get(0) %>" readonly/></td>
	</tr>
	<tr>
		<td>Type</td>
		<td><input class="form-control" type="text" placeholder="Type" name="type" value="<%=rate.get(1) %>" pattern="[a-zA-Z0-9_. ,-]{0,45}" title="Letters only" required/></td>
	</tr>
	<tr>
		<td>Rate</td>
		<td><div class="input-group"><span class="input-group-addon">$</span>
		<input class="form-control" type="text" placeholder="100.00" name="price" value="<%=rate.get(3) %>" pattern="\d+(\.\d{2})?" required></div></td>
	</tr>
	<tr>
		<td>Description</td>
		<td><textarea class="form-control" placeholder="Description" name="description" maxlength="1000" rows="5" cols="50" required><%=rate.get(2) %></textarea></td>
	</tr>
</table>
	<br>
<div class="text-center">
	<button type="submit" name="updateButton" data-toogle="tooltip" data-placement="left" title="Update and return to the previous page" class="btn btn-success btn-lg update" data-loading-text='<i class="fa fa-spinner"></i> Updating...' onclick="update();"><i class="fa fa-floppy-o"></i> Update</button>
	<button type="submit" name="deleteButton" data-toogle="tooltip" data-placement="right" title="Delete this rate" class="btn btn-danger btn-lg deleting" data-loading-text='<i class="fa fa-spinner"></i> Deleting...' onclick="deleting();return confirm('Are you sure you want to delete this rate?')"><i class="fa fa-trash-o"></i> Delete</button>
</div>
</form>
<script>
function update()
{
	$('.update').button('loading');
	setTimeout(function () 
	{
		$('.update').button('reset');
    }, 3000);
}
</script>
<script>
function deleting()
{
	$('.deleting').button('loading');
	setTimeout(function () 
	{
		$('.deleting').button('reset');
    }, 3000);
}
</script>


<jsp:include page="../includes/footer.jsp" />