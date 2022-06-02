<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>


<!-- This is resume file, its shows resume -->
<% 
	/* Print on console, Indicating the page navigation */
	System.out.print("\n UserResume.jsp Called \n");

	/* Fetching session attribute username, using which the records is fetch from khubdb database */
	String username = session.getAttribute("username").toString();
%>

<!-- Java coding for fetching all detail of current user to display them in resume template as and when require  -->
<%!
	/* This is declaration JSP tag for declaring variables what will be access in whole page
	   i.e ouside service() method and are same as class variable
	*/
	
	/* Declared variable to store student_personal_detail */
	String stuemail = null;
	String firstname = null;
	String lastname = null;
	String birthdate = null;
	int age;
	String mobile = null;
	String gender = null;
	String address = null;
	String city = null;
	String state = null;
	String country = null;
	String aboutme = null;
	
	/* Declared variable to store student_academic_detail */
	String collegeUniversity = null;
	String collegeName = null;
	String course = null;
	String collegeAggregate = null;
	String collegeStartPassYear = null;
	
	String university12th = null;
	String collegeName12th = null;
	String grade12th = null;
	String startPassYear12th = null;
	
	String university10th = null;
	String schoolName10th = null;
	String grade10th = null;
	String startPassYear10th = null;
	
	
	/* Declare variable for storing skills detail */
	/* variable for storing professioal skills */
	int accounting=0, excel=0, tally=0, marketing=0, management=0, analytics=0;
	int html=0, css=0, javaScript=0, c=0, cpp=0, java=0, python=0, php=0;
	/* variable for storing interpersonal skills */
	int communication=0, teamwork=0, perseverance=0, problemSolving=0, timeManagement=0, agility=0;
	
/* close JSP Declaration tag */ %>


