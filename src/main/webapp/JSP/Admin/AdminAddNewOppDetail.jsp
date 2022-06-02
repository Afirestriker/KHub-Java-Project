<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp"%>


<!-- 
	Here, Admin is adding the detail of the new opportunity for student, 
	Details like
		
		Publish date is by fetching our using java logic and then added to database
		1. Job Role
		2. Course Eligible
		3. Company Name
		4. Job Location
		5. Job Type
		6. max Package (CTC)
		7. Job Description
		8. Link
		9. Opportunity End Date
		10. Opportunity Status (Active / Inactive)
 -->
 
 <%
 	/* Print on console, indicating the navigation of pages */
	System.out.print("\n AdminAddOppDetail.jsp called \n");
	
	/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
	   credentials are matched.
	   Its also helps, in preventing unauthorised access to admin pages
	*/
	String admin = session.getAttribute("admin").toString();

 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Add New Opportunity</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="../../CSS/Admin/AdminAddNewOppDetail.css">
</head>
<body>

	<!-- Menu Section -->
		<%@include file="AdminHeader.jsp" %>	
	<!-- End of Menu  Section -->

	<section id="add-opp-detail-container">

		<img src="#" alt="KHubLogo" class="logo">
		<h1 class="formheading"> Add New Opportunity Detail </h1>

		<div class="add-opp-form-container">

			<% 
				/* IF, this page is redirected from AdminAddNewOppDetailAction.jsp with msg=exception
				 * condtion is true and message in <p>...</p> is displayed
				*/
				String msg = request.getParameter("msg");
				if("exception".equals(msg))
				{
			%>		
				<p class="errorMsg"> Something went wrong, Try Again!</p>
			<%  } %>
			
			<% 
				if("insertError".equals(msg))
				{
			%>		
				<p class="errorMsg"> Error in Inserting Data, Try Again. </p>
			<%  } %>

			<form action="AdminAddNewOppDetailAction.jsp" method="post">

				<table>	
				<!-- Row 1-2 Job Role -->
					<tr>
						<td>
							<label for="Job Role*"> Job Role* </label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="jobRole" placeholder="Enter Job Role" maxlength="500" required>
						</td>
					</tr>

				<!-- Row 3-4 Course Eligibility -->
					<tr>
						<td>
							<label for="Courses Eligible*"> Courses Eligible* </label>
						</td>
					</tr>
					<tr>
						<td>
							<p class="note">Note: Hold Ctrl to select multiple option</p>
						</td>
					</tr>
					<tr>
						<td>
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
						<td>
							<label for="Company Name*"> Company Name* </label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="companyName" placeholder="Enter Company Name" maxlength="500" required>
						</td>
					</tr>


				<!-- Row 7-8 Job Location -->
					<tr>
						<td>
							<label for="Job Location*"> Job Location* </label>
						</td>
					</tr>
					<tr>
						<td>
							<select name="jobLocation" size="3" multiple required>
								<option value="Mumbai"> Mumbai </option>
								<option value="Pune"> Pune </option>
								<option value="Chennai"> Chennai </option>
								<option value="Bangalore"> Bangalore </option>
								<option value="Kolkata"> Kolkata </option>
							</select>
						</td>
					</tr>


				<!-- Row 9-10 Job Type -->
					<tr>
						<td>
							<label for="Job Type*"> Job Type* </label>
						</td>
					</tr>
					<tr>
						<td>
							<select name="jobType" required>
								<option value="">Select</option>
								<option value="Full-Time">Full-Time</option>
								<option value="Part-Time">Part-Time</option>
							</select>
						</td>
					</tr>

				<!-- Row 11-12 Package -->
					<tr>
						<td>
							<label for="Package (CTC) per annum*"> Max Package (CTC) value/annum* </label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="maxPackage" placeholder="Enter Max Package value (in lakh) eg 1.2, 1.55, 12.40 etc" pattern="[0-9]{1,2}.[0-9]{1,2}" required>
						</td>
					</tr>	

				<!-- Row 13-14 Job Description -->
					<tr>
						<td>
							<label for="Job Description*"> Job Description* </label>
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="jobDescription" rows="4" cols="50" placeholder="Job Description" maxlength="1000" required></textarea>
						</td>
					</tr>


				<!-- Row 15-16 Opp Link -->
					<tr>
						<td>
							<label for="Link">Link</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="url" name="oppLink" placeholder="Paste URL here" required>
						</td>
					</tr>


				<!-- Row 17-18 Opp End Date -->
					<tr>
						<td>
							<label for="Opportunity End Date">Opportunity End Date</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="date" name="oppEndDate" required>
						</td>
					</tr>

				<!-- Row 19-20 Opportunity Status -->
					<tr>
						<td>
							<label for="Opportunity Status*"> Opportunity Status* </label>
						</td>
					</tr>
					<tr>
						<td>
							<select name="opportunityStatus" required>
								<option value="Active"> Active </option>
								<option value="Inactive"> Inactive </option>
							</select>
						</td>
					</tr>

				<!-- Save Form Data into Database Table -->
					<tr>
						<td>
							<input type="submit" value="Save">
						</td>
					</tr>

				</table>

    		</form>
		
		</div>
		<!-- container-form close -->

	</section>

</body>
</html>