<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Request and Contract Information Management (RCIM) System</title>

<link href="${pageContext.servletContext.contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.css" rel="stylesheet">

<link href="${pageContext.servletContext.contextPath}/css/bootstrap-glyphicons.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/signin.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/sticky-footer-navbar.css" rel="stylesheet">
<script src="${pageContext.servletContext.contextPath}/javascript/jquery-1.10.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/bootstrap.min.js"></script>

<script>
$(function () { 
	$('.btn').tooltip(); 
});</script>
</head>

<body>
<%
	Boolean isAdmin = false;
	if (session.getAttribute("empId") != null)
	{
		int empId = (Integer)session.getAttribute("empId");
		if(MySQL.getUserData("type", empId).equals("SA"))
		{
			isAdmin = true;
			%>
				<jsp:include page="includes/SASidebar.jsp"/>
			<%
		}
	}
	else
	{ 
		%>
		<div id="wrap">
		<div class="container">
		<%
	}
		
%>
<%
	String message = (String) session.getAttribute("message");
	if (message != null && message == "emailExists")
	{
		%>
			<div class="alert alert-danger">Email is already registered!</div>
		<%
	}
	session.setAttribute("message", "");
%>
<form name="registerForm" action="registerController.jsp" method="POST">
<h3>Account Creation</h3>
<%
	if(isAdmin)
	{ %>
	<table class="table">
	<tr><td>Choose an Account to Create:</td>
	<td>
		<input type="radio" name="empType" value="CAS" id="CAS" checked>Casual Academic Staff<br>
		<input type="radio" name="empType" value="SC" id="SC">Subject Coordinator<br>
		<input type="radio" name="empType" value="SA" id="SA">System Administrator
	</td></tr>
	</table>
	<% } %>
<h4>Basic Details</h4>
<table class="table">
	<tr>
		<td>Title</td>
		<td>
			<select name="title" class="form-control" required>
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
		<td><input class="form-control" id="firstName" type="text" placeholder="First Name" name="empfirstName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input class="form-control" id="lastName" type="text" placeholder="Last Name" name="emplastName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
	</tr>
	<tr>
		<td>Middle Name</td>
		<td><input class="form-control" id="middleName" type="text" placeholder="Middle Name" name="middleName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" /></td>
	</tr>
	<tr>
		<td>Date of Birth</td>
		<td>
			<input class="form-control" type="date" name="bday" required/> 
		</td>
	</tr>
	<tr>
		<td>Gender</td>
		<td>
			
			<div class="radio">
			  <label>
			    <input type="radio" name="gender" id="male" value="male" checked>
			    Male
			  </label>
			</div>
			<div class="radio">
			  <label>
			    <input type="radio" name="gender" id="female" value="female">
			    Female
			  </label>
			</div>
		</td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input class="form-control" id="password" type="password" placeholder="Password" name="password" required/></td>
	</tr>
</table>

<div class="form-group">
<h4>Contact Details</h4>
<table class="table">
	<tr>
		<td>Business Phone No.</td>
		<td><input class="form-control" type="tel" placeholder="Business Phone No" name="businessPhone" pattern="\d{0,10}" title="Numbers only (up to 10 digits)" /></td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td><input class="form-control" type="email" placeholder="Email Address" name="email" required/></td>
	</tr>
	<tr>
		<td>Home Phone No.</td>
		<td><input class="form-control" type="text" placeholder="Home Phone No" name="homePhone" pattern="\d{0,10}" title="Numbers only (up to 10 digits)" required/></td>
	</tr>
</table>
</div>

