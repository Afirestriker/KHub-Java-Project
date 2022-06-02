<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This is user settings page, where user enter his/her updated details such as,
	* Update Personal Details
	* Update Academic Details
	* Update Skills Table
	
	* Insert/Update Project Exp Details
	* Insert/Update Achievements Details
	
	* Update/Change Password
	* Delete Account
 -->

<% 
	/* Print message on console, indicating which page is visited */
	System.out.print("\n UserSettings.jsp page called \n"); 
	String username = session.getAttribute("username").toString();
%>

<%!
	/* Declare variables for storing student_personal_detail and student_academic_detail information, Skills, Project_Exp, & Achivements */
	String email = null;
	
	/* student_personal_detail storage variables */
	String firstname = null;
	String lastname = null;
	String birthdate = null;
	String gender = null;
	String mobile = null;
	String address = null;
	String city = null;
	String state = null;
	String country = null;
	String about = null;
	
	/* student_academic_detail storage variable */
	String collegeUniversity = null;
	String collegeName = null;
	String course = null;
	String collegeAggregate = null;
	String collegeStartPassYear = null;
	
	String university10th = null;
	String schoolName10th = null;
	String grade10th = null;
	String startPassYear10th = null;
	
	String university12th = null;
	String collegeName12th = null;
	String grade12th = null;
	String startPassYear12th = null;
	
	/* Student Skills storage variable */
		
		/* NOTE: course variable from student Academic detail is use to filter and show skills based on student course */
	
		/* Professional skills */
		int accounting=0, excel=0, tally=0, marketing=0, management=0, analytics=0;
		int html = 0;
		int css = 0;
		int javaScript = 0;
		int c = 0;
		int cpp = 0;
		int java = 0;
		int python = 0;
		int php = 0;
	
		/* Interpersonal SKills */
		int communication = 0;
		int teamwork = 0;
		int perseverance = 0;
		int problemSolving = 0;
		int timeManagement = 0;
		int agility = 0;

	/* check user data count in project_exp and Achivement table */
	int countUserDataInAchivementsTable = 0;
	int countUserDataInProjectExpTable = 0;
	
	/* Student Achievements Detail storage variable */
	String achivement1 = null;
	String achivement2 = null;
	String achivement3 = null;
	String achivement4 = null;
	String achivement5 = null;
	
	/* Student Project Details Storage Variable */
	String project1Name = null;
	String project1StartTime = null;
	String project1EndTime = null;
	String project1Description = null;
	
	String project2Name = null;
	String project2StartTime = null;
	String project2EndTime = null;
	String project2Description = null;
	
%>


<%
	/* Before Showing page content
	 * Make JDBC conection and check if user details are added in student_personal_detail, student_academic_detail, and skills table or not
	   If not, then redirect to UserLoginAction.jsp page, since this are basic requirement of this application from user end
	   If yes, then fetched details from the tables and show them in the form fields
	   
	   Also, check if data is present in Project_Exp and Achivements table, 
	   	if yes, then fetch and show that detail as well
	   	if Noe, then show alert that Project_exp and Achivement detail are empty
	 */
