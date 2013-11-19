<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>All Subjects</h3>
<form action="updateSubject.jsp" method="post">
<%
	String message = (String) session.getAttribute("message");
	if (message != null && message == "updated")
	{
		%>
			<div class="alert alert-success"><p>Subject has been Updated!</p></div>
		<%
	}
	else if (message != null && message == "deleted")
	{
		%>
			<div class="alert alert-danger"><p>Subject has been Deleted!</p></div>
		<%
	}
	session.setAttribute("message", "");
	
	ArrayList<ArrayList<String>> subjects = MySQL.viewArrayArrayList("subject");
	if (subjects.size() > 0)
	{
%>
	<table class="table table-striped">
	  <tr>
	    <th></th>
	    <th>Subject No.</th>
	    <th>Subject Name</th>
	    <th>Status</th>
	    <th>Coordinator</th>
	  </tr>
	  <%
	  int rowNum = 0;
		  	for (ArrayList<String> subject: subjects)
		  	{
		  		String colour = "";
		  		if(subject.get(2).equals("0"))
		  		{
		  			colour = "danger";
		  		}
		  		rowNum++;
		  		%>
				  <tr class="<%=colour%>">
				    <td><input type="radio" name="subjectRadio" value="<%=subject.get(0)%>" <%if (rowNum == 1) {%> checked <%}%>></td>
				    <td><%=subject.get(0) %></td>
				    <td><%=subject.get(1) %></td>
				    <% 
				    	String status = "Activated";
				    	if(subject.get(2).equals("0"))
				    		status = "Deactivated";
				    %>
				    <td><%=status %></td>
				    <td><%=subject.get(3) %></td>
				  </tr>
				<%
		  	}
		  %>
	</table>
	<br><br>
		<div class="text-center"><button type="submit" data-toogle="tooltip" data-placement="right" title="Update the selected subject" class="btn btn-info btn-lg"><i class="fa fa-pencil"></i> Update Subject</button></div>
		
	<%
		}
		else
		{
			out.print("No Subjects currently exists.");
		}
	%>
</form>

<jsp:include page="../includes/footer.jsp" />