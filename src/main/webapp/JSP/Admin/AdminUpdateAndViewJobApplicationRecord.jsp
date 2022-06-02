<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp"%>


<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	Here, Admin can do two things
		1. Admin can update Opportunity details
		2. Admin can see record of people/user who has taken action (Applied / Not-Interested) on particular opportunity
 -->
 
 <%!
	/* get and store value of the parameter passed through URL */
	String oppId = "";
%>

<%
	/* Print on console, indicating the navigation of pages */
	System.out.print("\n AdminUpdateAndViewJobApplicationRecord.jsp called \n");
	
	/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
       credentials are matched.
       Its also helps, in preventing unauthorised access to admin pages
    */
	String admin = session.getAttribute("admin").toString();
	
	/* get and store parameter value passed by URL and sometime from Filter Form, into status variable */
	oppId = request.getParameter("oppId");
	System.out.print(" Parameter OppID: " + oppId + "\n");
%>

<%!
	/* JSP Declaration tag, 
	 * Declaring variable that will be access in entire page, 
	 * Mainly used for storing value fetch for each record from DBMS
	 * And pasting it on page using JSP Expression Tag */
	
	static int totalRecordCount = 0;
	
	/* variable oppId already declared above, to store oppID value passed through URL  */
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
	
	/* Declared variable that will store data, for whoing Application Report */
	String stuEmail = null;
	String applicationStatus = null;
	String stuFirstName = null;
	String stuLastName = null;
	String stuCourse = null;
	
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
	
	/* Following is the logic use for fetching records from Job_Opporutnity table of khubv1 database*/
	 
	String fetchOppDetails = "SELECT * FROM Job_Opportunity WHERE OppId = ? ";
	PreparedStatement pstFetchOppDetails = con.prepareStatement(fetchOppDetails);
	pstFetchOppDetails.setString(1, oppId);
	
	ResultSet rsFetchOppDetails = pstFetchOppDetails.executeQuery();
	
	while(rsFetchOppDetails.next())
	{
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
	}
	/* close: while loop for rsFetchOppDetails */
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit plus View Application Record</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="../../CSS/Admin/AdminUpdateAndViewJobApplicationRecord.css">
	
	<!-- This is J-query embedded link, used for search field (Script is written at end of this page) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
</head>
<body>

<!-- Menu Section -->
	<%@include file="AdminHeader.jsp" %>	
<!-- End of Menu  Section -->


<!-- Grid Container -->
<div class="grid-container">
	