<% /* Opne JSP scrriplet tag */

	/* Java Logic for making connection with JDBC - MySQL
	 * Fetching needed details from
	   1. Student Personal Detail Table
	   2. Student Academic Detail Table
	   3. Skills table
	   
	 * Store this values in global varialbe declared inside 'declaration JSP tag'
	 * And display details fetched from database for particualr user in Resume Page
	*/
	
	try{	
		/* 
		* Make DBMS connection,
		* class DbConnection belongs to khubdb package 
		* getConnection() is a static method of DbConnection which return connection object 
		*/
		Connection con = DbConnection.getConnection();
		
		/* Validating User Details,
		 * Checking if current user record, exist in all three table of khubv1 database
		   1. student_personal_detail
		   2. student_academic_detail
		   3. skills
		 
		 * Check if student data exist in student_personal_detail
		 * if yes, check next if student data exist in student_academic_detail
		 * if yes, check next if student records exist in skills table
		 * if yes in all three condition, then display UserSettings.jsp page content
		 
		 * If student data does not exist any of this table,
		   then redirect UserLoginAction.jsp page,
		   As, this mean that student has not completed his/her login process/data entry.
		 */
		 
		String checkDetailInPersonalDetailTable = "SELECT COUNT(stuemail) FROM student_personal_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstCheckPersonalDetail = con.prepareStatement(checkDetailInPersonalDetailTable);
		pstCheckPersonalDetail.setString(1, username);
		ResultSet rsSPD = pstCheckPersonalDetail.executeQuery();
		while(rsSPD.next())
		{
			if(rsSPD.getInt(1) == 0)
			{
				response.sendRedirect("UserLoginAction.jsp");
			}
		}
		/* checkDetailInPersonalDetailTable close */

		/* Check if student record exist in student_academic_detail database table
		 * If no, then redirect to UserLoginAction.jsp
		 * If Yes, then go to next
		*/
		String checkDetailInAcademicDetailTable = "SELECT COUNT(stuemail) FROM student_academic_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstCheckAcademicDetail = con.prepareStatement(checkDetailInAcademicDetailTable);
		pstCheckAcademicDetail.setString(1, username);
		ResultSet rsSAD = pstCheckAcademicDetail.executeQuery();
		while(rsSAD.next())
		{
			if(rsSAD.getInt(1) == 0)
			{
				response.sendRedirect("UserLoginAction.jsp");
			}
		}
		/* checkDetailInAcademicDetailTable close */
		
		
		/* Check Skills table if records exist for current user or not */
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
		PreparedStatement pstfetchSPD = con.prepareStatement(fetchedSPD);
		pstfetchSPD.setString(1, username);
		ResultSet rsfetchSPD = pstfetchSPD.executeQuery();
		while(rsfetchSPD.next())
		{
			stuemail = rsfetchSPD.getString("stuemail");
			firstname = rsfetchSPD.getString("stufirstname");
			lastname = rsfetchSPD.getString("stulastname");
			birthdate = rsfetchSPD.getString("stubirthdate");
			age = rsfetchSPD.getInt("stuage");
			gender = rsfetchSPD.getString("stugender");
			mobile = rsfetchSPD.getString("stumobile");
			address = rsfetchSPD.getString("stuaddress");
			city = rsfetchSPD.getString("stucity");
			state = rsfetchSPD.getString("stuState");
			country = rsfetchSPD.getString("stucountry");
			aboutme = rsfetchSPD.getString("stuabout");
		
			/* System.out.print("\n" + email + "\n" + firstname + "\n" + lastname + "\n" + birthdate + "\n" + age + "\n" + gender + "\n" + address + "\n" + city + "\n" + country + "\n" + aboutme + "\n"); */
		
		}
		/* operation close for fetching details of user from studetn_personal_detail database table */
		
		/* fetching student recors from student_academic_detail table and display on the page */
		String fetchedSAD = "SELECT * FROM student_academic_detail WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstfetchSAD = con.prepareStatement(fetchedSAD);
		pstfetchSAD.setString(1, username);
		ResultSet rsfetchSAD = pstfetchSAD.executeQuery();
		while(rsfetchSAD.next())
		{
			collegeUniversity = rsfetchSAD.getString("college_university_name");
			collegeName = rsfetchSAD.getString("college_name");
			course = rsfetchSAD.getString("stucourse");
			collegeAggregate = rsfetchSAD.getString("college_aggregate");
			collegeStartPassYear = rsfetchSAD.getString("college_start_pass_year");
			
			university10th = rsfetchSAD.getString("10th_university_name");
			schoolName10th = rsfetchSAD.getString("10th_school_name");
			grade10th = rsfetchSAD.getString("10th_grade");
			startPassYear10th = rsfetchSAD.getString("10th_start_pass_year");
			
			university12th = rsfetchSAD.getString("12th_university_name");
			collegeName12th = rsfetchSAD.getString("12th_college_name");
			grade12th = rsfetchSAD.getString("12th_grade");
			startPassYear12th = rsfetchSAD.getString("12th_start_pass_year");
			
			
			/* 
			System.out.print("\n" + username + " " + email + "\n");
			System.out.print(collegeUniversity + "\n" + collegeName + "\n" + course + "\n" + collegeAggregate + "\n" + collegeStartPassYear +  "\n");
			System.out.print(university10th + "\n" + schoolName10th + "\n" + grade10th + "\n" + startPassYear10th +  "\n");
			System.out.print(university12th + "\n" + collegeName12th + "\n" + grade12th + "\n" + startPassYear12th +  "\n");
			*/
		
		}
		/* operation close for fetching details of user from student_academic_detail database table */
		
		
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
		
	} /* try block close */
	catch(Exception e)
	{
		System.out.println("\n UserResume.jsp Exception: " + e);
	} /* catch block close */


/* Java coding Logic Ends Here */ %>
<!-- Now we have fetched all detail of user and has stored them in variable  -->


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title> <%= username %> Resume</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/User/UserResume.css">
</head>

<body>

