<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>


<!-- This is resume file, its shows Advanced resume Template-->
<% 
	/* Print on console, Indicating the page navigation */
	System.out.print("\n UserResume3.jsp Called \n");

	/* Fetching session attribute username, using which the records is fetch from khubdb database */
	String username = session.getAttribute("username").toString();
%>


<!-- Java coding for fetching all detail of current user to display them in Modern resume template as and when require  -->
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
	
/* close JSP Declaration tag */ %>
<!-- Close: Java coding for fetching all detail of current user to display them in Modern resume template as and when require  -->


<% /* Opne JSP scrriplet tag */

	/* Java Logic for making connection with JDBC - MySQL
	 * Fetching needed details from
	   1. Student Personal Detail Table
	   2. Student Academic Detail Table
	   3. Skills table
	   4. Achievements Table
	   5. If exist, then from Project Experience
	   
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
		   4. Achievement table
		 
		 * Check if student data exist in student_personal_detail
		 * if yes, check next if student data exist in student_academic_detail
		 * if yes, check next if student records exist in skills table
		 * if yes, check next if student records exist in Achivements table
		 * if yes in all four condition, then display UserResume2.jsp page
		 
		 * Also check, if user record exist in Project Experience Details,
		 	if so, then fetch and display that data as well.
		 
		 * If student data does not exist any of top 3 table,
		   then redirect UserLoginAction.jsp page,
		   As, this mean that student has not completed his/her login process/data entry.
		   
		   If student data does not exist in Achievements table
		   then redirect to UserSettings.jsp page
		   
		   If student Data does not exist in Project Experience Table
		    then, skip that part, since this is Modern resume template and for this Project Experiece Data is not necessary
		 */
		
	 	/* Check if student record exist in student_Personal_detail database table
		 * If no, then redirect to UserLoginAction.jsp
		 * If Yes, fetch details, and go to next
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
			else
			{
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
				/* SPD while loop close, operation close for fetching details of user from studetn_personal_detail database table */
			}
			/* else close */
		}
		/* checkDetailInPersonalDetailTable close */

		/* Check if student record exist in student_academic_detail database table
		 * If no, then redirect to UserLoginAction.jsp
		 * If Yes, then fetch details and go to next
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
			else
			{
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
				/* SAD while loop close, operation close for fetching details of user from student_academic_detail database table */
			}
			/* else close */
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
			else
			{
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
					
					/* 
					System.out.println("\n\n" + username + "\n" );
					System.out.println(accounting + " " + excel + " " + tally + " " + marketing + " " + management + " " + analytics + "\n" );
					System.out.println(html + " " + css + " " + javaScript + " " + c + " " + cpp + " " + java + " " + python + " " + php + "\n" );
					System.out.println( communication + " " + teamwork + " " + perseverance + " " + problemSolving + " " + timeManagement + " " + agility + "\n\n" );
					*/
				}
				/* Skills while loop close, operation close for fetching details of user from skills table */
			}
			/* if-else close */
		}
		/* closed, Check Skills table records exist for current user or not*/
		
		
		/* Check if student record exist in Achievement database table
		 * If no, then redirect to UserSettings.jsp page
		 * If Yes, then fetch details
		*/
		String checkAchievementDetails = "SELECT COUNT(stuemail) FROM Student_Achievements WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstCheckAchievementDetails = con.prepareStatement(checkAchievementDetails);
		pstCheckAchievementDetails.setString(1, username);
		ResultSet rsCheckAchievements = pstCheckAchievementDetails.executeQuery();
		while(rsCheckAchievements.next())
		{
			if(rsCheckAchievements.getInt(1) == 0)
			{
				response.sendRedirect("UserSettings.jsp");
			}
			else
			{
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
			/* if-else close */
		}
		/* closed, Check Achivements table records exist for current user or not*/
		
		
		/* Check if student record exist in Project_Exp database table
		 * If no, then redirect to UserSettings.jsp page
		 * If Yes, then update  countUserDataInProjectExpTable value to 1 and fetch details
		*/
		String checkProjectDetails = "SELECT COUNT(stuemail) FROM Student_Project_Exp WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstCheckProjectDetails = con.prepareStatement(checkProjectDetails);
		pstCheckProjectDetails.setString(1, username);
		ResultSet rsCheckProject = pstCheckProjectDetails.executeQuery();
		while(rsCheckProject.next())
		{
			if(rsCheckProject.getInt(1) == 0)
			{
				response.sendRedirect("UserSettings.jsp");
			}
			else
			{
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
			/* if-else close */
		}
		/* closed, Check Achivements table records exist for current user or not*/
		
		 
		} /* try block close */
		catch(Exception e)
		{
			System.out.println("\n UserResume3.jsp Exception: " + e);
		} /* catch block close */
		
/* Java coding Logic Ends Here */ %>
<!-- Now we have fetched all detail of user and has stored them in variable  -->


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title> <%= username %> Resume</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/User/UserResume3.css">
	
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

    <main class="main-content">
        <section class="left-section">
            <div class="left-content">
                <div class="profile">
                    <div class="image">
                        <a href="UserIndex.jsp"><img src="../../Images/KHubLogo.png" alt="KHubLogo" title="KHub"></a>
                    </div>
                    <h2 class="name"><%= firstname + " " + lastname %></h2>
                    <p class="career"><%= course %></p>
                </div>
                <div class="contact-info">
                    <h3 class="main-title">CONTACT INFO</h3>
                    <ul>
                        <li>
                            <i class="fa fa-birthday-cake"></i>
                            <%= birthdate %>
                        </li>
                        <li>
                            <i class="fa fa-phone"></i>
                            <%= mobile %>
                        </li>
                        <li>
                            <i class="fa fa-envelope"></i>
                            <%= stuemail %>
                        </li>
                        <li>
                            <i class="fa fa-map-marker"></i>
                            <%= address + ", " + city + ", " + state + ", " + country %>
                        </li>
                    </ul>
                </div>
                <div class="skills-section">
                    <h3 class="main-title"> Skill's </h3>
            <!-- Professional SKills -->
                    <h4 class="skill-type-title"> Professional Skills</h4>
                    <ul>
                <!-- if BBA or MBA -->
                <% 
				/* if BBA OR MBA */
				if(course.equalsIgnoreCase("BBA") || course.equalsIgnoreCase("MBA"))
				{
				%>
                        <li>
                            <p class="skill-title">Accounting</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=accounting%>%;" class="progress js-progress"><%=accounting%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Excel</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=excel%>%;" class="progress js-progress"><%=excel%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Tally</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=tally%>%;" class="progress js-progress"><%=tally%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Marketing</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=marketing%>%;" class="progress js-progress"><%=marketing%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Management</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=management%>%;" class="progress js-progress"><%=management%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Analytics</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=analytics%>%;" class="progress js-progress"><%=analytics%>%</div>
                            </div>
                        </li>
                <%
				}
				/* Close: if BBA OR MBA */
				%>
                <!-- Close: if BBA or MBA -->
                

				
                <!-- if BCA or MCA -->
                <% 
				/* if BCA OR MCA */
				if(course.equalsIgnoreCase("BCA") || course.equalsIgnoreCase("MCA"))
				{
				%>
                        <li>
                            <p class="skill-title">HTML</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=html%>%;" class="progress js-progress"><%=html%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">CSS</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=css%>%;" class="progress js-progress"><%=css%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">JavaScript</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=javaScript%>%;" class="progress js-progress"><%=javaScript%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">C</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=c%>%;" class="progress js-progress"><%=c%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">C++</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=cpp%>%;" class="progress js-progress"><%=cpp%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Java</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=java%>%;" class="progress js-progress"><%=java%>%</div>
                            </div>
                        </li>
                <%
				}
				/* Close: if BBA OR MBA */
				%>
                <!-- Close: if BCA or MCA -->

                <!-- if BE or ME -->
                <% 
				/* if BE OR ME */
				if(course.equalsIgnoreCase("BE") || course.equalsIgnoreCase("ME"))
				{
				%>
                        <li>
                            <p class="skill-title">HTML</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=html%>%;" class="progress js-progress"><%=html%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">CSS</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=css%>%;" class="progress js-progress"><%=css%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">JavaScript</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=javaScript%>%;" class="progress js-progress"><%=javaScript%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Java</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=java%>%;" class="progress js-progress"><%=java%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Python</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=python%>%;" class="progress js-progress"><%=python%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">PHP</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=php%>%;" class="progress js-progress"><%=php%>%</div>
                            </div>
                        </li>
                <%
				}
				/* Close: if BE OR ME */
				%>
                <!-- Close: if BE or ME -->
                    </ul>
            <!-- Professional SKills -->
                
            <!-- Interpersonal SKills -->
                    <h4 class="skill-type-title"> Interpersonal Skills</h4>
                    <ul>
                        <li>
                            <p class="skill-title">Communication</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=communication%>%;" class="progress js-progress"><%=communication%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Teamwork</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=teamwork%>%;" class="progress js-progress"><%=teamwork%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Perseverance</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=perseverance%>%;" class="progress js-progress"><%=perseverance%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Problem Solving</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=problemSolving%>%;" class="progress js-progress"><%=problemSolving%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Time Management</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=timeManagement%>%;" class="progress js-progress"><%=timeManagement%>%</div>
                            </div>
                        </li>
                        <li>
                            <p class="skill-title">Agility</p>
                        </li>
                        <li>
                            <div class="progress-bar">
                                <div style="width: <%=agility%>%;" class="progress js-progress"><%=agility%>%</div>
                            </div>
                        </li>
                    </ul>
            <!-- Interpersonal SKills -->
                </div>
            </div>
        </section>
        <section class="right-section">
            <div class="right-main-content">
                <section class="about sect">
                    <h2 class="right-title">About Me</h2>
                    <p class="para">
                        <%= aboutme %>
                    </p>
                </section>

                <section class="experince sect">
                    <h2 class="right-title">Project Exp</h2>
                    <div class="timeline">
                        <div class="left-tl-content">
                            <h5 class="tl-title"><%= project1Name %></h5>
                            <p class="para"><%= project1StartTime + "  To  " + project1EndTime %></p>
                        </div>
                        <div class="right-tl-content">
                            <div class="tl-content">
                                <h5 class="tl-title-2">Description</h5>
                                <p class="para">
                                    <%= project1Description %>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="timeline">
                        <div class="left-tl-content">
                            <h5 class="tl-title"><%= project2Name %></h5>
                            <p class="para"><%= project2StartTime + "  To  " + project2EndTime %></p>
                        </div>
                        <div class="right-tl-content">
                            <div class="tl-content">
                                <h5 class="tl-title-2">Description</h5>
                                <p class="para">
                                    <%= project2Description %>
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="education sect">
                    <h2 class="right-title">EDUCATION</h2>
                    <div class="timeline">
                        <div class="left-tl-content">
                            <h5 class="tl-title"> <%= collegeName %></h5>
                            <p class="para"><%= collegeUniversity %></p>
                        </div>
                        <div class="right-tl-content">
                            <div class="tl-content">
                                <h5 class="tl-title-2"><%= collegeStartPassYear %></h5>
                                <h5 class="course-grades"><%= course %></h5>
                                <h5 class="course-grades"><%= collegeAggregate %> Grade</h5>
                            </div>
                        </div>
                    </div>

                    <div class="timeline">
                        <div class="left-tl-content">
                            <h5 class="tl-title"> <%= collegeName12th %></h5>
                            <p class="para"><%= university12th %></p>
                        </div>
                        <div class="right-tl-content">
                            <div class="tl-content">
                                <h5 class="tl-title-2"><%= startPassYear12th %></h5>
                                <h5 class="course-grades">12th</h5>
                                <h5 class="course-grades"><%= grade12th %> Grades</h5>
                            </div>
                        </div>
                    </div>

                    <div class="timeline">
                        <div class="left-tl-content">
                            <h5 class="tl-title"> <%= schoolName10th %> </h5>
                            <p class="para"><%= university10th %></p>
                        </div>
                        <div class="right-tl-content">
                            <div class="tl-content">
                                <h5 class="tl-title-2"><%= startPassYear10th %></h5>
                                <h5 class="course-grades">10th</h5>
                                <h5 class="course-grades"><%= grade10th %> Grade</h5>
                            </div>
                        </div>
                    </div>
                    
                </section>
                <section class="awards sect">
                    <section class="about sect">
                    <h2 class="right-title">Achievements</h2>
                        <ul>
                            <li class="achievement-ul achievement-para para">
                                <%= achivement1 %>
                            </li>
                            <li class="achievement-ul achievement-para para">
                                <%= achivement2 %>
                            </li>
                            <li class="achievement-ul achievement-para para">
                                <%= achivement3 %>
                            </li>
                            <li class="achievement-ul achievement-para para">
                                <%= achivement4 %>
                            </li>
                            <li class="achievement-ul achievement-para para">
                                <%= achivement5 %>
                            </li>
                        </ul>
                    </section>
                </section>
            </div>
        </section>
    </main>

</body>
</html>