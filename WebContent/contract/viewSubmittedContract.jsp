<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h4>Submitted Contracts Forms</h4>
<%
	ArrayList<String> contract = MySQL.getData("contract" , Integer.parseInt(request.getParameter("contractRadio")));
	int empId = Integer.parseInt(contract.get(2));
	int subjectId = Integer.parseInt(contract.get(1));
	ArrayList<String> employee = MySQL.getData("employee", empId); 
%>
<form action="approveController.jsp" method="post">
	<table class="table table-striped">
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Personal</h3></th>
	  </tr>
	  <tr>
	    <td>Employee ID</td>
	    <td><%=employee.get(0)%></td>
	  </tr>
	  <tr>
	    <td>Title</td>
	    <td><%=employee.get(1)%></td>
	  </tr>
	  <tr>
	    <td>First Name</td>
	    <td><%=employee.get(3)%></td>
	  </tr>
	  <tr>
	    <td>Last Name</td>
	    <td><%=employee.get(2)%></td>
	 </tr>
	  <tr>
	    <td>Middle Name</td>
	    <td><%=employee.get(4)%></td>
	  </tr>
	  <tr>
	    <td>Email</td>
	    <td><%=employee.get(6)%></td>
	  </tr>
	  <tr>
	    <td>Business Phone</td>
	    <td><%=employee.get(7)%></td>
	  </tr>
	  <tr>
	    <td>Home Phone</td>
	    <td><%=employee.get(8)%></td>
	  </tr>
	  <tr>
	    <td>DOB</td>
	    <td><%=employee.get(9)%></td>
	  </tr>
	  <tr>
	    <td>Gender</td>
	    <td><%=employee.get(10)%></td>
	  </tr>
	  <tr>
	  	<th colspan="2" class="warning"><h3 class="text-center">Residential Address</h3></th>
	  </tr>
	  <%ArrayList<String> residentialAddress = MySQL.getData("residentialAddress", empId); %>
	  <tr>
	    <td>Street Address</td>
	    <td><%=residentialAddress.get(2)%></td>
	  </tr>
	  <tr>
	    <td>Suburb</td>
	    <td><%=residentialAddress.get(3) %></td>
	  </tr>
	  <tr>
	    <td>State</td>
	    <td><%=residentialAddress.get(4)%></td>
	  </tr>
	  <tr>
	    <td>Postcode</td>
	    <td><%=residentialAddress.get(5)%></td>
	  </tr>
	<%
			String postalStreet = "";
			String postalState = "";
			String postalSuburb = "";
			String postalPostcode = "";
			
			ArrayList<String> postalAddress = MySQL.getData("postalAddress", empId);
			if (postalAddress.size() > 0)
			{
				postalStreet = postalAddress.get(2);
				postalState = postalAddress.get(4);
				postalSuburb = postalAddress.get(3);
				postalPostcode = postalAddress.get(5);
			}
		%>
	  <tr>
	    <th colspan="2" rowspan="2" class="warning"><h3 class="text-center">Postal Address</h3></th>
	  </tr>
	  <tr></tr>
	  <tr>
	  	<td colspan="2"><p class="text-center">If different from the employee's Residential Address</em></strong></p></td>
	  </tr>
	  <tr>
	    <td>Street Address</td>
	    <td><%=postalStreet%></td>
	  </tr>
	  <tr>
	    <td>City</td>
	    <td><%=postalSuburb%></td>
	  </tr>
	  <tr>
	    <td>State</td>
	    <td><%=postalState%></td>
	  </tr>
	  <tr>
	    <td>Postcode</td>
	    <td><%=postalPostcode%></td>
	  </tr>
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Financial</h3></th>
	  </tr>
	  <%ArrayList<String> bank = MySQL.getData("bank", empId);%>
	  <tr>
	    <td>BSB</td>
	    <td><%=bank.get(0)%></td>
	  </tr>
	  <tr>
	    <td>Account No.</td>
	    <td><%=bank.get(1)%></td>
	  </tr>
	  <tr>
	    <td>Financial Institution</td>
	    <td><%=bank.get(2)%></td>
	  </tr>
	  <tr>
	    <td>Branch Suburb</td>
	    <td><%=bank.get(3)%></td>
	  </tr>
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Right to Work</h3></th>
	  </tr>
	  <%ArrayList<String> cas = MySQL.getData("cas", empId);%>
	  <tr>
	    <td>Status</td>
	    <td><%=cas.get(8)%></td>
	  </tr>
