<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp" %>

<!-- importing calculation package for getting the current date -->
<%@ page import="calculation.*" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This file is called from AdminAddNewOppDetail.jsp page,
	
	This File represent the back-end process of AdminAddNewOppDetail.jsp page
	
	The Basic objective of this page is to add New opportunity detail into database so that user can see and apply for
	new opportunity if their course and opportunity eligible course matches
	
	Here, 
	The value parameter is collected from AdminAddNewOppDetail.jsp page
	and this values are enter into the KHubv1.job_opportunity table
	
	NOTE:
	Oppid column in database table is set for auto_increment so no need to add data to this manually
	OppDate i.e published date is the date on which the data is enter which is taken using java and then added into database
		
	NOTE: After the insertion of detail in KHubv1.job_opportunity table,
		  Navigate to AdminDisplayAllOpp.jsp page with parameter
		  	msg=reocrdInserted
		  	status=Active
		  	to take further user detail
 -->


 <%
 
	 try{
		 
	 	/* Print on console, indicating the navigation of pages */
		System.out.print("\n AdminAddNewOppDetailAction.jsp called \n");
		
		/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
		   credentials are matched.
		   Its also helps, in preventing unauthorised access to admin pages
		*/
		String admin = session.getAttribute("admin").toString();
	
		/* Get all form parameter from AdminAddNewOppDetail.jsp to store in KHubv1.job_opportunity table */
		String oppPublishDate = DatePicker.getCurrentDate();
		String oppEndDate = request.getParameter("oppEndDate");
		
		String jobRole = request.getParameter("jobRole");
		
		String courseEligibles[] = request.getParameterValues("courseEligible");
		String courseEligible= "";
		for(int i=0; i<courseEligibles.length; i++)
		{
			courseEligible = courseEligible + courseEligibles[i] + ", ";
		}
		
		String companyName = request.getParameter("companyName");
		
		String[] jobLocations = request.getParameterValues("jobLocation");
		String jobLocation = "";
		for(int i=0; i<jobLocations.length; i++)
		{
			jobLocation =  jobLocation + jobLocations[i] + ", ";
		}
		
		String jobType = request.getParameter("jobType");
		String maxPackage = request.getParameter("maxPackage");
		String jobDescription = request.getParameter("jobDescription");
		String oppLink = request.getParameter("oppLink");
		
		String opportunityStatus = request.getParameter("opportunityStatus");
		
		/* 
		System.out.print("\n" + oppPublishDate + "\n" + oppEndDate );
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
		
		/* Write MySql query to insert values in student_academic_detail table */
		String insertJobOpp = "INSERT INTO job_opportunity(OppPublishDate, OppEndDate, JobRole, CourseEligible, CompanyName, JobLocation, JobType, MaxPackage, jobDescription, OppLink, OppStatus)"
						 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		/* Using PreparedStatement interface to update database table,
		 * since we are accepting value at run time
		*/
		PreparedStatement pst = con.prepareStatement(insertJobOpp);
		pst.setString(1, oppPublishDate);
		pst.setString(2, oppEndDate);
		pst.setString(3, jobRole);
		pst.setString(4, courseEligible);
		pst.setString(5, companyName);
		pst.setString(6, jobLocation);
		pst.setString(7, jobType);
		pst.setString(8, maxPackage);
		pst.setString(9, jobDescription);
		pst.setString(10, oppLink);
		pst.setString(11, opportunityStatus);
		
		int insertStatus = pst.executeUpdate();
		
		if(insertStatus != 0)
		{
			/* One database is successfully updated	
			 * Navigate to AdminViewAllOpp.jsp page
			 */
			
			response.sendRedirect("AdminViewAllOpp.jsp?msg=recordInserted&status=Active");
		}
		else
		{
			 /* if Data insertion failed 
			  * Navigate back to AdminAddNewOppDetail with Error message
			  */
			response.sendRedirect("AdminAddNewOppDetail.jsp?msg=insertError");
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
			System.out.println("\n AdminAddNewOppDetail.jsp Exception: " + e);
			response.sendRedirect("AdminAddNewOppDetail.jsp?msg=exception");
		}
	
 %>