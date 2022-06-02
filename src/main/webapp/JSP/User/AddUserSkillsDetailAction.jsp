<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>


<!-- 
	This File represent the back-end process of AddUserSkillsDetail.jsp page
	Here, the value parameter is collected from AddUserSkillsDetail.jsp page
	and this values are enter with current user email id into the khubdb.skills database table
	And,
	
	NOTE: At here, the session attribute email, which is set in UserLoginAction.jsp page is collected
		  to add current user detail in skills table and make it connect with other tables database for 
		  current user (stuemail is an foreign key in skills database table)
	
	NOTE: At the end of this page execution, we are removing session attribute email, since
		  this is the last page of data entry. Its means that if user complete the data entry of
		  skills database table, then all of his/her details are collected.
		  
	Also session attribute email, prevent wrong access to this page by using url addressing
 -->

<%
try{

	/* This statement display a message on consle, indicating current page execution */
	System.out.print("\n AddUserSkillsDetailAction.jsp called \n");

	/* Get session from UserPersonalDetail.jsp and store in User_Personal_Detail database table */
	/* email session, also helps in avoiding user to directly naviage to this page, since
	   email is set in UserLongAction.jsp which check, if user has completed its profile details or not   
	*/
	String email = session.getAttribute("email").toString();
	
	/* Declaring string variable for storing student course name */
	String stuCourse = "";
			
	/* 
	* Make DBMS connection,
	* class DbConnection belongs to khubdb package 
	* getConnection() is a static method of DbConnection which return connection object 
	*/
	Connection con = DbConnection.getConnection();
	
	/* Write query to fetch stuCourse */
	String fetchStuCourse = "SELECT StuCourse FROM student_academic_detail WHERE StuEmail = ?";
	PreparedStatement pst1 = con.prepareStatement(fetchStuCourse);
	pst1.setString(1, email);
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
	
		
	/* Get Interpersonal Skills */
	communication = Integer.parseInt(request.getParameter("communication"));
	teamwork = Integer.parseInt(request.getParameter("teamwork"));
	perseverance = Integer.parseInt(request.getParameter("perseverance"));
	problemSolving = Integer.parseInt(request.getParameter("problemSolving"));
	timeManagement = Integer.parseInt(request.getParameter("timeManagement"));
	agility = Integer.parseInt(request.getParameter("agility"));
	
	
	/* 
	System.out.println("\n\n" + email + "\n" );
	System.out.println(accounting + " " + excel + " " + tally + " " + marketing + " " + management + " " + analytics + "\n" );
	System.out.println(html + " " + css + " " + javaScript + " " + c + " " + cpp + " " + java + " " + python + " " + php + "\n" );
	System.out.println( communication + " " + teamwork + " " + perseverance + " " + problemSolving + " " + timeManagement + " " + agility + "\n\n" );
	 */
	
	/**************************************************************************
	 * Now, As parameters are collected, 
	 * Next step, is to add this values in database khubv1.skills table
	*/
	
	
	/* Check If user data already exist
	 * if yes, then redirect to UserLoginAction.jsp
	 * if No, then insert details
	*/
	
	String checkDuplicateEntry = "SELECT COUNT(stuemail) FROM skills WHERE stuemail = '"+email+"' ";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(checkDuplicateEntry);
	while(rs.next())
	{
		if(rs.getInt(1) != 0)
		{
			response.sendRedirect("UserLoginAction.jsp");
		}
	}
	
	/* Write MySql query to insert values in hireupv1.skills table */
	String updateSkills = "INSERT INTO skills VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	/* Using PreparedStatement interface to update database table,
	 * since we are accepting value at run time
	*/
	PreparedStatement pst = con.prepareStatement(updateSkills);
	pst.setString(1, email);
	pst.setInt(2, accounting);
	pst.setInt(3, excel);
	pst.setInt(4, tally);
	pst.setInt(5, marketing);
	pst.setInt(6, management);
	pst.setInt(7, analytics);
	pst.setInt(8, html);
	pst.setInt(9, css);
	pst.setInt(10, javaScript);
	pst.setInt(11, c);
	pst.setInt(12, cpp);
	pst.setInt(13, java);
	pst.setInt(14, python);
	pst.setInt(15, php);
	pst.setInt(16, communication);
	pst.setInt(17, teamwork);
	pst.setInt(18, perseverance);
	pst.setInt(19, problemSolving);
	pst.setInt(20, timeManagement);
	pst.setInt(21, agility);
	
	pst.executeUpdate();

	/* Once database is successfully updated,
	 * remove session and redirect to UserIndex.jsp page
	*/
	
	/* 
	 * Remove session with attribute="email"
	 * As, now data entry is done, and email is not required for further procesing
	*/
	session.removeAttribute("email");
	response.sendRedirect("UserIndex.jsp");
	
}
catch(Exception e)
{
	/* In Case if run-time exception is thrown 
	 * Then, counter comes inside catch block and display error on console
	 * And, redirect to AddUserSkillsDetail.jsp with messsage  = exception
	 * Then, at AddUserSkillsDetail.jsp there's an condition which check if msg = exception 
	   and accordingly message is display on that page
	*/
	System.out.println("AddUserSkillsDetailAction.jsp Exception: " + e + "\n\n");
	
	response.sendRedirect("AddUserSkillsDetail.jsp?msg=exception");
}

%>