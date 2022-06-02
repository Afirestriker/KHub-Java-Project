<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>


<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This page is used for Updating student_Achievements database table 
	This page is called from UserSettins.jsp page -> Update Achievements Details Form Action
-->

<%
	try
	{
		
		/* Print message on console, indicating which page is visited */
		System.out.print("\n UpdateUserAchievementsAction.jsp page called \n");
		String username = session.getAttribute("username").toString();
	
		/* Get all Update Achievements Details form parameter from UserSettings.jsp to update in khubv1.student_Achievements table */
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
			
			String updateProjectExpQuery =   "UPDATE student_Achievements "
										   + "SET " 
										   + "Achievement1 = ?, Achievement2 = ?, Achievement3 = ?, Achievement4 = ?, Achievement5 = ? "
	
										   + "WHERE stuemail = (SELECT email FROM login WHERE username = ?) ";
			
			PreparedStatement pst = con.prepareStatement(updateProjectExpQuery);
			pst.setString(1, achievement1);
			pst.setString(2, achievement2);
			pst.setString(3, achievement3);
			pst.setString(4, achievement4);
			pst.setString(5, achievement5);
			
			pst.setString(6, username);
			
			/* status is used, to hold the return value of pst.executeUpdate()
			 * if status != 0, its mean , that at a row is affected i.e record updated
			 * if status == 0, its mean, that no row is affected i.e no record updated
			*/
			int status = pst.executeUpdate();
			
			if(status != 0)
			{
				response.sendRedirect("UserSettings.jsp?update=AchievementsDetailsUpdated");
			}
			
			if(status == 0)
			{
				response.sendRedirect("UserSettings.jsp?update=notupdated");
			}
	
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n UpdateUserAchievementsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?update=exception");
	} /* catch block close */

%>