<!-- Edit Job Opportunity Form container -->
	<div class="Opportunity-edit-form">
		<h2>Edit Opportunity Detail</h2>
		<form action="AdminUpdateOppDetailAction.jsp" method="post" class="shadowEffect">
			
	<%	/* if the page url contains parameter with key msg, then we check its value and show message accordingly */
		String msg = request.getParameter("msg");
		if("recordUpdated".equals(msg))
		{
	%>		
			<span style="color: green;">Record Updated!</span>
	<%  }
		else if("databaseError".equals(msg))
		{
	%>
			<span style="color: red;">Database Update Error!</span>
	<%	}
		else if("exception".equals(msg))
		{
	%>
			<span style="color: red;">Exception Error!</span>
	<%	}
	%>

			<table>
			<!-- Row 1-2 Job Role -->
				<tr>
					<td colspan="2">
						<input hidden type="text" name="oppId" value="<%=oppId%>">
						<label for="Job Role*"> Job Role* </label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="jobRole" placeholder="Enter Job Role" maxlength="500" value="<%=jobRole%>" required>
					</td>
				</tr>

			<!-- Row 3-4 Course Eligibility -->
				<tr>
					<td colspan="2">
						<label for="Courses Eligible*"> Courses Eligible* </label>
						<p class="note">Note: Hold Ctrl to select multiple option</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="font-weight: bold;"><%= courseEligible %></p>
						<select name="courseEligible" size="3" multiple required>
							<option value="BBA"> BBA </option>
							<option value="MBA"> MBA </option>
							<option value="BCA"> BCA </option>
							<option value="MCA"> MCA </option>
							<option value="BE"> BE </option>
							<option value="ME"> ME </option>
						</select>
					</td>
				</tr>

			<!-- Row 5-6 Company Name -->
				<tr>
					<td colspan="2">
						<label for="Company Name*"> Company Name* </label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="companyName" placeholder="Enter Company Name" maxlength="500" value="<%=companyName%>" required>
					</td>
				</tr>


			<!-- Row 7-8 Job Location & Type -->
				<tr>
					<td>
						<label for="Job Location*"> Job Location* </label>
					</td>
					<td>
						<label for="Job Type*"> Job Type* </label>
					</td>
				</tr>
				<tr>
					<td>
						<p style="font-weight: bold;"><%= jobLocation %></p>
						<select name="jobLocation" size="3" multiple required>
							<option value="Mumbai"> Mumbai </option>
							<option value="Pune"> Pune </option>
							<option value="Chennai"> Chennai </option>
							<option value="Bangalore"> Bangalore </option>
							<option value="Kolkata"> Kolkata </option>
						</select>
					</td>

					<td>
						<select name="jobType" required>
							<% if(jobType.equalsIgnoreCase("Full-Time")) { %>
								<option value="Full-Time" selected>Full-Time</option>
								<option value="Part-Time">Part-Time</option>
							<%}%>
							
							<% if(jobType.equalsIgnoreCase("Part-Time")) { %>
							<option value="Full-Time">Full-Time</option>
							<option value="Part-Time" selected>Part-Time</option>
							<%}%>
						</select>
					</td>
				</tr>

			<!-- Row 9-10 Package -->
				<tr>
					<td colspan="2">
						<label for="Package (CTC) per annum*"> Max Package (CTC) value/annum* </label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="maxPackage" value="<%= maxPackage %>" placeholder="Enter Max Package value (in lakh) eg 1.2, 1.55, 12.40 etc" pattern="[0-9]{1,2}.[0-9]{1,2}" required>
					</td>
				</tr>	

			<!-- Row 11-12 Job Description -->
				<tr>
					<td colspan="2">
						<label for="Short Job Description*"> Short Job Description* </label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="jobDescription" rows="4" cols="50" placeholder="Short Job Description" maxlength="1000" required> <%= jobDescription %> </textarea>
					</td>
				</tr>


			<!-- Row 13-14 Opp Link -->
				<tr>
					<td colspan="2">
						<label for="Link">Link</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="url" name="oppLink" value="<%= oppLink %>" placeholder="Paste URL here" required>
					</td>
				</tr>

			<!-- Row 15-16 Opp End Date & Opp Status -->
				<tr>
					<td>
						<label for="Opportunity End Date">Opportunity End Date</label>
					</td>
					<td>
						<label for="Opportunity Status*"> Opportunity Status* </label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="date" value="<%= oppEndDate %>" name="oppEndDate" required>
					</td>
					<td>
						<select name="opportunityStatus" required>
							<% if(oppStatus.equalsIgnoreCase("Active")) { %>
								<option value="Active" selected> Active </option>
								<option value="Inactive"> Inactive </option>
							<%}%>
							
							<% if(oppStatus.equalsIgnoreCase("Inactive")) { %>
								<option value="Active"> Active </option>
								<option value="Inactive" selected> Inactive </option>
							<%}%>
						</select>
					</td>
				</tr>

			<!-- Save Form Data into Database Table -->
				<tr>
					<td colspan="2">
						<input type="submit" value="UPDATE">
					</td>
				</tr>
			</table>
		</form>
	</div>
<!-- Close: Edit/Update Job Opportunity Form container -->  


<!-- View application records container -->

