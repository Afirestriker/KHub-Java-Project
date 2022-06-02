<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This page is used for Updating student_academic_detail database table 
	This page is called from UserSettins.jsp page -> Update Academic Details Form Action
-->

<%

	/* Print message on console, indicating which page is visited */
	System.out.print("\n UpdateUserAcademicDetailsAction.jsp page called \n");
	String username = session.getAttribute("username").toString();

	/* Collecting and storing parameter from Student_Personal_Detail form action */
	String collegeUniversity = request.getParameter("collegeUniversity");
	String collegeName = request.getParameter("collegeName");
	String course = request.getParameter("course");
	String collegeAggregate = request.getParameter("collegeAggregate");
	String collegeStartPassYear = request.getParameter("collegeStartPassYear");
	
	String university10th = request.getParameter("university10th");
	String schoolName10th = request.getParameter("schoolName10th");
	String grade10th = request.getParameter("grade10th");
	String startPassYear10th = request.getParameter("startPassYear10th");
	
	String university12th = request.getParameter("university12th");
	String collegeName12th = request.getParameter("collegeName12th");
	String grade12th = request.getParameter("grade12th");
	String startPassYear12th = request.getParameter("startPassYear12th");
	
	/*  
	System.out.print("\n" + username + "\n");
	System.out.print(collegeUniversity + "\n" + collegeName + "\n" + course + "\n" + collegeAggregate + "\n" + collegeStartPassYear +  "\n");
	System.out.print(university10th + "\n" + schoolName10th + "\n" + grade10th + "\n" + startPassYear10th +  "\n");
	System.out.print(university12th + "\n" + collegeName12th + "\n" + grade12th + "\n" + startPassYear12th +  "\n");
	 */
	
	/* Inside try block, connection with JDBC, and executing update query */
	try{
		
		/* 
		 * Make DBMS connection,
		 * class DbConnection belongs to khubdb package 
		 * getConnection() is a static method of DbConnection which return connection object 
		 */
		Connection con = DbConnection.getConnection();
		
		String updateSACQuery =  "UPDATE student_academic_detail "
								+"SET " 
								+"    college_university_name = ?, college_name = ?, stucourse = ?, college_aggregate = ?, college_start_pass_year = ?, "
								+"    12th_university_name = ?, 12th_college_name = ?, 12th_grade = ?,  12th_start_pass_year = ?, "
								+"    10th_university_name = ?, 10th_school_name = ?, 10th_grade = ?, 10th_start_pass_year = ? "
																
								+"WHERE stuemail = (SELECT email FROM login WHERE username = ?) ";
		
		PreparedStatement pst = con.prepareStatement(updateSACQuery);
		pst.setString(1, collegeUniversity);
		pst.setString(2, collegeName);
		pst.setString(3, course);
		pst.setString(4, collegeAggregate);
		pst.setString(5, collegeStartPassYear);
		
		pst.setString(6, university12th);
		pst.setString(7, collegeName12th);
		pst.setString(8, grade12th);
		pst.setString(9, startPassYear12th);
		
		pst.setString(10, university10th);
		pst.setString(11, schoolName10th);
		pst.setString(12, grade10th);
		pst.setString(13, startPassYear10th);
		
		pst.setString(14, username);

		/* status is used, to hold the return value of pst.executeUpdate()
		 * if status != 0, its mean , that at a row is affected i.e record updated
		 * if status == 0, its mean, that no row is affected i.e no record updated
		*/
		int status = pst.executeUpdate();
		
		if(status != 0)
		{
			response.sendRedirect("UserSettings.jsp?update=AcademicDetailsUpdated");
		}
		
		if(status == 0)
		{
			response.sendRedirect("UserSettings.jsp?update=notupdated");
		}
				
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n UpdateUserAcademicDetailsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?update=exception");
	} /* catch block close */
%>