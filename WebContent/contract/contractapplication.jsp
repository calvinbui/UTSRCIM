<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>Apply for a Subject Contract</h3>

<form action="applicationController.jsp" method="post">
	<select class="form-control" name="subject" id="subject">
		<%
			ArrayList<ArrayList<String>> subjects = MySQL.viewArrayArrayList("subject");
			for (ArrayList<String> subject: subjects)
			{
				if (subject.get(2).equals("1"))
				{
			%>
				<option value="<%=subject.get(0)%>"><%=subject.get(1)%></option>
			<%
				}
			}
		%>
	</select>
	<br><br>
	<div class="text-center"><button type="submit" onclick="update()" data-toogle="tooltip" data-placement="right" title="Apply for the selected subject" data-loading-text='<i class="fa fa-spinner"></i> Applying...' value="Apply" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Apply</button></div>
</form>
<script>
function update()
{
	$('.btn').button('loading');
	setTimeout(function () 
	{
		$('.btn').button('reset');
    }, 3000);
}
</script>

<jsp:include page="../includes/footer.jsp" />