<!-- Menu Section -->
<%-- 	<%@include file="UserHeader.jsp" %> --%>	
<!-- End of Menu  Section -->


	<div class="UserResume-container">

		<div class="resume-design">
			
			<div class="resume-header">
				
				<a href="UserIndex.jsp" ><img height="200px" src="../../Images/KHubLogo.png"></a>

				<div class="text-content">
					<p class="user-name"> <%= firstname + " " + lastname %> </p>
					<p class="user-profession"> <%= course %> </p>

					<a href="#"><button onclick="window.print()">Download CV</button></a>
				</div>
				<!-- text-content -->

			</div>
			<!-- resume-header close -->

			<!-- Resume About section -->
			<div class="resume-about">
				
				<h3 class="resume-sec-title">About Me</h3>

				<div class="personal-info">
					<p>
						<%= aboutme %>
					</p>				
					
					<table>
						<tr>
							<th>Age</th>
							<td> <%= age %> </td>
						</tr>

						<tr>
							<th>Email</th>
							<td> <%= stuemail %> </td>
						</tr>

						<tr>
							<th>Phone</th>
							<td> <%= mobile %> </td>
						</tr>

						<tr>
							<th>Address</th>
							<td> <%= address + ",<br>" + city + ", " + state + ", " + country %> </td>
						</tr>
					</table>

				</div>
				<!-- personal-info close -->
			</div>
			<!-- resume-about close -->
	
			<!-- Resume Education Details -->
			<div class="resume-education">
				
				<h3 class="resume-sec-title">Education</h3>

				<div class="edu-details">
					
					<p class="edu-university"> <%= collegeUniversity %> </p>

					<div class="edu-degree-details">
						<p class="edu-degree-name"> <%= collegeName %> </p>
						<p class="edu-degree-grade"> Grade: '<%= collegeAggregate %>'</p>
						<p class="edu-start-pass-year"> <%= collegeStartPassYear %> </p>
					</div>

					<p class="edu-university"> <%= university12th %> </p>

					<div class="edu-degree-details">
						<p class="edu-degree-name"> <%= collegeName12th %> </p>
						<p class="edu-degree-grade"> Grade: '<%= grade12th %>'</p>
						<p class="edu-start-pass-year"> <%= startPassYear12th %> </p>
					</div>

					<p class="edu-university"> <%= university10th %> </p>

					<div class="edu-degree-details">
						<p class="edu-degree-name"> <%= schoolName10th %> </p>
						<p class="edu-degree-grade"> Grade: '<%= grade10th %>'</p>
						<p class="edu-start-pass-year"> <%= startPassYear10th %> </p>
					</div>

				</div>
				<!-- edu-details close -->

			</div>
			<!-- resume-education close -->

			<!-- Resume Profession Skills -->
			<div class="resume-professional-skills">
				<h3 class="resume-sec-title">Professional Skills</h3>

				<table>
					<% 
					/* if BBA OR MBA */
					if(course.equalsIgnoreCase("BBA") || course.equalsIgnoreCase("MBA"))
					{
					%>
						<tr>
							<td>Accounting</td>
							<td>Marketing</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= accounting %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= marketing %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>Excel</td>
							<td>Management</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= excel %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= management %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>Tally</td>
							<td>Analytics</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= tally %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= analytics %>%;"></div> </div> </td>
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
						<tr>
							<td>HTML</td>
							<td>C</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= html  %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= c %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>CSS</td>
							<td>C++</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= css %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= cpp %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>JavaScript</td>
							<td>Java</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= javaScript %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= java %>%;"></div> </div> </td>
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
						<tr>
							<td>HTML</td>
							<td>Java</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= html  %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= java %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>CSS</td>
							<td>Python</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= css %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= python %>%;"></div> </div> </td>
						</tr>
	
						<tr>
							<td>JavaScript</td>
							<td>PHP</td>
						</tr>
	
						<tr>
							<td> <div class="bar"> <div class="green" style="background-color: #6c9dd4; width: <%= javaScript %>%;"></div> </div> </td>
							<td> <div class="bar"> <div class="green" style="width: <%= php %>%;"></div> </div> </td>
						</tr>
					<%
					}
					/* Close: if BE OR ME */
					%>
					
				</table>

			</div>
			<!-- resume-professional-skills close -->
			

			<!-- Resume Interpersonal Skills -->
			<div class="resume-extra-activity">
				<h3 class="resume-sec-title">Interpersonal Skills</h3>

				<table>
					<tr>
						<td>Communication</td>
						<td>Problem Solving</td>
					</tr>

					<tr>
						<td> <div class="bar"> <div class="green" style="background-color: #eba236; width: <%= communication %>%;"></div> </div> </td>
						<td> <div class="bar"> <div class="green" style="background-color: #2dbfc4; width: <%= problemSolving %>%;"></div> </div> </td>
					</tr>

					<tr>
						<td>Teamwork</td>
						<td>Time Management</td>
					</tr>

					<tr>
						<td> <div class="bar"> <div class="green" style="background-color: #eba236; width: <%= teamwork %>%;"></div> </div> </td>
						<td> <div class="bar"> <div class="green" style="background-color: #2dbfc4; width: <%= timeManagement %>%;"></div> </div> </td>
					</tr>

					<tr>
						<td>Perseverance</td>
						<td>Agility </td>
					</tr>

					<tr>
						<td> <div class="bar"> <div class="green" style="background-color: #eba236; width: <%= perseverance %>%;"></div> </div> </td>
						<td> <div class="bar"> <div class="green" style="background-color: #2dbfc4; width: <%= agility %>%;"></div> </div> </td>
					</tr>
				</table>

			</div>
			<!-- close: Resume Interpersonal Skills -->

		</div>
		<!-- resume-design close -->


	</div>
	<!-- UserResume-container close -->

<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->


</body>
</html>