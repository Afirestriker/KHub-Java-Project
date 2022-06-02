<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!--
	This page is used to show all application detail on which user has take action, either 'Applied' or 'Not-Interested',
		CSS/User/ViewNewOpp.css is the CSS file for this page
-->

<%!
	/* status variable is for storing value passed by parameter named=status */
	String status = "";
%>

<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n User/ViewAllApplications.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
	/* get and store parameter value passed by URL and sometime from Filter Form, into status variable */
	status = request.getParameter("status");
%>


<%!
	/* JSP Declaration tag, 
	 * Declaring variable that will be access in entire page, 
	 * Mainly used for storing value fetch for each record from DBMS
	 * And pasting it on page using JSP Expression Tag */
	
	static int totalRecordCount = 0;
	 
	int oppId = 0;
	String oppPublishDate = null;
	String oppEndDate = null;
	String jobRole = null;
	String courseEligible = null;
	String companyName = null;
	String jobLocation = null;
	String jobType = null;
	String maxPackage = null;
	String jobDescription = null;
	String oppLink = null;
	String oppStatus = null;
%>

<%
/*********************************************************************************** 
 * Java Business Logic,
 * 1. Making Connection with JDBC
 * 2. Fetching Records from student_personal_detail and student_academic_detail table of khubv1 database table
 * 3. Displaying those records
 */
 
 try{
	 
	/* 
	* Make DBMS connection,
	* class DbConnection belongs to khudb package 
	* getConnection() is a static method of DbConnection which return connection object 
	*/
	Connection con = DbConnection.getConnection();
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>View Applications</title>
  	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../../CSS/User/ViewNewOpp.css">
</head>
<body>

<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->

<!-- Page Heading -->
<div class="pageHeading">
	<h1> <span class="material-icons">insights</span> Applications</h1>
  
  <!-- msg for if msg="databaseError" | "exception" -->
	<% 
		/* if the page url contains parameter with key msg, then we check its value and show message accordingly
		*/
		String msg = request.getParameter("msg");
		if("recordInserted".equals(msg))
		{
	%>		
			<span class="message">Record Inserted Successfully</span>
	<%	}
		else if("recordUpdated".equals(msg))
		{
	%>
			<span class="message">Record Updated Successfully</span>		
	<%	}
		else if("databaseError".equals(msg))
		{
	%>
			<span class="message" style="color: red;">Database Error!</span>
	<%	}
		else if("exception".equals(msg))
		{
	%>
			<span class="message" style="color: red;">Exception Error!</span>
	<%	}
	%>
	<hr>
</div>
<!-- Close: Page heading -->

<!-- Fetching Details to show on page -->
<%

	String countOppDetails = "SELECT COUNT(StuEmail) FROM Student_Application_Status WHERE ApplicationStatus = ? AND StuEmail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCountOppDetails = con.prepareStatement(countOppDetails);
	pstCountOppDetails.setString(1, status);
	pstCountOppDetails.setString(2, username);
	ResultSet rsCounthOppDetails = pstCountOppDetails.executeQuery();

	while(rsCounthOppDetails.next())
	{
		totalRecordCount = rsCounthOppDetails.getInt(1);
		/* System.out.print(" Total Opp Count: " + totalOppCount + "\n"); */
%>

<!-- Page Filter Options -->
<div class="filter">
	<span>Total Records in Display: <%= totalRecordCount %></span>

  <form action="ViewAllApplications.jsp" method="post">
    <input type="radio" name="status" value="Applied" <%if(status.equalsIgnoreCase("Applied")){%> checked <%}%> required>Applied
    <input type="radio" name="status" value="Not-Interested" <%if(status.equalsIgnoreCase("Not-Interested")){%> checked <%}%> >Not-Interested
    
    <input type="submit" name="Search" value="Search">
  </form>
</div>
<!-- Close: Page Filter Options -->

<%
		if(rsCounthOppDetails.getInt(1) == 0)
		{%>
			<div class="emptyRecords oppContainer boxShadowEffect">
    			No Records to display
  			</div>
		<%}
		else
		{
			/* if cursoe comes, here then it means that job_opportunity table is not empty, and 
			 * we can start fetching records and showing it on page
			 */
			 
			 /* First, we fetch OppID from student_application_detail table of khubv1 database
			    where applicationStatus = either 'Applied', 'Not-Interested', wathever saved in 'status' variable
			    and stuEmail is the current user email
			    
			    Then,
			    next based on OppID we fetched record from Job_Opportunity
			 */
			 
			String fetchOppID = "SELECT OppID FROM Student_Application_Status WHERE ApplicationStatus = ? AND StuEmail = (SELECT email FROM login WHERE username = ?)" ;
			PreparedStatement pstFetchOppID = con.prepareStatement(fetchOppID);
			pstFetchOppID.setString(1, status);
			pstFetchOppID.setString(2, username);
			
			ResultSet rsFetchOppID = pstFetchOppID.executeQuery();
			
			while(rsFetchOppID.next())
			{
				int getOppId = rsFetchOppID.getInt(1);
				
				String fetchOppDetails = "SELECT * FROM Job_Opportunity WHERE OppId = ?";
				PreparedStatement pstFetchOppDetails = con.prepareStatement(fetchOppDetails);
				pstFetchOppDetails.setInt(1, getOppId);
				
				ResultSet rsFetchOppDetails = pstFetchOppDetails.executeQuery();
				
				while(rsFetchOppDetails.next())
				{
					oppId = rsFetchOppDetails.getInt("OppID");
					oppPublishDate = rsFetchOppDetails.getString("OppPublishDate");
					oppEndDate = rsFetchOppDetails.getString("OppEndDate");
					jobRole = rsFetchOppDetails.getString("JobRole");
					courseEligible = rsFetchOppDetails.getString("courseEligible");
					companyName = rsFetchOppDetails.getString("companyName");
					jobLocation = rsFetchOppDetails.getString("JobLocation");
					jobType = rsFetchOppDetails.getString("JobType");
					maxPackage = rsFetchOppDetails.getString("MaxPackage");
					jobDescription = rsFetchOppDetails.getString("JobDescription");
					oppLink = rsFetchOppDetails.getString("OppLink");
					oppStatus = rsFetchOppDetails.getString("OppStatus");
				
				
				/* Here we have fetched detail of current records,
				 i.e the row at which result set is pointing to and we will print this on our page
				 then again the loop will run till all records at fetch, hence one by one 
				 all records will be display
				 */
%>

		<!-- Job Description Banner -->
		<div class="grid-container oppContainer boxShadowEffect">
		  
		  <!-- Row 1 JobRole and Course Eligible -->
		  <div class="grid-item item-1-icon">
		  	<span class="material-icons">business</span>
		  </div>
		
		  <div class="grid-item item-2-jobRole">
		  	<%= jobRole %>
		  </div>
		
		  <div class="grid-item item-3-icon">
		  	 <%= courseEligible %>
		  	 <span style="margin-left: 10px;" class="material-icons">school</span>
		  	 <%
		  	 	if(oppStatus.equalsIgnoreCase("Active"))
		  	 	{%>
		  	 		<span style="margin-left: 10px; color: forestgreen; font-size: 30px;" title="Active" class="material-icons">toggle_on</span>
		  	 <%	}
		  	 	else if(oppStatus.equalsIgnoreCase("Inactive"))
		  	 	{%>
		  	 		<span style="margin-left: 10px; color: indianred; font-size: 30px;" title="Inactive" class="material-icons">toggle_off</span>
		  	 <%	}
		  	 %>
		  </div>
		  
		  <!-- Row 2 Company Name and Job Location -->
		  <div class="grid-item item-4-name-location">
		  	 <%= companyName %>
		  	 <span> | </span> 
		  	 <%= jobLocation %>
		  </div>
		
		
		  <!-- Row 3 JobType and CTC value -->
		  <div class="grid-item item-5-jobType">
		  	<span class="opp-headings"> Job Type </span>
		  	<div class="jobType"> <%= jobType %> </div>
		  </div>
		
		  <div class="grid-item item-6-ctc">
		  	<span class="opp-headings"> Cost to Company </span>
		  	<div class="ctc"> Max CTC:  <span class="material-icons">currency_rupee</span> <%= maxPackage %>K </div>
		  </div>
		
		  <!-- Row 4 JobDescription -->
		  <div class="grid-item item-7-description">
		  	<hr>
		  	<span class="opp-headings">Description</span>
		  	<div class="jobDescription">
		  		<%= jobDescription %>
		  	</div>
		  </div>
		
		  <!-- Row 5 Job Link and Buttons -->
		  <div class="grid-item item-8-link">
		  	<hr>
		  	<span class="opp-headings">Link: </span>
		  	<a href="<%=oppLink%>">  Read full details here </a>
		  </div>
		  <div class="grid-item item-9-status">
		  	<hr> 	
		  	<!-- NOTE: Remember to pass variable OppID as parameter value to URL -->
		    <%
		    if(status.equalsIgnoreCase("Applied"))
		    {%>
		    	<a href="UpdateUserApplicationStatus.jsp?oppId=<%=oppId%>"><button class="btnWithdraw">Withdraw Application</button></a>	
		    <%}
		    else if(status.equalsIgnoreCase("Not-Interested"))
		    {%>
		    	<a href="UpdateUserApplicationStatus.jsp?oppId=<%=oppId%>"><button class="btnUndoNotInterested">Undo Not-Interested</button></a>	
		    <%}
		    %>
		  </div>
		
		</div>
		<!-- Close: Job Description Banner -->

<!-- Close: Fetching Details to show on page -->


<%
					}/* Close rsFetchOppDeails while loop */
				}/* Close: rsFetchOppID while loop */
			
			} /* else close */

		}/* Closing outer while Loop rsCounthOppDetails */

	} /* try block close */
	catch(Exception e)
	{
		 System.out.print("\n ViewAllApplications.jsp Exception: " + e);
		 response.sendRedirect("ViewAllApplications.jsp?msg=exception&status=Applied");
	} /* catch block close */
	
	/* ********************************************************************************* */
%>


<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>
</html>
