<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp"%>


<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" errorPage="AdminError.jsp" %>


<!-- This file is called from AdminViewUserRecords.jsp file, when user click on "View" clickable text
 
	This is view resume action file, its shows resume of the student to the admin 

	Here, we have a helping variable that's stores the count of table in which student records are present
	i.e. From 
		 1. Personal Details
		 2. Academic Details
		 3. Skills Details
		 4. Avhievements Detail
		 5. Project Experience Details
		 
		 If count is 3 then show Resume-Template-1
		 If count is 4 then show resume-Template-2
		 If count is 5 then show resume-Template-3
		 
		 else
		 Go back to previous page with an message that "User Hasn't Completely Filled His/Her Basic Details"
-->
<% 
	/* Print on console, Indicating the page navigation */
	System.out.print("\n Admin/AdminViewUserResumeAction.jsp Called \n");

	/* admin session, is set on admin login, it helps avoid wrong access to admin pages by other users */
	String admin = session.getAttribute("admin").toString();
	
	/* Fetching parameter stuemail, using which the records is fetch from khubv1 database */
	String stuemail = request.getParameter("stuEmail");
%>


<% /* Opne JSP scriplet tag */

	int recordCount = 0;

	try{	
		/* 
		* Make DBMS connection,
		* class DbConnection belongs to khubdb package 
		* getConnection() is a static method of DbConnection which return connection object 
		*/
		Connection con = DbConnection.getConnection();
		
		
		/* check current user records with email in student personal detail table 
		 * if exist, means control will go inside while loop, so update recordCount by 1
		*/
		String check_spd = "SELECT COUNT(*) FROM student_personal_detail WHERE StuEmail = ?";
		PreparedStatement pst1 = con.prepareStatement(check_spd);
		pst1.setString(1, stuemail);
		ResultSet rs1 = pst1.executeQuery();
		while(rs1.next())
		{
			if(rs1.getInt(1) != 0)
			{
				/* recordCount become 1 here */
				recordCount += 1;	
			}
		}
		
		
		/* check records in student academic detail table */
		String check_sad = "SELECT COUNT(*) FROM student_academic_detail WHERE StuEmail = ?";
		PreparedStatement pst2 = con.prepareStatement(check_sad);
		pst2.setString(1, stuemail);
		ResultSet rs2 = pst2.executeQuery();
		while(rs2.next())
		{
			if(rs2.getInt(1) != 0)
			{
				/* recordCount become 2 here */
				recordCount += 1;	
			}
		}
		
		/* Check Skills table records exist for current user or not */
		String checkSkillsDetails = "SELECT COUNT(stuemail) FROM skills WHERE stuemail = ?";
		PreparedStatement pstCheckSkillsDetails = con.prepareStatement(checkSkillsDetails);
		pstCheckSkillsDetails.setString(1, stuemail);
		ResultSet rsCheckSkills = pstCheckSkillsDetails.executeQuery();
		while(rsCheckSkills.next())
		{
			if(rsCheckSkills.getInt(1) != 0)
			{
				/* recordCount become 3 here */
				recordCount += 1;	
			}	
		}
		
	/* If user record count is not euqual to three at this point, then redirect back to AdminViewUserRecords */	
		if(recordCount != 3)
		{
			response.sendRedirect("AdminViewUserRecords.jsp?msg=unSufficientRecord");
		}
		
	
		/* Check if student record exist in Achievement database table */
		String checkAchievementDetails = "SELECT COUNT(stuemail) FROM Student_Achievements WHERE stuemail = ?";
		PreparedStatement pstCheckAchievementDetails = con.prepareStatement(checkAchievementDetails);
		pstCheckAchievementDetails.setString(1, stuemail);
		ResultSet rsCheckAchievements = pstCheckAchievementDetails.executeQuery();
		while(rsCheckAchievements.next())
		{
			if(rsCheckAchievements.getInt(1) != 0)
			{
				/* recordCount become 4 here */
				recordCount += 1;	
			}
		}
		
		
		/* Check if student record exist in Project_Exp database table */
		String checkProjectDetails = "SELECT COUNT(stuemail) FROM Student_Project_Exp WHERE stuemail = ?";
		PreparedStatement pstCheckProjectDetails = con.prepareStatement(checkProjectDetails);
		pstCheckProjectDetails.setString(1, stuemail);
		ResultSet rsCheckProject = pstCheckProjectDetails.executeQuery();
		while(rsCheckProject.next())
		{
			if(rsCheckProject.getInt(1) != 0)
			{
				/* recordCount become 5 here */
				recordCount += 1;	
			}
		}
		
		/* Record Counting Process Finish Here, Now we check if how many tables student records is entered
		 * if value is 3, then show Resume-Template-1
		 * if value is 4, then show Resume-Template-2
		 * if value is 5, then show Resume-Template-3
		*/	
		if(recordCount == 3)
		{
			response.sendRedirect("AdminViewUserResume.jsp?stuEmail="+stuemail);
		}
		else if(recordCount == 4)
		{
			response.sendRedirect("AdminViewUserResume2.jsp?stuEmail="+stuemail);
		}
		else if(recordCount == 5)
		{
			response.sendRedirect("AdminViewUserResume3.jsp?stuEmail="+stuemail);
		}
		
		
	} /* try block close */
	catch(Exception e)
	{
		System.out.println("\n Admin/AdminViewUserResume.jsp Exception: " + e);
		response.sendRedirect("AdminViewUserRecords.jsp?msg=exception");
	} /* catch block close */


/* Java Logic Ends Here */ %>
<!-- Now we have fetched all detail of user and has stored them in variable  -->

