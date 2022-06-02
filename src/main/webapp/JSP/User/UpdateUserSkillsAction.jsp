<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	This page is used for Updating skills database table 
	This page is called from UserSettins.jsp page -> Update Skills Form Action
-->

<%

	/* Print message on console, indicating which page is visited */
	System.out.print("\n UpdateUserSkillsAction.jsp page called \n");
	String username = session.getAttribute("username").toString();
	
	/* Declaring string variable for storing student course name */
	String stuCourse = "";
	
	/* Inside try block, connection with JDBC, and executing update query */
	try{
		
		/* 
		 * Make DBMS connection,
		 * class DbConnection belongs to khubdb package 
		 * getConnection() is a static method of DbConnection which return connection object 
		 */
		Connection con = DbConnection.getConnection();
		
		
		/* Write query to fetch stuCourse */
		String fetchStuCourse = "SELECT StuCourse FROM student_academic_detail WHERE StuEmail = (SELECT email FROM login WHERE username = ?)";
		PreparedStatement pst1 = con.prepareStatement(fetchStuCourse);
		pst1.setString(1, username);
		ResultSet rs1 = pst1.executeQuery();
		while(rs1.next())
		{
			stuCourse = rs1.getString("StuCourse");
		}
			
		/* declare variable that will store parameter value */
			/* variable for storing professioal skills */
			int accounting=0, excel=0, tally=0, marketing=0, management=0, analytics=0;
			int html=0, css=0, javaScript=0, c=0, cpp=0, java=0, python=0, php=0;
			/* variable for storing interpersonal skills */
			int communication=0, teamwork=0, perseverance=0, problemSolving=0, timeManagement=0, agility=0;
			
		/* Get, all parameter from AddUserSkillsDetail.jsp to store in khubv1.Skills table */
		
		/* set user professional skills if user course is "BBA" or "MBA" */
		if(stuCourse.equalsIgnoreCase("BBA") || stuCourse.equalsIgnoreCase("MBA"))
		{
			accounting = Integer.parseInt(request.getParameter("accounting"));
			excel = Integer.parseInt(request.getParameter("excel"));
			tally = Integer.parseInt(request.getParameter("tally"));
			marketing= Integer.parseInt(request.getParameter("marketing"));
			management = Integer.parseInt(request.getParameter("management"));
			analytics = Integer.parseInt(request.getParameter("analytics"));
		}
		
		/* set user professional skills if user course is "BCA", "MCA", "BE", OR "ME" */
		if(stuCourse.equalsIgnoreCase("BCA") || stuCourse.equalsIgnoreCase("MCA"))
		{
			/* this are skills for BCA, MCA */
			html = Integer.parseInt(request.getParameter("html"));
			css = Integer.parseInt(request.getParameter("css"));
			javaScript = Integer.parseInt(request.getParameter("javaScript"));
			c= Integer.parseInt(request.getParameter("c"));
			cpp = Integer.parseInt(request.getParameter("cpp"));
			java = Integer.parseInt(request.getParameter("java"));
		}	
			
			
		/* set skills that are specific to "BE" & "ME" */
		if(stuCourse.equalsIgnoreCase("BE") || stuCourse.equalsIgnoreCase("ME"))
		{
			html = Integer.parseInt(request.getParameter("html"));
			css = Integer.parseInt(request.getParameter("css"));
			javaScript = Integer.parseInt(request.getParameter("javaScript"));
			java = Integer.parseInt(request.getParameter("java"));
			python = Integer.parseInt(request.getParameter("python"));
			php = Integer.parseInt(request.getParameter("php"));
		}
			
		/* Get Interpersonal Skills this is common for all users */
		communication = Integer.parseInt(request.getParameter("communication"));
		teamwork = Integer.parseInt(request.getParameter("teamwork"));
		perseverance = Integer.parseInt(request.getParameter("perseverance"));
		problemSolving = Integer.parseInt(request.getParameter("problemSolving"));
		timeManagement = Integer.parseInt(request.getParameter("timeManagement"));
		agility = Integer.parseInt(request.getParameter("agility"));
		
		
		/* 
		System.out.println("\n\n" + username + "\n" );
		System.out.println(accounting + " " + excel + " " + tally + " " + marketing + " " + management + " " + analytics + "\n" );
		System.out.println(html + " " + css + " " + javaScript + " " + c + " " + cpp + " " + java + " " + python + " " + php + "\n" );
		System.out.println( communication + " " + teamwork + " " + perseverance + " " + problemSolving + " " + timeManagement + " " + agility + "\n\n" );
		 */
		 
		/**************************************************************************
		 * Now, As parameters are collected, 
		 * Next step, is to update this values in database khubv1.skills table
		*/

		String updateSkills = "UPDATE skills "
							+ "SET "
							
							+ "accounting = ?, excel = ?, tally = ?, marketing = ?, management = ?, analytics = ?, "
							
							+ "html = ?, css = ?, javascript = ?, c = ?, cpp = ?, java = ?, python = ?, php = ?, "
							
							+ "communication = ?, teamwork= ?, perseverance = ?, problemSolving = ?, timeManagement = ?, agility = ? "
							
							+  "WHERE stuemail = (SELECT email FROM login WHERE username = ?)";

		PreparedStatement pst = con.prepareStatement(updateSkills);
		pst.setInt(1, accounting);
		pst.setInt(2, excel);
		pst.setInt(3, tally);
		pst.setInt(4, marketing);
		pst.setInt(5, management);
		pst.setInt(6, analytics);
		pst.setInt(7, html);
		pst.setInt(8, css);
		pst.setInt(9, javaScript);
		pst.setInt(10, c);
		pst.setInt(11, cpp);
		pst.setInt(12, java);
		pst.setInt(13, python);
		pst.setInt(14, php);
		pst.setInt(15, communication);
		pst.setInt(16, teamwork);
		pst.setInt(17, perseverance);
		pst.setInt(18, problemSolving);
		pst.setInt(19, timeManagement);
		pst.setInt(20, agility);
		
		pst.setString(21, username);
		
		/* status is used, to hold the return value of pst.executeUpdate()
		 * if status != 0, its mean , that at a row is affected i.e record updated
		 * if status == 0, its mena, that no row is affected i.e no record updated
		*/
		int status = pst.executeUpdate();
		
		if(status != 0)
		{
			response.sendRedirect("UserSettings.jsp?update=SkillDetailsUpdated");
		}
		
		if(status == 0)
		{
			response.sendRedirect("UserSettings.jsp?update=notupdated");
		}
		
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n UpdateUserSkillsAction.jsp Exception: " + e);
		response.sendRedirect("UserSettings.jsp?update=exception");
	} /* catch block close */
	
%>

