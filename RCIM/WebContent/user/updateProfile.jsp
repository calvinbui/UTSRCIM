<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />



<% 
int empId = 0;
	if (session.getAttribute("empId") != null) {
		empId = (Integer) session.getAttribute("empId");
	} else {
		response.sendRedirect("../index.jsp");
	}
	
	if (request.getParameter("empIdProfile") != null && !request.getParameter("empIdProfile").equals(""))
	{
		empId = Integer.parseInt(request.getParameter("empIdProfile"));
	}
	
	if (session.getAttribute("existingEmail") != null)
	{
		empId = (Integer)session.getAttribute("existingEmail");
	}
	
ArrayList<String> employee = MySQL.getData("employee", empId);  
%>

<form action="updateProfileController.jsp" method="POST" onsubmit = "return validateForm(this);" class="form-horizontal" role="form" > 
<div class="form-group">
<h2>Update Profile</h2>	
	<h4>Basic Details</h4>
	<input type="text" name="empIdText" value="<%=empId%>" style="display:none"><br>
	<% if (session.getAttribute("existingEmail") != null) {
		out.print("<div class='alert alert-danger'>Email already exists in the system. Please try again.</div>");
				session.setAttribute("existingEmail", null);
	 } %>
<table class="table">
	<tr>
	<td>Title</td>
			<td>
	<select name="title" class="form-control">
		<option value="<%=employee.get(1)%>" selected><%=employee.get(1)%></option>
		<option value="Mr">Mr</option>
		<option value="Miss">Miss</option>
		<option value="Ms">Ms</option>
		<option value="Mrs">Mrs</option>
		<option value="Dr">Dr</option>
		<option value="Prof">Prof</option>
		<option value="Other">Other</option>
	</select>
	</td>
		</tr>
		<tr>
			<td>First Name</td>
			<td><input type="text" class="form-control" placeholder="First Name" name="firstName" value="<%=employee.get(3)%>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
				</tr>
		<tr>
			<td>Last Name</td>
	<td><input type="text" class="form-control" placeholder="Last Name" name="lastName" value="<%=employee.get(2)%>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
			</tr>
		<tr>
			<td>Middle Name</td>
	<td><input type="text" class="form-control" placeholder="Middle Name" name="middleName" value="<%=employee.get(4)%>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only"/></td>
	</tr>
		<tr>
			<td>Date of Birth</td>
			<td>
		<%
			String dob = employee.get(9);
		%>
		<input class="form-control" type="date" name="bday" value="<%=dob%>">
		</td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
		<input class="checkbox-inline" type="radio" name="gender" value="male" <%if (employee.get(10).equals("male")){%>checked<%}%>> Male 
		<input class="checkbox-inline" type="radio" name="gender" value="female" <%if (employee.get(10).equals("female")){%>checked<%}%>> Female<br> 
		</td>
		</tr>
		<tr>
			<td>Password</td>
		<td><input class="form-control" type="password" placeholder="Password" name="password" /></tr>
	</table>
	</div>
	<div class="form-group">	
	<h4>Contact Details</h4>
