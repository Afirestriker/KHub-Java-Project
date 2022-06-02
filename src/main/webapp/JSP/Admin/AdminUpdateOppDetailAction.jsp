<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp" %>

<!-- importing calculation package for getting the current date -->
<%@ page import="calculation.*" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This file is called from AdminUpdateAndViewJobApplicationRecord.jsp page,
		on update Opportunity FORM submit
	
	This File represent the back-end process of updating Job_Opportunity table record 
		called from AdnminUpdateAndViewJobApplicationRecord.jsp page
	
	The Basic objective of this page is to update job_opportunity detail into database
	
	Here, 
	The value parameters are collected from AdminUpdateAndViewJobApplicationRecord.jsp page on Update Opportunity form submit
	and this values are updated into the KHubv1.job_opportunity table
	
	NOTE:
	OppId column in database table is set for auto_increment so no need to update that, it is used in where clause
	Also, OppDate i.e published date is already set while data was first added, so no need to change this as well
		
	NOTE: After the updation of detail in KHubv1.job_opportunity table,
		  Navigate to AdmminUpdateAndViewJobApplicationRecord.jsp page, with msg="recordUpdated"
 -->

<%!

	String oppId = null;
	String jobRole = null;

	String courseEligibles[] = null;
	String courseEligible= null;
	
	String companyName = null;
	
	String[] jobLocations = null;
	String jobLocation = null;
	
	String jobType = null;
	String maxPackage = null;
	String jobDescription = null;
	String oppLink = null;
	
	String oppEndDate = null;
	
	String opportunityStatus = null;
	

%>


 <%
 
	 try{
		 
	 	/* Print on console, indicating the navigation of pages */
		System.out.print("\n AdminUpdateOppDetailAction.jsp called \n");
		
		/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
		   credentials are matched.
		   Its also helps, in preventing unauthorised access to admin pages
		*/
		String admin = session.getAttribute("admin").toString();
	
		/* Get all form parameter from AdminUpdateAndViewJobApplicationRecord.jsp to store in KHubv1.job_opportunity table */
		
		oppId = request.getParameter("oppId");
			System.out.print(" OppId: " + oppId + "\n");

		oppEndDate = request.getParameter("oppEndDate");
		
		jobRole = request.getParameter("jobRole");
		
		courseEligibles = request.getParameterValues("courseEligible");
		courseEligible= "";
		for(int i=0; i<courseEligibles.length; i++)
		{
			courseEligible = courseEligible + courseEligibles[i] + ", ";
		}
		
		companyName = request.getParameter("companyName");
		
		jobLocations = request.getParameterValues("jobLocation");
		jobLocation = "";
		for(int i=0; i<jobLocations.length; i++)
		{
			jobLocation =  jobLocation + jobLocations[i] + ", ";
		}
		
		jobType = request.getParameter("jobType");
		maxPackage = request.getParameter("maxPackage");
		jobDescription = request.getParameter("jobDescription");
		oppLink = request.getParameter("oppLink");
		
		opportunityStatus = request.getParameter("opportunityStatus");
		
		/* 
		System.out.print("\n" + oppId + "\n" + oppEndDate );
		System.out.print("\n" + jobRole + "\n" + courseEligible + "\n" + companyName);
		System.out.print("\n" + jobLocation + "\n" + jobType + "\n" + maxPackage + "\n" + jobDescription);
		System.out.print("\n" + oppLink + "\n" + opportunityStatus + "\n");
		 */
		
		/*********************************************************************************** 
		 * Make DBMS connection,
		 * class DbConnection belongs to khubdb package 
		 * getConnection() is a static method of DbConnection which return connection object 
		 */
		Connection con = DbConnection.getConnection();

		
		String updateOppDetail = "UPDATE Job_Opportunity "
								+ "SET OppEndDate = ?, JobRole = ?, CourseEligible = ?, CompanyName = ?, "
								+ "    JobLocation = ?, JobType = ?, MaxPackage = ?, JobDescription = ?, "
								+ "    OppLink = ?, OppStatus = ? "
								
								+ " WHERE OppId = ?";

		PreparedStatement pstUpdateOppDetail = con.prepareStatement(updateOppDetail);
		pstUpdateOppDetail.setString(1, oppEndDate);
		pstUpdateOppDetail.setString(2, jobRole);
		pstUpdateOppDetail.setString(3, courseEligible);
		pstUpdateOppDetail.setString(4, companyName);
		pstUpdateOppDetail.setString(5, jobLocation);
		pstUpdateOppDetail.setString(6, jobType);
		pstUpdateOppDetail.setString(7, maxPackage);
		pstUpdateOppDetail.setString(8, jobDescription);
		pstUpdateOppDetail.setString(9, oppLink);
		pstUpdateOppDetail.setString(10, opportunityStatus);
		
		pstUpdateOppDetail.setString(11, oppId);
		
		int updateStatus = pstUpdateOppDetail.executeUpdate();
		
		if(updateStatus != 0)
		{
			/* One database is successfully updated	
			 * Navigate to AdminUpdateAndViewJobApplicationRecord.jsp page with msg="recordUpdated & oppId=""
			 */
			
			response.sendRedirect("AdminUpdateAndViewJobApplicationRecord.jsp?msg=recordUpdated&oppId="+oppId);
		}
		else
		{
			 /* if Data updation failed 
			  * Navigate back to AdminUpdateAndViewJobApplicationDetail.jsp page with msg="databaseError" & oppId=""
			  */
			response.sendRedirect("AdminUpdateAndViewApplicationRecord.jsp?msg=databaseError&oppId="+oppId);
		}
		
		 
	 }/* Try block close */
 	catch(Exception e)
	{
		/* In Case if run-time exception is thrown 
		 * Then, counter comes inside catch block and display error on console
		 * And, redirect to AdminAddNewOppDetail.jsp with messsage=exception
		 * Then, at AdminAddNewOppDetail.jsp there's an condition which check if msg=exception 
		   and accordingly message is display on that page
		*/
		System.out.println("\n AdminUpdateOppDetailAction.jsp Exception: " + e);
		response.sendRedirect("AdminUpdateAndViewJobApplicationRecord.jsp?msg=exception&oppId=");
	}

%>

 