<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>
    
<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!--
	This file is called from UserSettings.jsp page on "Insert Project/Exp Details" Button Click,
	
	This File represent the back-end process of inserting data into Student_Project_Exp table
	
	Here, the value parameter is collected from UserSettings.jsp page on Project Exp Form submit for inserting data
	and this values are enter with current user email id into the khubv1.student_project_exp database table
	
	NOTE: At here, the session attribute username, which is set in UserLoginAction.jsp page is collected to validate user login
	
	NOTE: After the insertion of detail in khubv1.student_Project_Exp table,
		  Navigate back to UserSettings.jsp page with msg that "Project Data Inserted Successfully"
		  
 -->

<%
	try
	{
		/* Print message on console, indicating which page is visited */
		System.out.print("\n AddUserProjectExpDetailsAction.jsp page called \n");
		String username = session.getAttribute("username").toString();
		
		/* Get all form parameter from UserSettings.jsp to store in khubv1.student_Project_Exp table */
		String email = null;
		String project1Name = request.getParameter("project1Name");
		String project1StartTime = request.getParameter("project1StartTime");
		String project1EndTime = request.getParameter("project1EndTime");
		String project1Description = request.getParameter("project1Description");
		
		String project2Name = request.getParameter("project2Name");
		String project2StartTime = request.getParameter("project2StartTime");
		String project2EndTime = request.getParameter("project2EndTime");
		String project2Description = request.getParameter("project2Description");
		
		/*   
		System.out.print("\n" + username + "\n");
		System.out.print(project1Name + "\n" + project1StartTime + "\n" + project1EndTime + "\n" + project1Description + "\n");
		System.out.print(project2Name + "\n" + project2StartTime + "\n" + project2EndTime + "\n" + project2Description + "\n");
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
		String checkDuplicateEntry = "SELECT COUNT(stuemail) FROM student_Project_Exp WHERE stuemail = (SELECT email FROM login WHERE username = ?)";
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
		String insertProjectExp = "INSERT INTO student_Project_Exp VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		/* Using PreparedStatement interface to update database table,
		 * since we are accepting value at run time
		*/
		PreparedStatement pstInsertData = con.prepareStatement(insertProjectExp);
		
		pstInsertData.setString(1, email);
		pstInsertData.setString(2, project1Name);
		pstInsertData.setString(3, project1StartTime);
		pstInsertData.setString(4, project1EndTime);
		pstInsertData.setString(5, project1Description);
		
		pstInsertData.setString(6, project2Name);
		pstInsertData.setString(7, project2StartTime);
		pstInsertData.setString(8, project2EndTime);
		pstInsertData.setString(9, project2Description);
		
		int updateStatus = pstInsertData.executeUpdate();
		
		if(updateStatus != 0)
		{
			response.sendRedirect("UserSettings.jsp?update=ProjectDetailsInserted");
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
		System.out.println("\n AddUserProjectExpDetailsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?msg=exception");
	}


%>
    