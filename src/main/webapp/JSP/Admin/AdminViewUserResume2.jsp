<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp" %>


<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" errorPage="AdminError.jsp" %>


<!-- This is resume file, its shows resume of the resume to the admin -->
<% 
	/* Print on console, Indicating the page navigation */
	System.out.print("\n Admin/AdminViewUserResume2.jsp Called \n");

	/* admin session, is set on admin login, it helps avoid wrong access to admin pages by other users */
	String admin = session.getAttribute("admin").toString();
	
	/* Fetching parameter stuemail, using which the records is fetch from khubv1 database */
	String stuemail = request.getParameter("stuEmail");
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
	
	/* check user data count in project_exp and Achivement table */
	int countUserDataInProjectExpTable = 0;

/* Note We are not taking Project Details at here  */

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


<!-- Now we have to fetched all detail of user and stored them in variable  -->
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
		
		/* fetching student recors from student_personal_detail table and display on the page */
		String fetchedSPD = "SELECT * FROM student_personal_detail WHERE stuemail = ?";
		PreparedStatement pstfetchSPD = con.prepareStatement(fetchedSPD);
		pstfetchSPD.setString(1, stuemail);
		ResultSet rsfetchSPD = pstfetchSPD.executeQuery();
		while(rsfetchSPD.next())
		{
			firstname = rsfetchSPD.getString("stufirstname");
			lastname = rsfetchSPD.getString("stulastname");
			birthdate = rsfetchSPD.getString("stubirthdate");
			age = rsfetchSPD.getInt("stuage");
			gender = rsfetchSPD.getString("stugender");
			mobile = rsfetchSPD.getString("stumobile");
			address = rsfetchSPD.getString("stuaddress");
			city = rsfetchSPD.getString("stucity");
			country = rsfetchSPD.getString("stucountry");
			aboutme = rsfetchSPD.getString("stuabout");
		
			/* System.out.print("\n" + stuemail + "\n" + firstname + "\n" + lastname + "\n" + birthdate + "\n" + age + "\n" + gender + "\n" + address + "\n" + city + "\n" + country + "\n" + aboutme + "\n"); */
		
		}
		/* operation close for fetching details of user from studetn_personal_detail database table */
		
		/* fetching student recors from student_academic_detail table and display on the page */
		String fetchedSAD = "SELECT * FROM student_academic_detail WHERE stuemail = ?";
		PreparedStatement pstfetchSAD = con.prepareStatement(fetchedSAD);
		pstfetchSAD.setString(1, stuemail);
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
			System.out.print("\n" + stuemail + "\n");
			System.out.print(collegeUniversity + "\n" + collegeName + "\n" + course + "\n" + collegeAggregate + "\n" + collegeStartPassYear +  "\n");
			System.out.print(university10th + "\n" + schoolName10th + "\n" + grade10th + "\n" + startPassYear10th +  "\n");
			System.out.print(university12th + "\n" + collegeName12th + "\n" + grade12th + "\n" + startPassYear12th +  "\n");
			*/
		
		}
		/* operation close for fetching details of user from student_academic_detail database table */
		
		
		/* fetching student recors from hireupv1.skills table and display on the page */
		String fetchSkills = "SELECT * FROM skills WHERE stuemail = ?";
		PreparedStatement pstSkills = con.prepareStatement(fetchSkills);
		pstSkills.setString(1, stuemail);
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
		
		/* fetching student record from khubv1.Student_Achievements table and display on the page */
		String fetchAchievements = "SELECT * FROM Student_Achievements WHERE stuemail = ?";
		PreparedStatement pstFetchedAchievements = con.prepareStatement(fetchAchievements);
		pstFetchedAchievements.setString(1, stuemail);
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
		
		
	/* NOTE: THIS IS RESUME-TEMPLATE-2 FOR ADMIN, here we are not facing and showing any details for PROJECT EXPERIENCE */
		
	} /* try block close */
	catch(Exception e)
	{
		System.out.println("\n Admin/AdminViewUserResume2.jsp Exception: " + e);
	} /* catch block close */
	

