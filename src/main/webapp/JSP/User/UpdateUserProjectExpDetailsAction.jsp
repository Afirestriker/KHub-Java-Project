<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This page is used for Updating student_Project_Exp database table 
	This page is called from UserSettins.jsp page -> Update Project Experience Details Form Action
-->

<%

	try
	{
		
		/* Print message on console, indicating which page is visited */
		System.out.print("\n UpdateUserProjectExpDetailsAction.jsp page called \n");
		String username = session.getAttribute("username").toString();
	
		/* Get all Update Project Experience form parameter from UserSettings.jsp to update in khubv1.student_Project_Exp table */
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
			
			String updateProjectExpQuery =  "UPDATE student_Project_Exp "
										   +"SET " 
										   + "project1Name = ?, project1StartTime = ?, project1EndTime = ?, project1Description = ?, "
										   + "project2Name = ?, project2StartTime = ?, project2EndTime = ?, project2Description = ? "
	
										   +"WHERE stuemail = (SELECT email FROM login WHERE username = ?) ";
			
			PreparedStatement pst = con.prepareStatement(updateProjectExpQuery);
			pst.setString(1, project1Name);
			pst.setString(2, project1StartTime);
			pst.setString(3, project1EndTime);
			pst.setString(4, project1Description);
			
			pst.setString(5, project2Name);
			pst.setString(6, project2StartTime);
			pst.setString(7, project2EndTime);
			pst.setString(8, project2Description);
			
			pst.setString(9, username);
			
			/* status is used, to hold the return value of pst.executeUpdate()
			 * if status != 0, its mean , that at a row is affected i.e record updated
			 * if status == 0, its mean, that no row is affected i.e no record updated
			*/
			int status = pst.executeUpdate();
			
			if(status != 0)
			{
				response.sendRedirect("UserSettings.jsp?update=ProjectDetailsUpdated");
			}
			
			if(status == 0)
			{
				response.sendRedirect("UserSettings.jsp?update=notupdated");
			}
	
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n UpdateUserProjectExpDetailsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?update=exception");
	} /* catch block close */

%>