<div class="ifCas" style="display: block">
<div class="form-group">
<h4>Address Details</h4>
<h5>Residential Address</h5>
<table class="table">
		<tr>
		<td>Street Address</td>
		<td><input class="form-control resiPostal" type="text"placeholder="Street Address" name="streetResidential" required/></td>
		</tr>	
		<tr>
		<td>Suburb/City</td>
		<td>
		<input class="form-control resiPostal" type="text" placeholder="Suburb/City" name="suburbResidential" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
		</tr>		
		<tr>
		<td>State or Territory</td>
		<td><select name="stateResidential" class="form-control resiPostal" required>
			<option value="NSW">NSW</option>
			<option value="ACT">ACT</option>
			<option value="VIC">VIC</option>
			<option value="QLD">QLD</option>
			<option value="SA">SA</option>
			<option value="NT">NT</option>
			<option value="WA">WA</option>
			<option value="TAS">TAS</option>
		</select></td>
		</tr>	
			<tr>
		<td>Post Code</td>
		<td>
		<input type="text" placeholder="Post Code" name="postCodeResidential" class="form-control resiPostal" pattern="[0-9]{4}" title="Numbers only (4 digits)" required/></td>
		</tr>	
	</table>
	<br>
	<label for="postalCheck"><em>Postal Address different from Residential Address? If yes, tick</em></label>
	<input value="" type="checkbox" name="postalCheck" id="postalCheck"> 
</div>

<div class="form-group">
<div id="postalAddress">
<p><em>Please fill in your postal address details</em></p>
	<table class="table">
		<tr>
		<td>Street Address</td>
		<td><input class="form-control postalRequired" disabled type="text" placeholder="Street Address" name="streetPostal" id="streetPostal"/> </td>
		</tr>
		<tr>
		<td>Suburb/City</td>
		<td><input class="form-control postalRequired" disabled type="text" placeholder="Suburb" name="suburbPostal" id="suburbPostal" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only"/> </td>
		</tr>
		<tr>
		<td>State or Territory</td>
		<td><select disabled name="statePostal"class="form-control postalRequired" >
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
		<tr>
		<td>Post Code</td>
		<td><input class="form-control postalRequired" disabled type="text" placeholder="Post Code" name="postCodePostal" id="postCodePostal" pattern="[0-9]{4}" title="Numbers only (4 digits)"/></td>
		</tr>
	</table>
</div> 
</div>
<div class="form-group">
<table class="table">
		<tr>
		<td><h4>Qualifications</h4></td>
		</tr>
		<tr>
				<td><textarea class="form-control" rows="4" cols="50" placeholder="Qualifications (up to 1000 characters)" name="qualification" maxlength="1000"></textarea></td>
		</tr>
</table>
</div>

<div class="form-group">		
<h4>Employment Reasons</h4>
<div class="radio">
<table class="table">
<tr>
	<td><input class="reasonforjob" type="radio" name="reasonforjob" value="Additional Income" id="income" required></td>
	<td>Additional Income</td>
</tr>
<tr>
	<td><input class="reasonforjob" type="radio" name="reasonforjob" value="Personal Reasons" id="personal"></td>
	<td>Personal Reasons (e.g. Flexibility, Community Contribution)</td>
</tr>
<tr>
	<td><input class="reasonforjob" type="radio" name="reasonforjob" value="Gaining Academic Experience" id="experience"></td>
	<td>Gaining Academic Experience for an academic career</td>
</tr>
<tr>
	<td><input class="reasonforjob" type="radio" name="reasonforjob" value="Other" id="Other"></td>
	<td>Other</td>
</tr>
<tr>
<td></td>
<td>
    <input id="" name="otherReasonForJob" type="text" placeholder="Please Specify" class="form-control ifOther" disabled></td>
</tr>
</table>
</div>
</div>



<div class="form-group">
<h4>Previously Employed by UTS</h4>
<label for="employedUTS">Have you been previously employed by UTS? If yes, tick</label>
<input id="employedUTS" type="checkbox" name="prevEmp">
</div>

<div class="form-group">
<h4>Right to Work</h4>
<div class="radio">
<table class="table">
<tr>
	<td><input class="righttowork" type="radio" name="righttowork" id="citizen" value="Citizen" required></td>
	<td>Citizen (Aus/NZ)</td>
</tr>
<tr>
	<td><input class="righttowork" type="radio" name="righttowork" id="perm" value="Permanent Resident"></td>
	<td>Permanent Resident</td>
</tr>
<tr>
	<td><input class="righttowork" type="radio" name="righttowork" id="temp" value="Temporary Resident"></td>
	<td>Temporary Resident</td>
</tr>
</table>

