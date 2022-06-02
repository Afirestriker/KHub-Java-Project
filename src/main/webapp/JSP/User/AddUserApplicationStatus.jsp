<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!--
	This page is used for Inserting/Adding data to Student_Application_Status table in khubv1 database
	
	This File represent the back-end process of inserting data into Student_Application_Status table
	
	Here, the value parameter is collected which is passed in URL, from ViewNewOpp.jsp page
	when user click on the button either 'Applied' or 'Not-Interested'
		
	NOTE: After the insertion of detail in khubv1.student_Application_Status table,
			Navigate to View Application page, with msg="DataInserted"

		 If any error from database or Exception occur			
		  Navigate back to ViewNewOpp.jsp page with msg that "databaseError or exceptionError"
 -->

<%
	try
	{
		/* Print message on console, indicating which page is visited */
		System.out.print("\n AddUserApplicationStatus.jsp page called \n");
		String username = session.getAttribute("username").toString();
		
		/* Get parameter from UserSettings.jsp URL, use for inserting data into khubv1.student_Application_Status table */
		String email = null;
		int OppId = Integer.parseInt(request.getParameter("oppId"));
		String applicationStatus = request.getParameter("applicationStatus");
		
		System.out.println("\n" + OppId + "\n" + applicationStatus + "\n");
		
		/*********************************************************************************** 
		 * Make DBMS connection,
		 * class DbConnection belongs to khubdb package 
		 * getConnection() is a static method of DbConnection which return connection object 
		 */
		Connection con = DbConnection.getConnection();
		
		/* Fetched current user email from login table*/
		String fetchEmail = "SELECT email FROM login WHERE username = ?";
		PreparedStatement pstFetchEmail = con.prepareStatement(fetchEmail);
		pstFetchEmail.setString(1, username);
		ResultSet rsFetchEmail = pstFetchEmail.executeQuery();
		while(rsFetchEmail.next())
		{
			email = rsFetchEmail.getString("email");
		}
		/* Email Fetching Done */
		
		
		/* Write MySql query to insert values in student_Application_Status table */
		String insertApplicationRecord = "INSERT INTO student_Application_Status VALUES (?, ?, ?)";

		/* Using PreparedStatement interface to update database table,
		 * since we are accepting value at run time
		*/
		PreparedStatement pstInsertData = con.prepareStatement(insertApplicationRecord);
		
		pstInsertData.setString(1, email);
		pstInsertData.setInt(2, OppId);
		pstInsertData.setString(3, applicationStatus);
		
		int updateStatus = pstInsertData.executeUpdate();
		
		if(updateStatus != 0)
		{
			response.sendRedirect("ViewAllApplications.jsp?msg=recordInserted&status=Applied");
		}
		
		if(updateStatus == 0)
		{
			response.sendRedirect("ViewNewOpp.jsp?msg=databaseError");
		}
		
		
	} /* Try block close */
	catch(Exception e)
	{
		/* In Case if run-time exception is thrown 
		 * Then, counter comes inside catch block and display error on console
		 * And, redirect to ViewNewOpp.jsp with messsage=exception
		 * Then, at ViewNewOpp.jsp there's an condition which check if msg=exception 
		   and accordingly message is display on that page
		*/
		System.out.println("\n ViewNewOpp.jsp Exception: " + e);
		response.sendRedirect("ViewNewOpp.jsp?msg=exception");
	}


%>
		