<table class="table">
	<tr>
			<td>Business Phone No.</td>
			<td>
			<input class="form-control" type="tel" placeholder="Business Phone No" name="businessPhone" value="<% if (employee.get(7) != null) {out.print(employee.get(7));}%>" pattern="\d{0,10}"/></td>
			</tr>
		<tr>
			<td>Email Address</td>
			<td> <input class="form-control"type="email" placeholder="Email Address" name="email" value="<%=employee.get(6)%>"/></td>
			</tr>
			<tr>
			<td>Home Phone No.</td>
			<td>
			<input class="form-control" type="tel" placeholder="Home Phone No" name="homePhone" value="<%=employee.get(8)%>" pattern="\d{0,10}"/></td>
			</tr>
			</table>
		
		<%
			if (MySQL.getUserData("type", empId).equals("CAS"))
			{
		%>

	<h4>Address Details</h4>
    <%ArrayList<String> residentialAddress = MySQL.getData("residentialAddress", empId); %>
	<h6>Residential Address</h6>
<table class="table">
<tr>
	<td>Street Address</td>
	<td><input class="form-control" type="text" placeholder="Street Address" name="streetResidential" value="<%=residentialAddress.get(2) %>"/> </td>
</tr>
<tr>
	<td>Suburb/City</td>
		<td><input class="form-control" type="text" placeholder="Suburb" name="suburbResidential" value="<%=residentialAddress.get(3) %>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only"/></td>
</tr>
<tr>
	<td>Post Code</td>	
	<td><input class="form-control" type="text" placeholder="Post Code" name="postCodeResidential" value="<%=residentialAddress.get(5) %>" pattern="[0-9]{4}"/></td>
</tr>		
<tr>
<td>State or Territory</td>		
		<td><select name="stateResidential" class="form-control">
			<option value="<%=residentialAddress.get(4) %>" selected><%=residentialAddress.get(4) %></option>
			<option value="NSW">NSW</option>
			<option value="ACT">ACT</option>
			<option value="VIC">VIC</option>
			<option value="QLD">QLD</option>
			<option value="SA">SA</option>
			<option value="NT">NT</option>
			<option value="WA">WA</option>
			<option value="TAS">TAS</option>
		</select></td>
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
</table>
<br>
<label for="postalCheckID"><em>Postal Address different from Residential Address?</em></label>
<input value="" type="checkbox" name="postalCheck" id="postalCheck" <%if (postalAddress.size() > 0){out.print("checked");} %>> 
</div>

<div class="form-group">	
<div id="postalAddress">
<p><em>Please fill in your postal address details</em></p>
	<table class="table">
	<tr>
		<td>Street Address</td>
		<td> <input disabled class="form-control postalRequired" type="text" placeholder="Street Address" name="streetPostal" value="<%=postalStreet %>"/> </td>
	</tr>
	<tr>
		<td>Suburb/City</td>
		<td> <input disabled class="form-control postalRequired" type="text" placeholder="Suburb" name="suburbPostal" value="<%=postalSuburb %>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only"/></td>
	</tr>
	<tr>
	<td>Post Code</td>
	<td> <input disabled class="form-control postalRequired" type="text" placeholder="Post Code" name="postCodePostal" value="<%=postalPostcode%>" pattern="[0-9]{4}"/></td>
	</tr>
	<tr>
	<td>State or Territory</td>
			<td>
				<select disabled name="statePostal" class="form-control postalRequired" >	
				<option value="<%=postalState %>" selected><%=postalState %></option>
				<option value="NSW">NSW</option>
				<option value="ACT">ACT</option>
				<option value="VIC">VIC</option>
				<option value="QLD">QLD</option>
				<option value="SA">SA</option>
				<option value="NT">NT</option>
				<option value="WA">WA</option>
				<option value="TAS">TAS</option>
			</select>
		</td>
	</tr>
</table>
</div>
</div>
<%ArrayList<String> cas = MySQL.getData("cas", empId);%>
<div class="form-group">	
<table class="table">
	<tr>
	<td><h4>Qualifications</h4></td>
	</tr>
	<tr>
	<td><textarea class="form-control" rows="4" cols="50" placeholder="Qualifications (up to 1000 characters)" maxlength="1000" name="qualification"><%=cas.get(4)%></textarea></td>
	</tr>
</table>	
	<% 
		String reason = cas.get(3);
	%>
</div>
<div class="form-group">	
	<h4>Employment Reasons</h4>	
	<div class="radio">
<table class="table">	
	<tr>
	<td><input type="radio" name="reasonforjob" value="Additional Income" id="income" <% if(reason.equals("Additional Income")){%>checked<%} %>></td>
	<td>Additional Income</td>
	</tr>
	<tr>
	<td><input type="radio" name="reasonforjob" value="Personal Reasons" id="personal" <% if(reason.equals("Personal Reasons")){%>checked<%} %>></td>
	<td>Personal Reasons (e.g. Flexibility, Community Contribution)</td>
	</tr>
	<tr>
	<td><input type="radio" name="reasonforjob" value="Gaining Academic Experience" id="experience" <% if(reason.equals("Gaining Academic Experience")){%>checked<%} %>></td>
	<td>Gaining Academic Experience for an academic career</td>
	</tr>
	<% 
	Boolean otherReason = false;
	if(!reason.equals("Gaining Academic Experience") && !reason.equals("Personal Reasons") && !reason.equals("Additional Income"))
	{
		otherReason = true;
	}
	%>
	<tr>
	<td><input type="radio" name="reasonforjob" value="Other" id="Other" <%if (otherReason == true){%>checked<%}%>>
	<td>Other <br> <input disabled class="form-control ifOther" type="text" name="otherReasonForJob" placeholder="Please Specify" value="<%if (otherReason == true){out.print(reason);}%>"/></td>
	</tr>
</table>
</div>
</div>
<div class="form-group">	
	<h4>Previously Employed by UTS</h4>
	<label for="employedUTS">Have you been previously employed by UTS? If yes, tick</label>
	<input type="checkbox" id="employedUTS" name="prevEmp" <%if (cas.get(6).equals("1")){%>checked<%}%>> <br>
	
	<% String right = cas.get(8);%>
	</div>
	<div class="form-group">	
	<h4>Right to Work</h4>
	<div class="radio">
<table class="table">
<tr>
	<td><input type="radio" name="righttowork" id="citizen" value="Citizen" <% if(right.equals("Citizen")){%>checked<%} %>>
	<td>Citizen(Aus/NZ)</td>
</tr>
<tr>
	<td><input type="radio" name="righttowork" id="perm" value="Permanent Resident" <% if(right.equals("Permanent Resident")){%>checked<%} %>>
	<td>Permanent Resident</td>
</tr>
<tr>	
	<td><input type="radio" name="righttowork" id="temp" value="Temporary Resident" <% if(right.equals("Temporary Resident")){%>checked<%} %>>
	<td>Temporary Resident</td>
	<% 
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
</tr>
</table>
</div>
</div>
<div class="tempRes"> 
<div class="form-group">	
<h5>Visa Details</h5>
<p><em>Please complete the related fields</em></p>
<table class="table">
<tr>
	<td>Visa Type</td>
	<td><input disabled class="form-control tempRes" type="text" placeholder="Visa Type" name="visa" value="<%=visaType%>"/> </td>
	</tr>
    <tr>
	<td>Passport No.</td>
	<td><input disabled class="form-control tempRes" type="text" placeholder="Passport No." name="passport" value="<%=passportNo%>" pattern="\d{0,20}"/> </td> 
	 </tr>
    <tr>
	<td>Country of Issue</td>
	<td><input disabled class="form-control tempRes" type="text" placeholder="Country of Issue" id="passportcountry" name="countryOfIssue" value="<%=countryIssue%>" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only"/> </td>
	</tr>
</table>
</div>
</div>
<%ArrayList<String> bank = MySQL.getData("bank", empId);%>
	<div class="form-group">
	<h4>Financial Details</h4>
<table class="table">
	<tr>
	<td>BSB</td>
	<td><input class="form-control" type="text" placeholder="BSB" pattern="\d{0,10}" name="bsb" value="<%=bank.get(0)%>"/> </td>
	</tr>
	<tr>
	<td>Account Number</td>
	<td><input class="form-control" type="text" placeholder="Account Number" pattern="\d{0,15}" name="accountNumber" value="<%=bank.get(1)%>"/></td>
	</tr>
	<tr>
	<td>Financial Institution</td>
	<td><input class="form-control" type="text" placeholder="Financial Institution" pattern="[-'a-zA-ZÀ-ÖØ-öø _,0-9]{0,45}" name="financialInstitution" value="<%=bank.get(2)%>"/></td>
	</tr>
	<tr>
	<td>Branch Name</td>
	<td><input class="form-control" type="text" placeholder="Branch Suburb" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" name="branchName" value="<%=bank.get(3)%>"/></td>
	</tr>
</table>
</div>
<%ArrayList<String> emergency = MySQL.getData("emergencycontact", empId);%>
	<div class="form-group">	
	<h4>Emergency Contact</h4>
<table class="table">
	<tr>
	<td>First Name</td>
	<td><input class="form-control" type="text" placeholder="First Name" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" name="emergfirstName" value="<%=emergency.get(3)%>"/> </td>
	</tr>
	<tr>
	<td>Last Name</td>
	<td><input class="form-control" type="text" placeholder="Last Name" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" name="emerglastName" value="<%=emergency.get(2)%>"/> </td>
	</tr>
	<tr>
	<td>Daytime Phone No.</td>
	<td><input class="form-control" type="text" placeholder="Daytime Phone No" pattern="\d{0,10}" name="telephoneDay" value="<%=emergency.get(4)%>"/></td>
	</tr>
	<tr>
	<td>Mobile Phone No.</td>
	<td><input class="form-control" type="text" placeholder="Mobile Phone No" pattern="\d{0,10}" name="telephoneMobile" value="<%=emergency.get(5)%>"/></td>
	</tr>
	<tr>
	<td>Relationship</td>
	<td><input class="form-control" type="text" placeholder="Relationship" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" name="relationship" value="<%=emergency.get(0)%>"/></td>
	</tr>
</table>
</div>
	<% } %>

	<div class="text-center"><input type="submit" data-toogle="tooltip" data-placement="right" title="Update profile" data-loading-text="Updating..." onclick="loading()" class="btn btn-success btn-lg" value="Update"></div>
	
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

<script src="${pageContext.servletContext.contextPath}/javascript/jquery-1.10.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/empType.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/reasonForJob.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/postAddress.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/righttowork.js"></script>
<jsp:include page="../includes/footer.jsp" />