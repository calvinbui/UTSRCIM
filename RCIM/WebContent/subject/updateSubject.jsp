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



<h3>Update Subject</h3>

<form action="updateSubjectController.jsp" method="post">
<%
	int subjectId;
	if (request.getParameter("subjectRadio") != null)
	{
		subjectId = Integer.parseInt(request.getParameter("subjectRadio"));
	}
	else
	{
		subjectId = (Integer)request.getAttribute("updateSubjectId");
	}
	ArrayList<String> subject = MySQL.getData("subject", subjectId);
%>
	<input type="text" placeholder="Subject No." name="subjectIDOriginal" value="<%=subject.get(0)%>" readonly style="display:none"/> <br>

	<table class="table">
		<tr>
			<td>Subject ID</td>
			<td><input class="form-control" type="text" placeholder="Subject No." name="subjectID" value="<%=subject.get(0)%>" required pattern="\d{0,10}" title="Numbers only"/></td>
		</tr>
		<tr>
			<td>Subject Name</td>
			<td>	<input class="form-control" type="text" placeholder="Subject Name" name="subjectName" value="<%=subject.get(1)%>" required pattern="[-'a-zA-ZÀ-ÖØ-öø _,0-9]{0,45}" title="Letters only"/></td>
		</tr>
		<tr>
			<td>Status</td>
			<td>
					<select name="status" class="form-control">
			<option value="1" <% if(subject.get(2).equals("1")){%>selected<%}%>>Activated</option>
			<option value="0" <% if(subject.get(2).equals("0")){%>selected<%}%>>Deactivated</option>
	</select>
			</td>
		</tr>
		<tr>
			<td>Subject Coordinator</td>
			<td>
					<select name="subjectCoordinator" class="form-control">
		<option disabled selected>Subject Coordinator</option>
				<%
					ArrayList<ArrayList<String>> coordinators = MySQL.viewArrayArrayList("SC");
					for (ArrayList<String> SC: coordinators)
					{
						%>
						<option value="<%=SC.get(0)%>" <%if(subject.get(3).equals(SC.get(0))){%>selected<%}%>>
							<%=SC.get(1) + " " + SC.get(2)%>
						</option>
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
		<option disabled selected>Faculty</option>
				<%
					ArrayList<ArrayList<String>> faculties = MySQL.viewArrayArrayList("faculty");
					for (ArrayList<String> faculty: faculties)
					{
						%>
						<option value="<%=faculty.get(0)%>" <%if(subject.get(4).equals(faculty.get(0))){%>selected<%}%>>
							<%=faculty.get(1)%>
						</option>
						<%
					}
				%>
	</select>
			</td>
		</tr>
	</table>
	
	
	
	
	
	<div class="text-center">
	<button type="submit" name="updateButton" data-toogle="tooltip" data-placement="left" title="Update and return to the previous page" class="btn btn-success btn-lg update" data-loading-text='<i class="fa fa-spinner"></i> Updating...' onclick="update();"><i class="fa fa-floppy-o"></i> Update</button>
	<button type="submit" name="deleteButton" data-toogle="tooltip" data-placement="right" title="Delete this subject" class="btn btn-danger btn-lg deleting" data-loading-text='<i class="fa fa-spinner"></i> Deleting...' onclick="deleting();return confirm('Are you sure you want to delete this subject?')"><i class="fa fa-trash-o"></i> Delete</button>
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