try{
	
	/* 
	 * Make DBMS connection,
	 * class DbConnection belongs to khudb package 
	 * getConnection() is a static method of DbConnection which return connection object 
	 */
	Connection con = DbConnection.getConnection();

	/* First, check if student data exist in student_personal_detail
	 * if yes, check next if student data exist in student_academic_detail
	 * if yes, check next if student records exist in skills table
	 * if yes in all three condition, then display UserSettings.jsp page content
	 
	 * If student data does not exist any of this table,
	   then redirect UserLoginAction.jsp page,
	   As, this mean that student has not completed his/her login process 
	   i.e Basic data entry (Personal, Academic & SKills details) is not done.
	*/
	String checkDetailInPersonalDetailTable = "SELECT COUNT(stuemail) FROM student_personal_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCheckPersonalDetail = con.prepareStatement(checkDetailInPersonalDetailTable);
	pstCheckPersonalDetail.setString(1, username);
	ResultSet rs1 = pstCheckPersonalDetail.executeQuery();
	while(rs1.next())
	{
		if(rs1.getInt(1) == 0)
		{
			response.sendRedirect("UserLoginAction.jsp");
		}
	}
	/* checkDetailInPersonalDetailTable close */

	/* Check if student record exist in student_acadmic_detail database table
	 * If no, then redirect to UserLoginAction.jsp
	 * If Yes, then go to next
	*/
	String checkDetailInAcademicDetailTable = "SELECT COUNT(stuemail) FROM student_academic_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCheckAcademicDetail = con.prepareStatement(checkDetailInAcademicDetailTable);
	pstCheckAcademicDetail.setString(1, username);
	ResultSet rs2 = pstCheckAcademicDetail.executeQuery();
	while(rs2.next())
	{
		if(rs2.getInt(1) == 0)
		{
			response.sendRedirect("UserLoginAction.jsp");
		}
	}
	/* checkDetailInAcademicDetailTable close */
	
	
	/* Check if student record exist in skills database table
	 * If no, then redirect to UserLoginAction.jsp
	 * If Yes, then go to next
	*/
	String checkSkillsDetails = "SELECT COUNT(stuemail) FROM skills WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCheckSkillsDetails = con.prepareStatement(checkSkillsDetails);
	pstCheckSkillsDetails.setString(1, username);
	ResultSet rsCheckSkills = pstCheckSkillsDetails.executeQuery();
	while(rsCheckSkills.next())
	{
		if(rsCheckSkills.getInt(1) == 0)
		{
			response.sendRedirect("UserLoginAction.jsp");
		}
	}
	/* closed, Check Skills table records exist for current user or not*/
	
	
	/* 
	 * console comes here, only if student recored exist in
		1. student_personal_detail table
		2. student_academic_detail table
		3. skills table
	 */
	 
	/* fetching student recors from student_personal_detail table and display on the page */
	String fetchedSPD = "SELECT * FROM student_personal_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pst3 = con.prepareStatement(fetchedSPD);
	pst3.setString(1, username);
	ResultSet rs3 = pst3.executeQuery();
	while(rs3.next())
	{
		email = rs3.getString("stuemail");
		firstname = rs3.getString("stufirstname");
		lastname = rs3.getString("stulastname");
		birthdate = rs3.getString("stubirthdate");
		gender = rs3.getString("stugender");
		mobile = rs3.getString("stumobile");
		address = rs3.getString("stuaddress");
		city = rs3.getString("stucity");
		state = rs3.getString("stuState");
		country = rs3.getString("stucountry");
		about = rs3.getString("stuabout");
	}
	/* operation close for fetching details of user from studetn_personal_detail database table */
	
	/* System.out.print("\n" + username + "\n" + firstname + "\n" + lastname + "\n" + birthdate + "\n" + age + "\n" + gender + "\n" + address + "\n" + city + "\n" + country + "\n" + about + "\n"); */
	

   /* fetching student recors from student_academic_detail table and display on the page */
	String fetchedSAD = "SELECT * FROM student_academic_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pst4 = con.prepareStatement(fetchedSAD);
	pst4.setString(1, username);
	ResultSet rs4 = pst4.executeQuery();
	while(rs4.next())
	{
		collegeUniversity = rs4.getString("college_university_name");
		collegeName = rs4.getString("college_name");
		course = rs4.getString("stucourse");
		collegeAggregate = rs4.getString("college_aggregate");
		collegeStartPassYear = rs4.getString("college_start_pass_year");
		
		university12th = rs4.getString("12th_university_name");
		collegeName12th = rs4.getString("12th_college_name");
		grade12th = rs4.getString("12th_grade");
		startPassYear12th = rs4.getString("12th_start_pass_year");
		
		university10th = rs4.getString("10th_university_name");
		schoolName10th = rs4.getString("10th_school_name");
		grade10th = rs4.getString("10th_grade");
		startPassYear10th = rs4.getString("10th_start_pass_year");		
	}
	/* operation close for fetching details of user from student_academic_detail database table */
	
	/* 
		System.out.print("\n" + username + "\n");
		System.out.print(collegeUniversity + "\n" + collegeName + "\n" + course + "\n" + collegeAggregate + "\n" + collegeStartPassYear +  "\n");
		System.out.print(university10th + "\n" + schoolName10th + "\n" + grade10th + "\n" + startPassYear10th +  "\n");
		System.out.print(university12th + "\n" + collegeName12th + "\n" + grade12th + "\n" + startPassYear12th +  "\n");
	 */

	
	/* fetching student recors from khubv1.skills table and display on the page */
	String fetchSkills = "SELECT * FROM skills WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstSkills = con.prepareStatement(fetchSkills);
	pstSkills.setString(1, username);
	ResultSet rsSkills = pstSkills.executeQuery();
	while(rsSkills.next())
	{
		accounting = rsSkills.getInt("accounting");
		excel = rsSkills.getInt("excel");
		tally = rsSkills.getInt("tally");
		marketing = rsSkills.getInt("marketing");
		management = rsSkills.getInt("management");
		analytics = rsSkills.getInt("analytics");
		
		html = rsSkills.getInt("html");
		css = rsSkills.getInt("css");
		javaScript = rsSkills.getInt("javaScript");
		c = rsSkills.getInt("c");
		cpp = rsSkills.getInt("cpp");
		java = rsSkills.getInt("java");
		python = rsSkills.getInt("python");
		php = rsSkills.getInt("php");
		
		communication = rsSkills.getInt("communication");
		teamwork = rsSkills.getInt("teamWork");
		perseverance = rsSkills.getInt("perseverance");
		problemSolving = rsSkills.getInt("problemSolving");
		timeManagement = rsSkills.getInt("problemSolving");
		agility = rsSkills.getInt("agility");		
	}
	/* operation close for fetching details of user from skills table */
	
	/* 
	System.out.println("\n\n" + username + "\n" );
	System.out.println(accounting + " " + excel + " " + tally + " " + marketing + " " + management + " " + analytics + "\n" );
	System.out.println(html + " " + css + " " + javaScript + " " + c + " " + cpp + " " + java + " " + python + " " + php + "\n" );
	System.out.println( communication + " " + teamwork + " " + perseverance + " " + problemSolving + " " + timeManagement + " " + agility + "\n\n" );
	 */
	
	 
	/* Now, Student Basic Detaisl data are fetched and ready to be shown on setting page
	 * 
	 * Here we check if student record exist in Project Experience and Achivements table or not,
	   well this are not basic requirement 
	   But, this details are necessary if user wans to generate Resume-Template-2 and Resume-Template-3
	   
	   If details are not present in any of these table then accordingly alert is shown such as
	   	"Project Experience Details are Empty!"
	   	"Achievement Details are Empty!"
	 */
	
	/* Check if student record exist in Achievement database table
	 * If no, then show alert that "Achivement Details are Empty!"
	 * If Yes, then update  
	*/
	String checkAchievementDetails = "SELECT COUNT(stuemail) FROM Student_Achievements WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCheckAchievementDetails = con.prepareStatement(checkAchievementDetails);
	pstCheckAchievementDetails.setString(1, username);
	ResultSet rsCheckAchievements = pstCheckAchievementDetails.executeQuery();
	while(rsCheckAchievements.next())
	{
		System.out.println(" check ach count: " + rsCheckAchievements.getInt(1));
		if(rsCheckAchievements.getInt(1) != 0)
		{
			countUserDataInAchivementsTable = 1;
			
			/* fetching student record from khubv1.Student_Achievements table and display on the page */
			String fetchAchievements = "SELECT * FROM Student_Achievements WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
			PreparedStatement pstFetchedAchievements = con.prepareStatement(fetchAchievements);
			pstFetchedAchievements.setString(1, username);
			ResultSet rsFetchedAchievement = pstFetchedAchievements.executeQuery();
			while(rsFetchedAchievement.next())
			{
				achivement1 = rsFetchedAchievement.getString("Achievement1");	
				achivement2 = rsFetchedAchievement.getString("Achievement2");
				achivement3 = rsFetchedAchievement.getString("Achievement3");
				achivement4 = rsFetchedAchievement.getString("Achievement4");
				achivement5 = rsFetchedAchievement.getString("Achievement5");
			}
			/* operation close for fetching details of user from Student_Achievements table */
		}
	}
	/* closed, Check Achivements table records exist for current user or not*/
	 
	/* Check if student record exist in Project_Exp database table
	 * If no, then show alert that "Project Details are Empty!"
	 * If Yes, then update  
	*/
	String checkProjectDetails = "SELECT COUNT(stuemail) FROM Student_Project_Exp WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
	PreparedStatement pstCheckProjectDetails = con.prepareStatement(checkProjectDetails);
	pstCheckProjectDetails.setString(1, username);
	ResultSet rsCheckProject = pstCheckProjectDetails.executeQuery();
	while(rsCheckProject.next())
	{
		System.out.println(" check Project count: " + rsCheckProject.getInt(1));
		if(rsCheckProject.getInt(1) != 0)
		{
			countUserDataInProjectExpTable = 1;
			
			/* fetching student record from khubv1.Student_Project_Exp table and display on the page */
			String fetchProjectExp = "SELECT * FROM Student_Project_Exp WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
			PreparedStatement pstFetchedProjectExp = con.prepareStatement(fetchProjectExp);
			pstFetchedProjectExp.setString(1, username);
			ResultSet rsFetchedProjectExp = pstFetchedProjectExp.executeQuery();
			while(rsFetchedProjectExp.next())
			{
				project1Name = rsFetchedProjectExp.getString("Project1Name");
				project1StartTime = rsFetchedProjectExp.getString("Project1StartTime");
				project1EndTime = rsFetchedProjectExp.getString("Project1EndTime");
				project1Description = rsFetchedProjectExp.getString("Project1Description");
				
				project2Name = rsFetchedProjectExp.getString("Project2Name");
				project2StartTime = rsFetchedProjectExp.getString("Project2StartTime");
				project2EndTime = rsFetchedProjectExp.getString("Project2EndTime");
				project2Description = rsFetchedProjectExp.getString("Project2Description");
			}
			/* operation close for fetching details of user from Student_Project_Exp table */
		}
	}
	/* closed, Check Achivements table records exist for current user or not*/
	 
	
	System.out.println( "  " + username + " Count Project detail: " + countUserDataInProjectExpTable );
	System.out.println( "  " + username + " Count Achivement detail: " + countUserDataInAchivementsTable);
	
	
} /* try block close */
catch(Exception e)
{
	System.out.println("\n UserSettings.jsp page Exception: " + e);
} /* catch block close */
	 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>User Settings</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/User/UserSettings1.css">
