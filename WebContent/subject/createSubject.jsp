<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<%
	String message = (String) session.getAttribute("message");
	if (message != null && message == "subjectIDExists")
	{
		%>
			<div class="alert alert-danger">Subject Number already exist!</div>
		<%
	}
	session.setAttribute("message", "");
%>

<h3>Create Subject</h3>

<form name="createSubject" action="createSubjectController.jsp" onsubmit = "return validateForm(this);" method="POST">
<table class="table">
		<tr>
			<td>Subject ID</td>
			<td><input type="text" class="form-control" placeholder="Subject No." name="subjectID" required pattern="\d{0,10}" title="Numbers only"/></td>
		</tr>
		<tr>
			<td>Subject Name</td>
			<td><input type="text" class="form-control" placeholder="Subject Name" name="subjectName" required pattern="[-'a-zA-ZÀ-ÖØ-öø _,0-9]{0,45}" title="Letters only"/></td>
		</tr>
		<tr>
			<td>Status</td>
			<td>
				<select name="status" class="form-control">
					<option value="1">Activated</option>
					<option value="0">Deactivated</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Subject Coordinator</td>
			<td>
				<select name="subjectCoordinator" class="form-control">
				<%
					ArrayList<ArrayList<String>> coordinators = MySQL.viewArrayArrayList("SC");
					for (ArrayList<String> SC: coordinators)
					{
						%>
						<option value="<%=SC.get(0)%>"><%=SC.get(1) + " " + SC.get(2)%></option>
						<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Faculty</td>
			<td>
				<select name="faculty" class="form-control">
				<%
					ArrayList<ArrayList<String>> faculties = MySQL.viewArrayArrayList("faculty");
					for (ArrayList<String> faculty: faculties)
					{
						%>
						<option value="<%=faculty.get(0)%>"><%=faculty.get(1)%></option>
						<%
					}
				%>
				</select>
			</td>
		</tr>
	</table>
	<div class="text-center">
	<button type="submit" data-toogle="tooltip" data-placement="right" title="Create the subject" data-loading-text='<i class="fa fa-spinner"></i> Creating...' onclick="loading()" class="btn btn-success btn-lg">
	<i class="fa fa-check"></i> Create</button>
	</div>

</form>

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