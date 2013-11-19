<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<form action="updateUserController.jsp" onsubmit = "return validateForm(this);" method="post">
		<%	
			//store the user we want to edit
			int empId = Integer.parseInt(request.getParameter("empIDRadio"));
			String activated = MySQL.getUserData("activated", empId);
		%>		

<table class="table">
<tr>
<td>Employee ID<td>
<td><input class="form-control" name="empIdProfile" value="<%=empId%>" readonly></td>
</tr>

<tr>
<td>Status<td>
<td><select name="status" class="form-control">
			<option value="1" <%if (activated.equals("1")){out.print("selected");} %>>Activated</option>
			<option value="0" <%if (activated.equals("0")){out.print("selected");} %>>Deactivated</option>
		</select></td>
</tr>

<tr>
<td>New Password<td>
<td><input class="form-control" type="password" placeholder="New Password" name="newPassword" /></td>
</tr>
</table>
<div class="text-center">
		<button type="submit" name="updateButton" data-toogle="tooltip" data-placement="left" title="Update and return to the previous page" class="btn btn-success btn-lg update" data-loading-text='<i class="fa fa-spinner"></i> Updating...' onclick="update()"><i class="fa fa-floppy-o"></i> Update</button>
		<button type="submit" name="deleteButton" data-toogle="tooltip" data-placement="bottom" title="Delete the user from the system" class="btn btn-danger btn-lg deleting" data-loading-text='<i class="fa fa-spinner"></i> Deleting...' onclick="deleting(); return confirm('Are you sure you want to delete this user?')"><i class="fa fa-trash-o"></i> Delete User</button>
		<button type="submit" name="modifyButton" data-toogle="tooltip" data-placement="right" title="Redirects to 'Update Profile'" class="btn btn-primary btn-lg modify" data-loading-text='<i class="fa fa-spinner"></i> Redirecting...' onclick="modify()"><i class="fa fa-wrench"></i> Modify Profile</button>
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
<script>
function modify()
{
	$('.modify').button('loading');
	setTimeout(function () 
	{
		$('.modify').button('reset');
    }, 3000);
}
</script>

<jsp:include page="../includes/footer.jsp" />