</head>
<body class="user-settings-body">

<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->

	<div class="user-settings-container">

		<div class="row">
			
			<div class="col-left">

			<%
				String update = request.getParameter("update");
				if("AcademicDetailsUpdated".equals(update))
				{
			%>
				<p class="status-on">Academic Details Updated Successfully</p>
			<%	} %>
			
			<% if("PersonalDetailUpdated".equals(update))
				{
			%>
				<p class="status-on">Personal Details Updated Successfully</p>
			<%	} %>
			
			<% if("SkillDetailsUpdated".equals(update))
				{
			%>
				<p class="status-on">Skills Details Updated Successfully</p>
			<%	} %>
			
			<% if("ProjectDetailsInserted".equals(update))
				{
			%>
				<p class="status-on">Project Details Inserted Successfully</p>
			<%	} %>
			
			<% if("ProjectDetailsUpdated".equals(update))
				{
			%>
				<p class="status-on">Project Details Updated Successfully</p>
			<%	} %>
			
			<% if("AchievementsDetailsInserted".equals(update))
				{
			%>
				<p class="status-on">Achievements Details Inserted Successfully</p>
			<%	} %>
			
			<% if("AchievementsDetailsUpdated".equals(update))
				{
			%>
				<p class="status-on">Achievements Details Updated Successfully</p>
			<%	} %>
			
			<% if("PasswordChanged".equals(update))
				{
			%>
				<p class="status-on">Password Changed Successfully</p>
			<%	} %>
			
			<!-- Status-off error / exception messages -->
			<% if("cantInsert".equals(update))
				{
			%>
				<p class="status-alert">Data already Present! Try Update</p>
			<%	} %>
			
			<% if("InsertError".equals(update))
				{
			%>
				<p class="status-off">Error Inserting! Try Again</p>
			<%	} %>
			
			<% if("passIncorrect".equals(update))
				{
			%>
				<p class="status-off">Password Incorrect! Try Again</p>
			<%	} %>
			
			<% if("notupdated".equals(update))
				{
			%>
				<p class="status-off">Error Updating! Try Again</p>
			<%	} %>
			
			<% if("exception".equals(update))
				{
			%>
				<p class="status-off">Something Went Wrong! Try Again</p>
			<%	} %>
			
			<!-- Status Alert Message -->		
			<% if(countUserDataInAchivementsTable == 0)
				{
			%>
				<p class="status-alert">NOTE: Enter Achievements Details! To Unlock Modern Resume Template. <a href="#InsertAchievements"> Do it Now</a></p>
			<%	} %>
			
			<% if(countUserDataInProjectExpTable == 0 || countUserDataInAchivementsTable == 0)
				{
			%>
				<p class="status-alert">NOTE: Enter Both Project & Achievement Details To Unlock Advanced Resume Template. <a href="#InsertProjectExp"> Do it Now</a></p>
			<%	} %>
			
			
			
				<img width="350px" height="400px" alt="graphic-artist-freelancer.jpg" src="../../Images/user/graphic-artist-freelancer.jpg">
				<br>
				<p class="firstname"> <%= firstname %> </p>
				<p class="email"> <%= email %> </p>

			</div> <!-- col-left close -->

			<div class="col-middle">
				
				<h3>Update Personal Details</h3>
				<br>

				<!-- Update Personal Details form -->
				<form action="UpdateUserPersonalDetailsAction.jsp" method="post">
					<table>
						<tr>
							<td>Firstname*</td>
							<td>Lastname*</td>
						</tr>
						
						<tr>
							<!-- Firstname Input field -->
							<td> <input type="text" name="firstname" value="<%= firstname %>" placeholder="Your first name.." pattern="[a-zA-Z\s]{3,}" title="Only letters and min 4 char long" required> </td>

							<!-- Lastname Input Field -->
							<td> <input type="text" name="lastname" value="<%= lastname %>" placeholder="Your last name.." pattern="[a-zA-Z\s]{3,}" title="Only letters and min 4 char long" required> </td>
						</tr>

						<tr>
							<td>Birth-Date*</td>
							<td>Gender*</td>
						</tr>

						<tr>
							<!-- Age Select -->
							<td>  
								<input type="date" name="birthdate" title="Birth Years (2000 - 1990)" value="<%= birthdate %>" min="1990-01-01" max="2000-12-31" required>
							</td>

							<td>
								<!-- Gender Radio buttons -->
								<% if("M".equals(gender))
									{
								%>
								<input type="radio" name="gender" value="M" required checked> <label for="male" >Male</label>
				    			<%	} 
									else
				    				{
				    			%>
				    					<input type="radio" name="gender" value="M" required > <label for="male" >Male</label>
				    			<%	} %>
				    				
				    			<% if("F".equals(gender))
				    				{
				    			%>
				    					<input type="radio" name="gender" value="F" checked> <label for="Female">Female</label>
				    			<%	}
				    				else
				    				{
				    			%>
				    					<input type="radio" name="gender" value="F" > <label for="Female">Female</label>
				    			<%	} %>
				    			
				    			<% if("O".equals(gender))
				    				{
				    			%>
				    					<input type="radio" name="gender" value="O" checked> <label for="Other">Other</label>
								<% 	} 
				    				else
				    				{
								%>
										<input type="radio" name="gender" value="O" > <label for="Other">Other</label>
								<%	} %>
								
							</td>
						</tr>

						<tr>
							<td>Mobile*</td>
							<td>Address*</td>
						</tr>
						<tr>
							<td>
								<input type="tel" name="mobile" value="<%= mobile %>" placeholder="+91-123-457-7890" title="Format: Indian Mobile Number (+91-123-456-7890)" pattern="[+]91-[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
							</td>
							<td>
								<input type="text" name="address" placeholder="Your Address..." value="<%= address %>" title="Enter Address" maxlength="300" required> <br>
							</td>
						</tr>

						<tr>
							<td>City*</td>
							<td>State*</td>
						</tr>

						<tr>
							<td>
								<!-- City Input Field -->
	    						<input type="text" name="city" value="<%= city %>" placeholder="Your City..." pattern="[a-zA-Z\s]{4,}" title="Only letters and min 4 char long" required> <br>
							</td>

							<td>
								<!-- Country Input Field -->
				    			<input type="text" name="state" value="<%= state %>" placeholder="Your State..." pattern="[a-zA-Z\s]{4,}" title="Only letters and min 4 char long" required> <br>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">Country*</td>
						</tr>
						<tr>
							<td>
								<!-- Country Input Field -->
				    			<input type="text" name="country" value="<%= country %>" placeholder="Your Country..." pattern="[a-zA-Z\s]{4,}" title="Only letters and min 4 char long" required> <br>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">About Me*</td>
						</tr>

						<tr>
							<td colspan="2">
								<textarea name="aboutme" rows="2" cols="40" placeholder="More About Me..." maxlength="1000" required> <%= about %> </textarea>
							</td>
						</tr>

						<tr>
							<td colspan="2"> <input type="submit" value="UPDATE PERSONAL DETAILS"> </td>
						</tr>

					</table>
				</form> 
				<!-- Update Personal Details form close -->


				<!-- Update Academic Details -->
				<hr>
				<br><br>
				<h3>Update Academic Details</h3>
				<br>
				<form action="UpdateUserAcademicDetailsAction.jsp" method="post">
	
					<table class="academicDetail">
					
					<!-- Enter College Details -->

						<!-- University name rows -->
						<tr>
							<td colspan="2">College University*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="collegeUniversity" value="<%= collegeUniversity %>" maxlength="300" placeholder="Enter College University Name, Place" required>
							</td>
						</tr>

						<!-- College name rows -->
						<tr>
							<td colspan="2">College Name*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="collegeName" value="<%= collegeName %>" maxlength="300" placeholder="Enter College Name" required>
							</td>
						</tr>

						<!-- Enter course details -->
						<tr>
							<td colspan="2">Course*</td>
						</tr>

						<tr>
							<!-- Course Select Field -->
							<td colspan="2"> 
								<select name="course" required>
				    				<option value="<%= course %>"> <%= course %> </option>
				    				<option value="BBA">BBA</option>
				    				<option value="BCA">BCA</option>
				    				<option value="BE">BE</option>
				    				<option value="MBA">MBA</option>
				    				<option value="MCA">MCA</option>
				    				<option value="ME">ME</option>
				    			</select>
    			 			</td>
						</tr>
						<!-- course details close -->
						

						<!-- College Aggregate and Start-Pass year -->
						<tr>
							<td>College Aggregate (%)*</td>
							<td>College Start-Pass Year*</td>
						</tr>

						<tr>
							<td>
								<!-- College Aggregate Select -->
				    			<select name="collegeAggregate" required>
				    				<option value="<%= collegeAggregate %>"><%= collegeAggregate %></option>
				    				<option value="A">A (81 - 100)</option>
				    				<option value="B">B (70 - 79)</option>
				    				<option value="C">C (60 - 69)</option>
				    				<option value="D">D (50 - 59)</option>
				    			</select>
							</td>

							<td>
								<input style="width:75%" type="text" name="collegeStartPassYear" value="<%= collegeStartPassYear %>" placeholder="1234 - 1234" pattern="[0-9]{4,4} - [0-9]{4,4}" required>
							</td>
						</tr>

				<!-- College Details Close -->
					
				<!-- Enter 12th Details -->

						<!-- 12th University name rows -->
						<tr>
							<td colspan="2">12th University*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="university12th" value="<%= university12th %>" maxlength="300" placeholder="Enter 12th University Name, Place" required>
							</td>
						</tr>

						<!-- 12th school name rows -->
						<tr>
							<td colspan="2">12th College Name*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="collegeName12th" value="<%= collegeName12th %>" maxlength="300" placeholder="Enter 12th School Name" required>
							</td>
						</tr>

						<!-- 12th Grade (%)  and start-pass year rows -->
						<tr>
							<td>12th Grade (%)*</td>
							<td>12th Start-Pass Year*</td>
						</tr>

						<tr>
							<td>
								<!-- 12th Grade Select -->
								<select name="grade12th" required>
				    				<option value="<%= grade12th %>"><%= grade12th %></option>
				    				<option value="A">A (81 - 100)</option>
				    				<option value="B">B (70 - 79)</option>
				    				<option value="C">C (60 - 69)</option>
				    				<option value="D">D (50 - 59)</option>
				    			</select>
							</td>
							
							<td>
							<input style="width:75%" type="text" name="startPassYear12th" value="<%= startPassYear12th %>" placeholder="1234 - 1234" pattern="[0-9]{4,4} - [0-9]{4,4}" required>
							</td>

						</tr>

				<!-- 12th Details close -->

				
				<!-- Enter 10th Details -->
						<!-- 10th University name rows -->
						<tr>
							<td colspan="2">10th Board*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="university10th" value="<%= university10th %>" maxlength="300" placeholder="Enter SSC Board Name, Place" required>
							</td>
						</tr>

						<!-- 10th school name rows -->
						<tr>
							<td colspan="2">10th school Name*</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" name="schoolName10th" value="<%= schoolName10th %>" maxlength="300" placeholder="Enter SSC School Name" required>
							</td>
						</tr>

						<!-- 10th Grade (%)  and start-pass year rows -->
						<tr>
							<td>10th Grade (%)*</td>
							<td>10th Start - Pass Year</td>
						</tr>
						<tr>
							<!-- 10th Grade Select -->
							<td>  
								<select name="grade10th" required>
				    				<option value="<%= grade10th %>"><%= grade10th %></option>
				    				<option value="A">A (81 - 100)</option>
				    				<option value="B">B (70 - 79)</option>
				    				<option value="C">C (60 - 69)</option>
				    				<option value="D">D (50 - 59)</option>
				    			</select>
							</td>

							<td>
								<input style="width:75%" type="text" name="startPassYear10th" value="<%= startPassYear10th %>" placeholder="1234 - 1234" pattern="[0-9]{4,4} - [0-9]{4,4}" required>
							</td>
						</tr>
				<!-- 10th details close -->
	
						<tr>
							<td colspan="2"> <input type="submit" value="UPDATE ACADEMIC DETAILS"> </td>
						</tr>

					</table>
				</form>	
				<!-- Update Academic Detail form close -->

				<!-- Update Project/Experience Detail Form -->
				<hr>
				<br><br>
				<%
				if(countUserDataInProjectExpTable != 0)
				{
				%>
				<h3 id="updateProjectExp">Update Project/Experience Details</h3>
				<form action="UpdateUserProjectExpDetailsAction.jsp" method="post">
				<%
				}
				else
				{
				%>
				<h3 id="InsertProjectExp">Insert Project/Experience Details</h3>
				<form action="AddUserProjectExpDetailsAction.jsp" method="post">
				<%
				}%>
					<table class="projectDetail">
						<!-- Recent Project Details -->
						<tr> 
							<td colspan="2"> <p style="font-size: 18px; margin-bottom: 8px;">Recent Project Details</p> </td> 
						</tr>
						<tr>
							<td colspan="2">
								<label for="First Name">Project Name *</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
	    						<input type="text" name="project1Name" placeholder="Enter Project Name.." <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project1Name %>" <% } %> maxlength="500" required>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label for="First Name">Project Duration (Start - Finish) *</label>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="Month" name="project1StartTime" <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project1StartTime %>" <% } %> title="Project Start Month & Year" required>
							</td>
							<td>
								<input type="Month" name="project1EndTime" <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project1EndTime %>" <% } %> title="Project End Month & Year" required>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label for="Last Name">Project Description*</label>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">							
									<textarea name="project1Description" rows="2" cols="40" placeholder="Enter Project Description..."  maxlength="10000" required><% if(countUserDataInProjectExpTable !=0) { %> <%=project1Description%> <% } %></textarea>							
							</td>
						</tr>
						<!-- Close: Recent Project Details -->
						
						<!-- Another Project Details -->
						<tr> 
							<td colspan="2"> <p style="font-size: 18px; margin-bottom: 8px;">Another Project Details</p> </td> 
						</tr>
						<tr>
							<td colspan="2">
								<label for="First Name">Project Name *</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
	    						<input type="text" name="project2Name" placeholder="Enter Project Name.." <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project2Name %>" <% } %> maxlength="500" required> <br>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<label for="First Name">Project Duration (Start - Finish) *</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="Month" name="project2StartTime" <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project2StartTime %>" <% } %> title="Start Month & Year" required>
							</td>
							<td>
								<input type="Month" name="project2EndTime" <% if(countUserDataInProjectExpTable !=0) { %> value="<%= project2EndTime %>" <% } %> title="Finish Month & Year" required>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<label for="Last Name">Project Description*</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="project2Description" rows="2" cols="40" placeholder="Enter Project Description..."  maxlength="10000" required><% if(countUserDataInProjectExpTable !=0) { %> <%=project2Description%> <% } %></textarea>
							</td>
						</tr>
						<!-- Close: Another Project Details -->
						
						<tr>
							<%
							if(countUserDataInProjectExpTable != 0)
							{
							%>
							<td colspan="2"> <input type="submit" value="UPDATE PROJECT/EXP DETAILS"> </td>
							<%
							}
							else
							{
							%>
							<td colspan="2"> <input type="submit" value="INSERT PROJECT/EXP DETAILS"> </td>
							<%
							}
							%>
						</tr>
					
					</table>
				</form>
				<!-- Close: Update Project/Experience Detail Form -->
				
	
			</div>
			<!-- col-middle close -->
						
			<div class="col-right">
				
				<!-- col-right update skills form -->
				<h3>Update Skills </h3>
				<form action="UpdateUserSkillsAction.jsp" method="post">
					
					<table>
				<!-- Enter Professional Skills -->
						<tr> 
							<td colspan="2"> 
								<p style="font-size: 18px; margin-bottom: 8px;">Professional Skills</p> 
							</td> 
				
						<% 
						/* if BBA OR MBA */
						if(course.equalsIgnoreCase("BBA") || course.equalsIgnoreCase("MBA"))
						{
						%>
							
						<!-- Accounting and Marketing skills -->
							<tr>
								<td>Accounting*</td>
								<td>Marketing*</td>
							</tr>
							<tr>
								<td> <input type="number" name="accounting" value="<%= accounting %>" title="Enter value between 1 to 100"  placeholder="(%)" min="1" max="100" required> </td>
								<td> <input type="number" name="marketing" value="<%= marketing %>" title="Enter value between 1 to 100"  placeholder="(%)" min="1" max="100" required> </td>
							</tr>
	
							<!-- Excel and Management skills -->
							<tr>
								<td>Excel*</td>
								<td>Management*</td>
							</tr>
							<tr>
								<td> <input type="number" name="excel" value="<%= excel %>" placeholder="(%)"  title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="management" value="<%= management %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
	
							<!-- Tally and Analytics skills -->
							<tr>
								<td>Tally*</td>
								<td>Analytics*</td>
							</tr>
							<tr>
								<td> <input type="number" name="tally" value="<%= tally %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
								<td> <input type="number" name="analytics" value="<%= analytics %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>

						<%
						}
						/* Close: if BBA OR MBA */
						%>
				
				
						<% 
							/* if BCA OR MCA */
							if(course.equalsIgnoreCase("BCA") || course.equalsIgnoreCase("MCA"))
							{
						%>
							
							<!-- HTML and C skills -->
							<tr>
								<td>HTML*</td>
								<td>C*</td>
							</tr>
							<tr>
								<td> <input type="number" name="html" value="<%= html %>" placeholder="(%)"  title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="c" value="<%= c %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
	
							<!-- CSS and C++ skills -->
							<tr>
								<td>CSS*</td>
								<td>C++*</td>
							</tr>
							<tr>
								<td> <input type="number" name="css" value="<%= css %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
								<td> <input type="number" name="cpp" value="<%= cpp %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
	
							<!-- JavaScript and Java skills -->
							<tr>
								<td>JavaScript*</td>
								<td>Java*</td>
							</tr>
							<tr>
								<td> <input type="number" name="javaScript" value="<%= javaScript %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
								<td> <input type="number" name="java" value="<%= java %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
						<%
							}
							/* Close: if BCA OR MCA */
						%>
	
						<% 
							/* if BE OR ME */
							if(course.equalsIgnoreCase("BE") || course.equalsIgnoreCase("ME"))
							{
						%>
						
							<!-- HTML and C skills -->
							<tr>
								<td>HTML*</td>
								<td>Java*</td>
							</tr>
							<tr>
								<td> <input type="number" name="html" value="<%= html %>" placeholder="(%)"  title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="java" value="<%= java %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
	
							<!-- CSS and Python skills -->
							<tr>
								<td>CSS*</td>
								<td>Python*</td>
							</tr>
							<tr>
								<td> <input type="number" name="css" value="<%= css %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
								<td> <input type="number" name="python" value="<%= python %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>
	
							<!-- JavaScript and PHP skills -->
							<tr>
								<td>JavaScript*</td>
								<td>PHP*</td>
							</tr>
							<tr>
								<td> <input type="number" name="javaScript" value="<%= javaScript %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
								<td> <input type="number" name="php" value="<%= php %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							</tr>

						<%
						}
						/* Close: if BE OR ME */
						%>

					<!-- Adding Interpersonal Skills -->
						<tr> 
							<td colspan="2"> 
							<p style="font-size: 18px; margin: 6px 0px 8px;"> Interpersonal Skills</p> 
							</td>
						</tr>
						<!-- Sports and Photography skills -->
						<tr>
							<td>Communication*</td>
							<td>Problem Solving*</td>
						</tr>
						<tr>
							<td> <input type="number" name="communication" value="<%= communication %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							<td> <input type="number" name="problemSolving" value="<%= problemSolving %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
						</tr>

						<!-- Animation and Social Media skills -->
						<tr>
							<td>Teamwork*</td>
							<td>Time Management*</td>
						</tr>
						<tr>
							<td> <input type="number" name="teamwork" value="<%= teamwork %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							<td> <input type="number" name="timeManagement" value="<%= timeManagement %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
						</tr>

						<!-- Act and Art skills -->
						<tr>
							<td>Perseverance*</td>
							<td>Agility*</td>
						</tr>
						<tr>
							<td> <input type="number" name="perseverance" value="<%= perseverance %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
							<td> <input type="number" name="agility" value="<%= agility %>" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
						</tr>
				<!-- Close: Adding Interpersonal Skills -->

						<tr>
							<td colspan="2"> <input type="submit" value="UPDATE SKILLS DETAILS"> </td>
						</tr>

					</table>
				</form>
				<!-- col-right update skills form close-->
				
				<!-- col-right update Achievements form -->
				<hr>
				<br><br>
				<%
				if(countUserDataInAchivementsTable != 0)
				{
				%>
				<h3 id="UpdateAchievements">Update Achievements</h3>
				<form action="UpdateUserAchievementsAction.jsp" method="post">
				<%
				}
				else
				{
				%>
				<h3 id="InsertAchievements">Insert Achievements</h3>
				<form action="AddUserAchievementsAction.jsp" method="post">
				<%
				}%>
					<table>
						<tr>
							<td>
								<label for="Achivement No.1">Achievement No.1</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="achievement1" rows="2" cols="35" placeholder="Enter 1st Achievement..." maxlength="10000" required><% if(countUserDataInAchivementsTable != 0) { %> <%=achivement1%> <% } %></textarea> 
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="Achivement No.2">Achievement No.2</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="achievement2" rows="2" cols="35" placeholder="Enter 2nd Achievement..." maxlength="10000" required><% if(countUserDataInAchivementsTable != 0) { %> <%=achivement2%> <% } %></textarea> 
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="Achivement No.3">Achievement No.3</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="achievement3" rows="2" cols="35" placeholder="Enter 3rd Achievement..." maxlength="10000" required><% if(countUserDataInAchivementsTable != 0) { %> <%=achivement3%> <% } %></textarea> 
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="Achivement No.4">Achievement No.4</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="achievement4" rows="2" cols="35" placeholder="Enter 4th Achievement..." maxlength="10000" required><% if(countUserDataInAchivementsTable != 0) { %> <%=achivement4%> <% } %></textarea> 
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="Achivement No.5">Achievement No.5</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="achievement5" rows="2" cols="35" placeholder="Enter 5th Achievement..." maxlength="10000" required><% if(countUserDataInAchivementsTable != 0) { %> <%=achivement4%> <% } %></textarea> 
							</td>
						</tr>
						
						<tr>
							<%
							if(countUserDataInAchivementsTable != 0)
							{
							%>
							<td colspan="2"> <input type="submit" value="UPDATE ACHIEVEMENTS DETAILS"> </td>
							<%
							}
							else
							{
							%>
							<td colspan="2"> <input type="submit" value="INSERT ACHIEVEMENTS DETAILS"> </td>
							<%
							}
							%>
						</tr>
					</table>
				</form>
				
				<!-- col-right HireUp Image -->
				<div class="setting_logo_img">
					<img style="width:auto; height:230px" src="../../Images/KHubLogo.png" alt="KHubLogo.png" title="KHub">
				</div>
				<br><br>
				<!-- col-right change password form -->
				<h3>Change Password </h3>
				<form action="UpdateUserChangePasswordAction.jsp" method="post">
					
					<table>
						<tr>
							<td>Current Password*</td>
						</tr>

						<tr>
							<td><input type="password" name="old-password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter Current Password*" id="password" required></td>
						</tr>

						<tr>
							<td>New Password*</td>
						</tr>

						<tr>
							<td><input type="password" name="new-password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter New Password*" id="p1password" required></td>
						</tr>

						<tr>
							<td> <input type="checkbox" name="password-visibility"  style="margin: 0px;" onclick="login_showPassword(); signup_showPassword()"> Show Password</td>
						</tr>

						<tr>
							<td> <input type="submit" value="CHANGE PASSWORD"> </td>
						</tr>

					</table>
				</form>
				<!-- col-right change password form close -->

				<hr>
				
				<div class="col-right-del-account">
				
					<form action="UserError.jsp" method="post">

						<table>

							<tr>
								<td>
									<input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter Password*" required></td>
							</tr>

							<tr>
								<td>
									<input type="submit" value="Dlete Account (Inactive)">
								</td>
							</tr>

						</table>
					</form>
				</div>
				<!-- col-right-del-account close -->

			</div> <!-- col-right close -->

		</div>
		<!-- row close -->

	</div>
	<!-- user settings container close -->

<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->


</body>
<script src="../../JS/Login&Signup.js"> </script>
</html>