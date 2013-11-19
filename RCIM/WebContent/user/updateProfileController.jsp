<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int empId = Integer.parseInt(request.getParameter("empIdText"));
	String password;
	if (request.getParameter("password").equals(""))
	{
		password = MySQL.getData("employee", empId).get(13);
	}
	else
	{
		password = MySQL.md5(request.getParameter("password"));
	}
	
	String businessPhone = null;
	if (!request.getParameter("businessPhone").equals("") && request.getParameter("businessPhone") != null)
	{
		businessPhone = request.getParameter("businessPhone");
	}
	
	Connection con = MySQL.connect();
	PreparedStatement stmt = con.prepareStatement("select * from employee where emailaddress = '" + request.getParameter("email") + "' and empId != " + empId);
	ResultSet rs = stmt.executeQuery();
	if (rs.next() )//check exists
	{
		session.setAttribute("existingEmail", empId);
		response.sendRedirect("updateProfile.jsp");
		return;
	}
	
	stmt = con.prepareStatement("UPDATE employee SET title = ?, lastname = ?, firstname = ?, middlename = ?, emailaddress = ?, businessphone = ?, homephone = ?, dateofbirth = ?, gender = ?, password = ? WHERE empID = " + empId);
	stmt.setString(1, request.getParameter("title"));
	stmt.setString(2, request.getParameter("lastName"));
	stmt.setString(3, request.getParameter("firstName"));
	stmt.setString(4, request.getParameter("middleName"));
	stmt.setString(5, request.getParameter("email"));
	stmt.setString(6, businessPhone);
	stmt.setString(7, request.getParameter("homePhone"));
	stmt.setString(8, request.getParameter("bday"));
	stmt.setString(9, request.getParameter("gender"));
	stmt.setString(10, password);
	stmt.executeUpdate();
	
	if (MySQL.getUserData("type", empId).equals("CAS"))
	{
		stmt = con.prepareStatement("UPDATE address SET street = ?, suburb = ?, state = ?, postcode = ? WHERE addressType = 'Residential' AND empID = " + empId);
		stmt.setString(1, request.getParameter("streetResidential"));
		stmt.setString(2, request.getParameter("suburbResidential"));
		stmt.setString(3, request.getParameter("stateResidential"));
		stmt.setString(4, request.getParameter("postCodeResidential"));
		stmt.executeUpdate();
		
		if (request.getParameter("postalCheck") != null)
		{
			stmt = con.prepareStatement("select * from address where addressType = 'Postal' AND empId = " + empId);
			rs = stmt.executeQuery();
			if (rs.next() )//check exists
			{
				//Update
				stmt = con.prepareStatement("UPDATE address SET street = ?, suburb = ?, state = ?, postcode = ? WHERE addressType = 'Postal' AND empID = " + empId);
			}
			else
			{
				//Insert
				stmt = con.prepareStatement("insert into address (street, suburb, state, postcode, addressType, empID) values (?, ?, ?, ?, 'Postal', " + empId + ")");
			}
			stmt.setString(1, request.getParameter("streetPostal"));
			stmt.setString(2, request.getParameter("suburbPostal"));
			stmt.setString(3, request.getParameter("statePostal"));
			stmt.setString(4, request.getParameter("postCodePostal"));
			stmt.executeUpdate();
		}
		else
		{
			stmt = con.prepareStatement("DELETE FROM address WHERE addressType = 'Postal' and empId = " + empId);
			stmt.executeUpdate();
		}
		
		stmt = con.prepareStatement("UPDATE casualacademicstaff SET reasonsforemployment = ?, qualifications = ?, previouslyemployed = ?, righttowork = ? WHERE empCASID = " + empId);
		if (request.getParameter("reasonforjob").equals("Other"))
		{
			stmt.setString(1, request.getParameter("otherReasonForJob"));
		}
		else
		{
			stmt.setString(1, request.getParameter("reasonforjob"));
		}
		stmt.setString(2, request.getParameter("qualification"));
		if (request.getParameter("prevEmp") != null)
		{
			stmt.setBoolean(3, true);
		}
		else
		{
			stmt.setBoolean(3, false);
		}
		stmt.setString(4, request.getParameter("righttowork"));
		stmt.executeUpdate();
		
		if (request.getParameter("righttowork").equals("Temporary Resident"))
		{
			stmt = con.prepareStatement("SELECT * FROM tempres where empId = " + empId);
			rs = stmt.executeQuery();
			if (rs.next())
			{
				stmt = con.prepareStatement("UPDATE tempres SET visatype = ?, passportno = ?, country = ? WHERE empID = " + empId);
			}
			else
			{
				stmt = con.prepareStatement("INSERT INTO tempres (visatype, passportno, country, empID) VALUES (?, ?, ?, " + empId + ")");
			}
			stmt.setString(1, request.getParameter("visa"));
			stmt.setString(2, request.getParameter("passport"));
			stmt.setString(3, request.getParameter("countryOfIssue"));
			stmt.executeUpdate();
		}
		else
		{
			stmt = con.prepareStatement("DELETE FROM tempres WHERE empId = " + empId);
			stmt.executeUpdate();
		}
		
		stmt = con.prepareStatement("UPDATE bank SET bsb = ?, accountno = ?, financialinstitution = ?, branchname = ? WHERE empId = " + empId);
		stmt.setString(1, request.getParameter("bsb"));
		stmt.setString(2, request.getParameter("accountNumber"));
		stmt.setString(3, request.getParameter("financialInstitution"));
		stmt.setString(4, request.getParameter("branchName"));
		stmt.executeUpdate();
		
		stmt = con.prepareStatement("UPDATE emergencycontact SET surname = ?, givenname = ?, relationship = ?, telephoneday = ?, telephonemobile = ? WHERE empID = " + empId);
		stmt.setString(1, request.getParameter("emerglastName"));
		stmt.setString(2, request.getParameter("emergfirstName"));
		stmt.setString(3, request.getParameter("relationship"));
		stmt.setString(4, request.getParameter("telephoneDay"));
		stmt.setString(5, request.getParameter("telephoneMobile"));
		stmt.executeUpdate();
	}
	con.close();
	
	String empType = MySQL.getUserData("type", (Integer)session.getAttribute("empId"));
	if (empId == (Integer)session.getAttribute("empId"))
	{
		response.sendRedirect("landingPage.jsp");
	}
	else if(empType.equals("SA") && empId != (Integer)session.getAttribute("empId"))
  	{
		response.sendRedirect("../user/listUsers.jsp");
  	}
%>
</body>
</html>