<div class="Opportunity-application-record">
  		<h2>Application Report</h2>

  		<div class="searchOption">
  		<input type="search" id="searchField" placeholder="Search for names.." title="Type in a name"><span class="material-icons"> search </span>
  		</div>

  		<div id="printableTable" class="printBox shadowEffect">
  			<h3 class="table-heading"> <%= jobRole %> | <%= companyName %></h3>
  		<table>
		  <thead>
			  <tr>
			    <th>Name</th>
			    <th>Email</th>
			    <th>Course</th>
			  	<th>Status</th>
			  	<th>Info</th>
			  </tr>
		  </thead>
		  <tbody id="tableBody">
		  
		  <%
		  
		  /* Now we need to fetch records from student_application_status table for displaying all 
		   those users who has taken some action on this particular Job opportunity i.e Applied / Not-Interested
		 */
		 	String fetchApplicationDetails = "SELECT StuEmail, ApplicationStatus FROM Student_Application_Status where OppId = ?";

			PreparedStatement pstFetchApplicationDetails = con.prepareStatement(fetchApplicationDetails);
			pstFetchApplicationDetails.setString(1, oppId);

			ResultSet rsFetchApplicationDetails = pstFetchApplicationDetails.executeQuery();
			
			/* Go to line 350+, to see where() clause coding for this Query  */
			while(rsFetchApplicationDetails.next())
			{
				
				stuEmail = rsFetchApplicationDetails.getString("StuEmail");
				applicationStatus = rsFetchApplicationDetails.getString("ApplicationStatus");
				
				System.out.println("\n StuEmail: " + stuEmail + "\n");
				
				/* Now fetch stuent detail based on email optained from avove query */
				String fetchStuDetail = "SELECT Student_Personal_Detail.StuFirstName, Student_Personal_Detail.StuLastName, Student_Academic_Detail.StuCourse FROM Student_Personal_Detail, Student_Academic_Detail WHERE Student_Personal_Detail.StuEmail = ? AND Student_Academic_Detail.StuEmail = ?";
				
				PreparedStatement pstFetchStuDetail = con.prepareStatement(fetchStuDetail);
				pstFetchStuDetail.setString(1, stuEmail);
				pstFetchStuDetail.setString(2, stuEmail);
				
				ResultSet rsFetchStuDetail = pstFetchStuDetail.executeQuery();
				
				while(rsFetchStuDetail.next())
				{	
					stuFirstName = rsFetchStuDetail.getString("StuFirstName");
					stuLastName = rsFetchStuDetail.getString("StuLastName");
					stuCourse = rsFetchStuDetail.getString("StuCourse");
				
		  %>
				<tr>
				    <td> <%= stuFirstName %> <%= stuLastName %> </td>
				    <td> <%= stuEmail %> </td>
				    <td> <%= stuCourse %> </td>
				    <td> <%= applicationStatus %> </td>
				    <td> <a href="AdminViewUserResumeAction.jsp?stuEmail=<%=stuEmail%>" target="_blank"> View </a> </td>
			  </tr>	
		  
		  <%
				}/* rsFetchStuDetail while loop close */
		  	}
		  	/* rsFetchApplicationDetails while loop close */
		  %>

		  </tbody>
		</table>
		</div>
  	
  		<!-- Print Record Concept -->
  		<div class="printRecord">
		<button class="button_print" onclick="printDiv()">Print</button>
		<iframe name="print_table" width="0" height="0" frameborder="0" src="about:blank"></iframe>
		</div>

</div>
<!-- View application records container -->



</div>
<!-- Close: Grid Container -->


<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->
</body>

<!-- This JavaScript file contains concept for searching records and printing the displayed records -->
<script src="../../JS/Admin/AdminViewRecords.js"></script>

</html>


<%
	} /* try block close */
	catch(Exception e)
	{
		 System.out.print("\n AdminUpdateAndViewJobApplicationRecord.jsp Exception: " + e);
		 response.sendRedirect("AdminUpdateAndViewJobApplicationRecord.jsp?oppId="+ oppId +"&msg=exception");
	} /* catch block close */
	
	/* ********************************************************************************* */
%>