/* Java Logic Ends Here */ %>
<!-- Close: Now we have fetched all detail of user and has stored them in variable  -->


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> <%= firstname %> Resume</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/Admin/AdminViewUserResume2.css">
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

	<div class="resume">
       <div class="resume_left">
      
      <!-- Resume Profile Pic -->
         <div class="resume_profile">
           <a href="AdminIndex.jsp"><img src="../../Images/KHubLogo.png" alt="KHubLogo" title="KHub"></a>
         </div>
      
      <!-- Resume Personal Details -->
         <div class="resume_content">
           <div class="resume_item resume_info">
             <div class="title">
               <p class="bold"> <%= firstname + " " + lastname%></p>
               <p class="regular"><%= course %></p>
             </div>
             <ul>
               <li>
                 <div class="icon">
                   <i class="fas fa-birthday-cake"></i>
                 </div>
                 <div class="data">
                   <%= birthdate %>
                 </div>
               </li>

               <li>
                 <div class="icon">
                   <i class="fas fa-map-signs"></i>
                 </div>
                 <div class="data">
                   <%= address + ", <br>" + city + ", " + state + ", " + country %>
                 </div>
               </li>
               <li>
                 <div class="icon">
                   <i class="fas fa-mobile-alt"></i>
                 </div>
                 <div class="data">
                   <%= mobile %>
                 </div>
               </li>
               <li>
                 <div class="icon">
                   <i class="fas fa-envelope"></i>
                 </div>
                 <div class="data">
                   <%= stuemail %>
                 </div>
               </li>
             </ul>
           </div>
           
      <!-- Resume Skills Section  -->
      <!-- Skills for BBA & MBA -->
    	<% 
		/* if BBA OR MBA */
		if(course.equalsIgnoreCase("BBA") || course.equalsIgnoreCase("MBA"))
		{
		%>
           <div class="resume_item resume_skills">
             <div class="title">
               <p class="bold"> Professional Skill's</p>
             </div>
             <ul>
               <li>
                 <div class="skill_name">
                   Accounting
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width:<%=accounting%>%;"></span>
                 </div>
                 <div class="skill_per"><%= accounting %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Excel
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= excel %>%;"></span>
                 </div>
                 <div class="skill_per"><%= excel %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Tally
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= tally %>%;"></span>
                 </div>
                 <div class="skill_per"><%= tally %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Marketing
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= marketing %>%;"></span>
                 </div>
                 <div class="skill_per"><%= marketing %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Management
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= management %>%;"></span>
                 </div>
                 <div class="skill_per"><%= management %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Analytics
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= analytics %>%;"></span>
                 </div>
                 <div class="skill_per"><%= analytics %>%</div>
               </li>
             </ul>
           </div>
      <!-- Close: Skills for BBA & MBA -->
      	<%
		}
		/* Close: if BBA OR MBA */
		%>

      <!-- Skills for BCA & MCA -->
      	<% 
		/* if BCA OR MCA */
		if(course.equalsIgnoreCase("BCA") || course.equalsIgnoreCase("MCA"))
		{
		%>
           <div class="resume_item resume_skills">
             <div class="title">
               <p class="bold"> Professional Skill's</p>
             </div>
             <ul>
               <li>
                 <div class="skill_name">
                   HTML
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= html %>%;"></span>
                 </div>
                 <div class="skill_per"><%= html %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   CSS
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= css %>%;"></span>
                 </div>
                 <div class="skill_per"><%= css %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   JavaScript
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= javaScript %>%;"></span>
                 </div>
                 <div class="skill_per"><%= javaScript %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   C
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= c %>%;"></span>
                 </div>
                 <div class="skill_per"><%= c %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   C++
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= cpp %>%;"></span>
                 </div>
                 <div class="skill_per"><%= cpp %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Java
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= java %>%;"></span>
                 </div>
                 <div class="skill_per"><%= java %>%</div>
               </li>
             </ul>
           </div>
      <!-- Close: Skills for BCA & MCA -->
        <%
		}
		/* Close: if BCA OR MCA */
		%>   
           
      <!-- Skills for BE & ME -->
      	<% 
		/* if BE OR ME */
		if(course.equalsIgnoreCase("BE") || course.equalsIgnoreCase("ME"))
		{
		%>
           <div class="resume_item resume_skills">
             <div class="title">
               <p class="bold"> Professional Skill's</p>
             </div>
             <ul>
               <li>
                 <div class="skill_name">
                   HTML
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= html %>%;"></span>
                 </div>
                 <div class="skill_per"><%= html %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   CSS
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= css %>%;"></span>
                 </div>
                 <div class="skill_per"><%= css %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   JavaScript
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= javaScript %>%;"></span>
                 </div>
                 <div class="skill_per"><%= javaScript %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Java
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= java %>%;"></span>
                 </div>
                 <div class="skill_per"><%= java %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Python
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= python %>%;"></span>
                 </div>
                 <div class="skill_per"><%= python %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   PHP
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= php %>%;"></span>
                 </div>
                 <div class="skill_per"><%= php %>%</div>
               </li>
             </ul>
           </div>
      <!-- Close: Skills for BE & ME -->
		<%
		}
		/* Close: if BE OR ME */
		%>

      <!-- Skills for Interpersonal Skills -->
           <div class="resume_item resume_skills">
             <div class="title">
               <p class="bold"> Interpersonal Skill's</p>
             </div>
             <ul>
               <li>
                 <div class="skill_name">
                   Communication
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= communication %>%;"></span>
                 </div>
                 <div class="skill_per"><%= communication %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   TeamWork
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= teamwork %>%;"></span>
                 </div>
                 <div class="skill_per"><%= teamwork %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Perseverance
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= perseverance %>%;"></span>
                 </div>
                 <div class="skill_per"><%= perseverance %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Problem Solving
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= problemSolving %>%;"></span>
                 </div>
                 <div class="skill_per"><%= problemSolving %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Time Management
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= timeManagement %>%;"></span>
                 </div>
                 <div class="skill_per"><%= timeManagement %>%</div>
               </li>
               <li>
                 <div class="skill_name">
                   Agility
                 </div>
               </li>
               <li>
                 <div class="skill_progress">
                   <span style="width: <%= agility %>%;"></span>
                 </div>
                 <div class="skill_per"><%= agility %>%</div>
               </li>
             </ul>
           </div>
      <!-- Close: Interpersonal Skills -->

         </div>
      </div>

    <!-- Resume Right Section -->
      <div class="resume_right">
        <div class="resume_item resume_about">
            <div class="title">
               <p class="bold">About Me</p>
             </div>
            <p><%= aboutme %></p>
        </div>
      
    <!-- Projects Work Experience Details -->  
        <%
		if(countUserDataInProjectExpTable != 0)
		{
		%>
        <div class="resume_item resume_work">
            <div class="title">
               <p class="bold">Project Experience</p>
             </div>
            <ul>
                <li>
                    <div class="date"><%= project1StartTime + " - " + project1EndTime %></div> 
                    <div class="info">
                        <p class="semi-bold"><%= project1Name %></p> 
                        <p><%= project1Description %></p>
                    </div>
                </li>
                <li>
                  <div class="date"><%= project2StartTime + " - " + project2EndTime %></div>
                  <div class="info">
                         <p class="semi-bold"><%= project2Name %></p> 
                      <p><%= project2Description %></p>
                    </div>
                </li>
            </ul>
        </div>
        <%
		}
		%>
        
    <!-- Education Details -->
        <div class="resume_item resume_education">
          <div class="title">
               <p class="bold">Education</p>
             </div>
            <ul>
                <li>
                    <div class="date"><%= collegeStartPassYear %></div> 
                    <div class="info">
                         <p class="semi-bold"><%= course %></p> 
                         <p class="semi-bold"><%= collegeUniversity %></p> 
                         <p class="semi-bold"><%= collegeName %></p> 
                         <p class="semi-bold"><%= collegeAggregate %> - Grade</p>
                    </div>
                </li>
                <li>
                  <div class="date"><%= startPassYear12th %></div>
                  <div class="info">
                  		<p class="semi-bold">12th</p> 
                        <p class="semi-bold"><%= university12th %></p> 
                         <p class="semi-bold"><%= collegeName12th %></p> 
                         <p class="semi-bold"><%= grade12th %> - Grade</p>
                    </div>
                </li>
                <li>
                  <div class="date"><%= startPassYear10th %></div>
                  <div class="info">
                  		<p class="semi-bold">10th</p>
                        <p class="semi-bold"> <%= university10th %> </p> 
                         <p class="semi-bold"> <%= schoolName10th %> </p> 
                         <p class="semi-bold"><%= grade10th %> - Grade</p>
                    </div>
                </li>
            </ul>
        </div>
    
    <!-- Achievements Details -->
        <div class="resume_item resume_education">
          <div class="title">
               <p class="bold">Achievements</p>
          </div>
           <ul>
              <li>
                  <div class="info">
                       <p class="semi-bold"> <%= achivement1 %></p>
                  </div>
              </li>
              <li>
                  <div class="info">
                       <p class="semi-bold"> <%= achivement2 %></p>
                  </div>
              </li>
              <li>
                  <div class="info">
                       <p class="semi-bold"> <%= achivement3 %></p>
                  </div>
              </li>
              <li>
                  <div class="info">
                       <p class="semi-bold"> <%= achivement4 %></p>
                  </div>
              </li>
              <li>
                  <div class="info">
                       <p class="semi-bold"> <%= achivement5 %></p>
                  </div>
              </li>
            </ul>
        </div>
      </div>
    </div>

</body>
</html>