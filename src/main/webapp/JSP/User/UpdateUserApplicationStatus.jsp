<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This page is used for Updating student_Application_status khubv1 database table 
	This page is called from ViewAllApplications.jsp page 
		whenever user click on button either 'Withdraw Application' or 'undo Not-Interested'
-->

<%!
	int oppId = 0;
%>

<%
	try
	{
		
		/* Print message on console, indicating which page is visited */
		System.out.print("\n UpdateUserApplicationStatus.jsp page called \n");
		String username = session.getAttribute("username").toString();

		/* get the parameter passed OppID value */
		oppId = Integer.parseInt(request.getParameter("oppId"));
		
		/* System.out.println("\n" + username + "\n" + oppId + "\n"); */
		
		/*********************************************************************************** 
			 * Make DBMS connection,
			 * class DbConnection belongs to khubdb package 
			 * getConnection() is a static method of DbConnection which return connection object 
			 */
			Connection con = DbConnection.getConnection();
		
		String removeDetailFromApplicationStatus = "DELETE FROM Student_Application_Status WHERE OppId = ? AND StuEmail = (SELECT email FROM login WHERE username = ?) ";
		PreparedStatement pstRemoveDetailFromApplicationStatus = con.prepareStatement(removeDetailFromApplicationStatus);
		pstRemoveDetailFromApplicationStatus.setInt(1, oppId);
		pstRemoveDetailFromApplicationStatus.setString(2, username);
		
		int del = pstRemoveDetailFromApplicationStatus.executeUpdate();
		
		if(del != 0)
		{
			response.sendRedirect("ViewAllApplications.jsp?msg=recordUpdated&status=Applied");
		}
		
		if(del == 0)
		{
			response.sendRedirect("ViewAllApplications.jsp?msg=databaseError&status=Applied");
		}
		
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n UpdateUserApplicationStatus.jsp Exception: " + e);
		response.sendRedirect("ViewAllApplications.jsp?msg=exception");
	} /* catch block close */

%>
