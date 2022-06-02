<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	Here, Admin can see all added opportunities and make further changes, 
 -->

<%!
	/* get and store value of the parameter passed through URL or when filter form is submitted */
	String status = "";
%>

<%
	/* Print on console, indicating the navigation of pages */
	System.out.print("\n AdminViewAllOpp.jsp called \n");
	
	/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
       credentials are matched.
       Its also helps, in preventing unauthorised access to admin pages
    */
	String admin = session.getAttribute("admin").toString();
	
	/* get and store parameter value passed by URL and sometime from Filter Form, into status variable */
	status = request.getParameter("status");
	
	System.out.print(" Parameter Status: " + status + "\n");
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
	<title>View Added Opportunities</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" type="text/css" href="../../CSS/Admin/AdminViewAllOpp.css">
</head>
<body>

<!-- Menu Section -->
	<%@include file="AdminHeader.jsp" %>	
<!-- End of Menu  Section -->

<!-- Page Heading -->
<div class="pageHeading">
	<h1> <span class="material-icons">insights</span> Opportunities</h1>
  
  <!-- msg for if msg="recordInserted" | "recordUpdated" | "recordDeleted" | "databaseError" | "exception" -->
	<% 
		/* if the page url contains parameter with key msg, then we check its value and show message accordingly
		*/
		String msg = request.getParameter("msg");
		if("recordInserted".equals(msg))
		{
	%>		
			<span class="message">Record Inserted Successfully</span>
	<%  }
		else if("recordUpdated".equals(msg))
		{
	%>
			<span class="message">Record Updated Successfully</span>		
	<%	}
		else if("recordDeleted".equals(msg))
		{
	%>
			<span class="message" style="color: red;">Record Deleted Successfully</span>
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

	String countOppDetails = "SELECT COUNT(*) FROM Job_Opportunity WHERE OppStatus = '" + status + "'" ;
	PreparedStatement pstCountOppDetails = con.prepareStatement(countOppDetails);
	ResultSet rsCounthOppDetails = pstCountOppDetails.executeQuery();

	while(rsCounthOppDetails.next())
	{
		totalRecordCount = rsCounthOppDetails.getInt(1);
		/* System.out.print(" Total Opp Count: " + totalOppCount + "\n"); */
%>

<!-- Page Filter Options -->
<div class="filter">
  <span>Total Records in Display: <%= totalRecordCount %></span>

  <form action="AdminViewAllOpp.jsp" method="post">
    <input type="radio" name="status" value="Active" <%if(status.equalsIgnoreCase("Active")){%> checked <%}%> required>Active
    <input type="radio" name="status" value="InActive" <%if(status.equalsIgnoreCase("Inactive")){%> checked <%}%>>Inactive
    
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
			 
			 /* Following is the logic use for fetching records from Job_Opporutnity table of khubv1 database*/
			 
			String fetchOppDetails = "SELECT * FROM Job_Opportunity WHERE OppStatus = '" + status + "'" ;
			PreparedStatement pstFetchOppDetails = con.prepareStatement(fetchOppDetails);
			
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
		  	<a href="<%=oppLink%>" target="_blank">  Read full details here </a>
		  </div>
		  <div class="grid-item item-9-status">
		  	<hr>
		  	
		  	<!-- NOTE: Remember to pass variable OppID as parameter value to URL -->
		    <a href="AdminUpdateAndViewJobApplicationRecord.jsp?oppId=<%=oppId%>"> <button class="btnEdit">Edit</button></a>
		    <a href="AdminUpdateAndViewJobApplicationRecord.jsp?oppId=<%=oppId%>"> <button class="btnApplicationList">Application List</button></a>
		  </div>
		
		</div>
		<!-- Close: Job Description Banner -->

<!-- Close: Fetching Details to show on page -->


<%
		
				}/* Close: Inner while loop for Fetching Opportunity Details */
			
			} /* else close */

		}/* Closing outer while Loop use for counting records in Job_Opportunity table of Khubv1 Database */
	
	} /* try block close */
	catch(Exception e)
	{
		 System.out.print("\n AdminViewAllOpp.jsp Exception: " + e);
		 response.sendRedirect("AdminViewAllOpp.jsp?msg=exception");
	} /* catch block close */
	
	/* ********************************************************************************* */
%>



<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>
</html>



