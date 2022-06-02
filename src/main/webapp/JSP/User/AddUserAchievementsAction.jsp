<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!--
	This file is called from UserSettings.jsp page on "Insert Achievements Details" Button Click,
	
	This File represent the back-end process of inserting data into Student_Achievements table
	
	Here, the value parameter is collected from UserSettings.jsp page on Achivements Details Form submit for inserting data
	and this values are enter with current user email id into the khubv1.student_Achievements database table
	
	NOTE: At here, the session attribute username, which is set in UserLoginAction.jsp page is collected to validate user login
	
	NOTE: After the insertion of detail in khubv1.student_Achievements table,
		  Navigate back to UserSettings.jsp page with msg that "Achievements Data Inserted Successfully"
		  
 -->

<%
	try
	{
		/* Print message on console, indicating which page is visited */
		System.out.print("\n AddUserAchievementsAction.jsp page called \n");
		String username = session.getAttribute("username").toString();
		
		/* Get all form parameter from UserSettings.jsp to store in khubv1.student_Project_Exp table */
		String email = null;
		String achievement1 = request.getParameter("achievement1");
		String achievement2 = request.getParameter("achievement2");
		String achievement3 = request.getParameter("achievement3");
		String achievement4 = request.getParameter("achievement4");
		String achievement5 = request.getParameter("achievement5");
		
	
		/*
		System.out.print("\n" + username + "\n");
		System.out.print(achievement1 + "\n" + achievement2 + "\n" + achievement3 + "\n" + achievement4 + "\n" + achievement5 + "\n");
 		*/

 		
 		/*********************************************************************************** 
		 * Make DBMS connection,
		 * class DbConnection belongs to khubdb package 
		 * getConnection() is a static method of DbConnection which return connection object 
		 */
		Connection con = DbConnection.getConnection();
		
		/* Check If user data already exist
		 * if yes, then redirect to UserLoginAction.jsp
		 * if No, then insert details
		*/
		String checkDuplicateEntry = "SELECT COUNT(stuemail) FROM student_Achievements WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pstCheckDuplicate = con.prepareStatement(checkDuplicateEntry);
		pstCheckDuplicate.setString(1, username);
		ResultSet rs = pstCheckDuplicate.executeQuery();
		while(rs.next())
		{
			if(rs.getInt(1) != 0)
			{
				response.sendRedirect("UserSettings.jsp?msg=cantInsert");
			}
		}
		/* close while loop checking student records in khubv1.student_Project_Exp table */
		
		
		/* Fetched current user email from login table*/
		String fetchEmail = "SELECT email FROM login WHERE username = ?";
		PreparedStatement pstFetchEmail = con.prepareStatement(fetchEmail);
		pstFetchEmail.setString(1, username);
		ResultSet rsFetchEmail = pstFetchEmail.executeQuery();
		while(rsFetchEmail.next())
		{
			email = rsFetchEmail.getString("email");
		}
		/* Email Fetching Done */
		
		
		/* Write MySql query to insert values in student_Project_Exp table */
		String insertProjectExp = "INSERT INTO student_Achievements VALUES (?, ?, ?, ?, ?, ?)";

		/* Using PreparedStatement interface to update database table,
		 * since we are accepting value at run time
		*/
		PreparedStatement pstInsertData = con.prepareStatement(insertProjectExp);
		
		pstInsertData.setString(1, email);
		pstInsertData.setString(2, achievement1);
		pstInsertData.setString(3, achievement2);
		pstInsertData.setString(4, achievement3);
		pstInsertData.setString(5, achievement4);
		pstInsertData.setString(6, achievement5);
		
		int updateStatus = pstInsertData.executeUpdate();
		
		if(updateStatus != 0)
		{
			response.sendRedirect("UserSettings.jsp?update=AchievementsDetailsInserted");
		}
		
		if(updateStatus == 0)
		{
			response.sendRedirect("UserSettings.jsp?update=InsertError");
		}
		
	}
	catch(Exception e)
	{
		/* In Case if run-time exception is thrown 
		 * Then, counter comes inside catch block and display error on console
		 * And, redirect to UserSettings.jsp with messsage=exception
		 * Then, at UserSettings.jsp there's an condition which check if msg=exception 
		   and accordingly message is display on that page
		*/
		System.out.println("\n AddUserAchievementsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?msg=exception");
	}


%>