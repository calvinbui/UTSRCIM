<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*, java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = MySQL.connect();
	String email = request.getParameter("email");
	PreparedStatement stmt = con.prepareStatement("select * from employee where emailaddress = '" + email + "'");
	ResultSet rs = stmt.executeQuery();
	if(rs.next())
	{
		String message = "emailExists";
		session.setAttribute("message", message);
		response.sendRedirect("register.jsp");
	}
	else
	{
		int empId;
		stmt = con.prepareStatement("INSERT INTO employee (title, lastname, firstname, middlename, emailaddress, homephone, dateofbirth, gender, password, type, activated, dateregistered) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, true, CURDATE())");
		stmt.setString(1, request.getParameter("title"));
		stmt.setString(2, request.getParameter("emplastName"));
		stmt.setString(3, request.getParameter("empfirstName"));
		stmt.setString(4, request.getParameter("middleName"));
		stmt.setString(5, email);
		stmt.setString(6, request.getParameter("homePhone"));
		stmt.setString(7, request.getParameter("bday"));
		stmt.setString(8, request.getParameter("gender"));
		stmt.setString(9, MySQL.md5(request.getParameter("password")));
		
		String empType = request.getParameter("empType");
			if (empType == null )
			{
				empType = "CAS";
			}
		stmt.setString(10, empType);
		stmt.executeUpdate();
		
		if (empType == null || empType.equals("CAS"))
		{
			stmt = con.prepareStatement("select LAST_INSERT_ID()");
			rs = stmt.executeQuery();
			rs.next();
			empId = Integer.parseInt(rs.getString(1));
			
			stmt = con.prepareStatement("insert into address (street, suburb, state, postcode, addressType, empID) values (?, ?, ?, ?, 'Residential', LAST_INSERT_ID())");
			stmt.setString(1, request.getParameter("streetResidential"));
			stmt.setString(2, request.getParameter("suburbResidential"));
			stmt.setString(3, request.getParameter("stateResidential"));
			stmt.setString(4, request.getParameter("postCodeResidential"));
			stmt.executeUpdate();
			
			if (request.getParameter("postalCheck") != null)
			{
				stmt = con.prepareStatement("insert into address (street, suburb, state, postcode, addressType, empID) values (?, ?, ?, ?, 'Postal', LAST_INSERT_ID())");
				stmt.setString(1, request.getParameter("streetPostal"));
				stmt.setString(2, request.getParameter("suburbPostal"));
				stmt.setString(3, request.getParameter("statePostal"));
				stmt.setString(4, request.getParameter("postCodePostal"));
				stmt.executeUpdate();
			}
			
			stmt = con.prepareStatement("INSERT INTO casualacademicstaff (reasonsforemployment, qualifications, previouslyemployed, righttowork, empCASID) VALUES (?, ?, ?, ?, LAST_INSERT_ID())");
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
				stmt = con.prepareStatement("INSERT INTO tempres (visatype, passportno, country, empID) VALUES (?, ?, ?, LAST_INSERT_ID())");
				stmt.setString(1, request.getParameter("visa"));
				stmt.setString(2, request.getParameter("passport"));
				stmt.setString(3, request.getParameter("countryOfIssue"));
				stmt.executeUpdate();
			}
			
			stmt = con.prepareStatement("INSERT INTO bank (bsb, accountno, financialinstitution, branchname, empID) VALUES (?, ?, ?, ?, LAST_INSERT_ID())");
			stmt.setString(1, request.getParameter("bsb"));
			stmt.setString(2, request.getParameter("accountNumber"));
			stmt.setString(3, request.getParameter("financialInstitution"));
			stmt.setString(4, request.getParameter("branchName"));
			stmt.executeUpdate();
			
			stmt = con.prepareStatement("INSERT INTO emergencycontact (surname, givenname, relationship, telephoneday, telephonemobile, empID) VALUES (?, ?, ?, ?, ?, LAST_INSERT_ID())");
			stmt.setString(1, request.getParameter("emerglastName"));
			stmt.setString(2, request.getParameter("emergfirstName"));
			stmt.setString(3, request.getParameter("relationship"));
			stmt.setString(4, request.getParameter("telephoneDay"));
			stmt.setString(5, request.getParameter("telephoneMobile"));
			stmt.executeUpdate();
			con.close();
			
			if (session.getAttribute("empId") != null)
			{
				response.sendRedirect("user/listUsers.jsp");
			}
			else
			{
				session.setAttribute("empId", empId);
				response.sendRedirect("upload/upload.jsp");
			}
		}
		else
		{
			con.close();
			response.sendRedirect("user/listUsers.jsp");
		}
	}
%>
</body>
</html>