<h5>Visa Details</h5>
<p><em>Please complete the related fields</em></p>
<table class="table">
    <tr>
    	<td>Visa Type</td>
    	<td><input class="form-control tempRes" type="text" placeholder="Visa Type" name="visa" title="Letters only" disabled/></td>
    </tr>
    <tr>
    	<td>Passport No.</td>
    	<td><input class="form-control tempRes" type="text" placeholder="Passport No." name="passport" pattern="\d{0,10}" title="Numbers only" disabled/></td>
    </tr>
    <tr>
    	<td>Country of Issue</td>
    	<td><input class="form-control tempRes" type="text" placeholder="Country of Issue" id="passportcountry" name="countryOfIssue" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" disabled/></td>
    </tr>
</table>
</div>
</div>

<div class="form-group">
		<h4>Financial Details</h4>
		<table class="table">
		<tr>
		<td>BSB</td>
		<td><input class="form-control finDets" type="text" placeholder="BSB" name="bsb" pattern="\d{0,10}" title="Numbers only (up to 10 digits)" required/> </td>
		</tr>
		<tr>
		<td>Account Number</td>
		<td><input class="form-control finDets" type="text" placeholder="Account Number"  name="accountNumber" pattern="\d{0,15}" title="Numbers only (up to 15 digits)" required/></td>
		</tr>
		<tr>
		<td>Financial Institution</td>
		<td><input class="form-control finDets" type="text" placeholder="Financial Institution" name="financialInstitution" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
		</tr>
		<tr>
		<td>Branch Suburb</td>
		<td><input class="form-control finDets" type="text" placeholder="Branch Suburb" name="branchName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
		</tr>
		</table>
</div>

<div class="form-group">
		<h4>Emergency Contact</h4>
		<table class="table">
		<tr>
		<td>First Name</td>
		<td>
		<input class="form-control emergContact" type="text" placeholder="First Name" name="emergfirstName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
		</tr>
		<tr>
		<td>Last Name</td>
		<td>
		<input class="form-control emergContact" type="text" placeholder="Last Name" name="emerglastName" pattern="[-'a-zA-ZÀ-ÖØ-öø _,0-9]{0,45}" required/>
		</td>
		</tr>
		<tr>
		<td>Daytime Telephone</td>
		<td><input class="form-control emergContact" type="text" placeholder="Daytime Phone No" name="telephoneDay" pattern="\d{0,10}" title="Numbers only (up to 10 digits)" required/></td>
		</tr>
		<tr>
		<td>Mobile Telephone</td>
		<td>
		<input class="form-control emergContact" type="text" placeholder="Mobile Phone No" name="telephoneMobile" pattern="\d{0,10}" title="Numbers only (up to 10 digits)" required/></td>
		</tr>
		<tr>
		<td>Relationship</td>
		<td>
		<input class="form-control emergContact" type="text" placeholder="Relationship" name="relationship" pattern="[-'a-zA-ZÀ-ÖØ-öø _,]{0,45}" title="Letters only" required/></td>
		</tr>
		</table>
</div>	
</div>
<% if(isAdmin) 
		{ %><div class="text-center">
		<button type="submit" data-toogle="tooltip" data-placement="right" title="Create the user" data-loading-text='<i class="fa fa-spinner"></i> Creating...' onclick="loading()" class="btn btn-success btn-lg">
		<i class="fa fa-check"></i> Create</button>
		</div><% } 
		else 
		{ %><div class="text-center">
		<button type="submit" data-toogle="tooltip" data-placement="right" title="Welcome to the RCIM System!" data-loading-text='<i class="fa fa-spinner"></i> Registering...' onclick="loading()" class="btn btn-success btn-lg">
		<i class="fa fa-check"></i> Register</button>
		</div><% } %>
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

</div><!-- wrap -->
</div><!-- /.container -->
<br><br>
	<div id="footer">
      <div class="container">
        	<p class="text-muted credit text-center">Copyright © 2013 Trungthi Bui, Raphael Eskander, Chanelle Ramos, Paolo Grella and Stefan Caliaro</p>
        </div>
    </div>
<script src="${pageContext.servletContext.contextPath}/javascript/jquery-1.10.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/logOut.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/empType.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/reasonForJob.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/postAddress.js"></script>
<script src="${pageContext.servletContext.contextPath}/javascript/righttowork.js"></script>
</body>
</html>