<% 
		String right = cas.get(8);
		ArrayList<String> tempres = MySQL.getData("tempres", empId);
		String visaType = "";
		String passportNo = "";
		String countryIssue = "";
	
		if(right.equals("Temporary Resident"))
		{
			if (tempres.get(0) != null)
			{
				visaType = tempres.get(0);
			}
			if (tempres.get(1) != null)
			{
				passportNo = tempres.get(1);
			}
			if (tempres.get(2) != null)
			{
				countryIssue = tempres.get(2);
			}
		}
	%>
	  <tr>
	    <td>Visa</td>
	    <td><%=visaType%></td>
	  </tr>
	  <tr>
	    <td>Passport No.</td>
	    <td><%=passportNo%></td>
	  </tr>
	  <tr>
	    <td>Country of Issue</td>
	    <td><%=countryIssue%></td>
	  </tr>
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Reason for Casual Appointment</h3></th>
	  </tr>
	  <tr>
	    <td>Reason</td>
	    <td><%=cas.get(3)%></td>
	  </tr>
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Qualifications</h3></th>
	  </tr>
	  <tr>
	    <td>Qualifications</td>
	    <td><%=cas.get(4)%></td>
	  </tr>
	  <tr>
	    <td>Resume</td>
	    <td>
	    <%
	    	if (cas.get(5) != null)
	    	{
	    %>
	    <a href="../resumes/<%=cas.get(5)%>"><%=cas.get(5) %></a> 
	    <%} %>
	    </td>
	  </tr>
	
	<%ArrayList<String> subject = MySQL.getData("subject", subjectId);%> 
	  <tr>
	    <th colspan="2" class="warning"><h3 class="text-center">Contract</h3></th>
	  </tr>
	  <tr>
	    <td>Subject Number</td>
	    <td><%=subject.get(0) %><input type="text" name="subjectId" value="<%=subject.get(0) %>" style="display:none"></td>
	  </tr>
	  <tr>
	    <td>Subject Name</td>
	    <td><%=subject.get(1) %><input type="text" name="subjectName" value="<%=subject.get(1) %>" style="display:none"></td>
	  </tr>
	  <tr>
	    <td>Contract ID</td>
	    <td><%=request.getParameter("contractRadio")%><input type="text" name="contractId" value="<%=request.getParameter("contractRadio")%>" style="display:none"></td>
	  </tr>
	  <tr>
	    <td>Contract Status</td>
	    <td><%=contract.get(3) %></td>
	  </tr>
	</table>
	<input type="text" name="contractStatus" value="<%=contract.get(3) %>" style="display:none">
	<%
	if (MySQL.getUserData("type", (Integer)session.getAttribute("empId")).equals("SC") && contract.get(3).equals("Submitted"))
	  {
	%>
	 <div class="text-center">
	 <button type="submit" data-toogle="tooltip" data-placement="left" title="Decline the contract form" value="Decline" name="declineButton" data-loading-text='<i class="fa fa-spinner"></i> Declining...' class="btn btn-danger btn-lg decline" onclick="decline();return confirm('Are you sure you want to delete this decline this contract?')">
	 <i class="fa fa-times"></i> Decline</button>
	 <button type="submit" data-toogle="tooltip" data-placement="right" title="Progress the contract form" value="Progress" name="approveButton" onclick="progress()" data-loading-text='<i class="fa fa-spinner"></i> Progressing' class="btn btn-info btn-lg progressing">
	 <i class="fa fa-arrow-right"></i> Progress</button></div>
	 <%
	 } 
%>
</form>
<script>
function decline()
{
	$('.decline').button('loading');
	setTimeout(function () 
	{
		$('.decline').button('reset');
    }, 3000);
}
</script>
<script>
function progress()
{
	$('.progressing').button('loading');
	setTimeout(function () 
	{
		$('.progressing').button('reset');
    }, 3000);
}
</script>

<jsp:include page="../includes/footer.jsp" />