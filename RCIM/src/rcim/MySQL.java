package rcim;

import java.sql.*;
import java.util.ArrayList;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MySQL {

	//public final static String dbUrl = "calvinbui.no-ip.biz:8080/rcim";
	private final static String dbUrl = "amun7.eng.uts.edu.au:5004/rcim";	
	private final static String dbUsername = "admin";
	private final static String dbPassword = "admin";	
	
	public static Connection connect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://" + dbUrl, dbUsername, dbPassword);
		}
		catch (Exception e)
		{
			throw new Error(e);
		}
	}
	
	public static boolean close(Connection c)
	{
		try
		{
			c.close();
			return true;
		}
		catch (Exception e)
		{
			throw new Error(e);
		}
	}
	
	//GATHER INFO RELATED TO Employee ID
	public static String getUserData(String queryType, int empId) throws SQLException
	{
		String query = "";
		switch (queryType)
		{
		case "name" : query = "select firstname from employee where empId = " + empId; break;
		case "type" : query = "select type from employee where empId = " + empId; break;
		case "activated" : query = "select activated from employee where empId = " + empId; break;
		}
		String data = "";
		Connection con = connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		if (rs.next())
		{
			data = rs.getString(1);
		}
		con.close();
		return data;
	}
	
	public static ArrayList<String> getData(String queryType, int id) throws SQLException
	{
		String query = "";
		switch (queryType)
		{
		case "employee" : query = "select * from employee where empId = " + id; break;
		case "residentialAddress" : query = "select * from address where addressType = 'Residential' AND empId = " + id; break;
		case "postalAddress" : query = "select * from address where addressType = 'Postal' AND empId = " + id; break;
		case "bank" : query = "select * from bank where empId = " + id; break;
		case "emergencycontact" : query = "select * from emergencycontact where empId = " + id; break;
		case "cas" : query = "select * from casualacademicstaff where empCASID = " + id; break;
		case "tempres" : query = "select * from tempres where empId = " + id; break;
		case "rate" : query = "select * from rate where rateLevel = " + id; break;
		case "subject" : query = "select * from subject where subjectId = " + id; break;
		case "contract" : query = "select * from contract where contractId = " + id; break;
		}
		ArrayList<String> dataList = new ArrayList<String>();
		Connection con = connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		if (rs.next())
		{
			for (int i = 0; i < rsmd.getColumnCount(); i++)
			{
				dataList.add(rs.getString(i + 1));
			}
		}
		con.close();
		return dataList;
	}
	
	public static ArrayList<ArrayList<String>> viewArrayArrayList(String queryType) throws SQLException
	{
		String query = "";
		switch (queryType)
		{
		case "rate" : query = "select * from rate"; break;
		case "faculty" : query = "select facultyID, name from faculty"; break;
		case "SC" : query = "select empId, firstname, lastname from employee where type = 'SC'"; break;
		case "subject" : query = "select subjectID, subject.name, subject.activated, employee.firstname from subject left join employee on subject.coordinatorID=employee.empid"; break;
		case "employee" : query = "select * from employee"; break;
		case "contract" : query = "select * from contract"; break;
		}
		Connection con = connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		ArrayList<ArrayList<String>> dataList = new ArrayList<ArrayList<String>>();
		while (rs.next())
		{
			ArrayList<String> data = new ArrayList<String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++)
			{
				data.add(rs.getString(i + 1));
			}
			dataList.add(data);
		}
		con.close();
		return dataList;
	}
	
	public static ArrayList<ArrayList<String>> getContracts(int id) throws SQLException
	{
		Connection con = connect();
		Statement st = con.createStatement();
		String query = "";
		ArrayList<ArrayList<String>> contracts = new ArrayList<ArrayList<String>>();
		if (getUserData("type", id).equals("CAS"))
		{
			query = "select contractId, contract.subjectId, subject.name, status from contract left join subject on contract.subjectId=subject.subjectId where empId = " + id;
		}
		else if (getUserData("type", id).equals("SC"))
		{
			query = "select contractId, contract.subjectId, subject.name, status, employee.firstname, employee.lastname from contract left join subject on contract.subjectId=subject.subjectId left join employee on contract.empId=employee.empId where status != 'Declined' AND contract.subjectId IN (select subjectId from subject where coordinatorId = " + id + ")";
		}
		ResultSet rs = st.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		while (rs.next())
		{
			ArrayList<String> contract = new ArrayList<String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++)
			{
				contract.add(rs.getString(i + 1));
			}
			contracts.add(contract);
		}
		con.close();
		return contracts;
	}
	
	public static String md5(String oldPassword) throws NoSuchAlgorithmException
	{
		//ENCRYPTION
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(oldPassword.getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest)
		{
			sb.append(Integer.toHexString((int) (b & 0xff)));
		}
		return sb.toString();
	}
}
