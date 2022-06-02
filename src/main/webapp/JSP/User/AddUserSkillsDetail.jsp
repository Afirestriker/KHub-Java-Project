<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>


<!--
	This page is used for Inserting/Adding values to add on Skills Details in khubv1.Skills database table
		
		User are required to fill their Professional skills based on their college course
		i.e user are shown skills only that are relevant to their course type
		while, user interpersonal skills are same for all.
		
	The back-end process of this page is done by AddUserSkillsAction.jsp page
	
	This page is only used to take values from user.
	This page is called when user is new and login first time, in sequence
	1. AddUserPersonalDetail.jsp
	2. AddUserAcademicDetail.jsp
	3. AddUserSkillsDetail.jsp
	
	Or, directly from UserLoginAction.jsp page, where we check user profile status,
	by checking user records in three table (PersonalDetail, AcademicDetail, and Skills)
	and if records exist is above 2 table but not in Skills table for current user.
	
	NOTE: Here session attribute email is used which is set in User/UserLoginAction.jsp page
 -->

<%!
	/* Declaring string variable for storing student course name, 
		and this is declaration tag so that the variable can be access in the whole page */
	String stuCourse = "";
%>

<% 
	/* Print statement, to print on console, when visit to this page */
	System.out.println("\n AddUserSkillsDetail.jsp Called \n");
	
	/* Statement, get the session attribute set in UserLoginAction.jsp */
	String email = session.getAttribute("email").toString();
	
	/* 
	* Make DBMS connection,
	* class DbConnection belongs to khubdb package 
	* getConnection() is a static method of DbConnection which return connection object 
	*/
	Connection con = DbConnection.getConnection();
	
	/* Write query to fetch stuCourse */
	String fetchStuCourse = "SELECT StuCourse FROM student_academic_detail WHERE StuEmail = ?";
	PreparedStatement pst = con.prepareStatement(fetchStuCourse);
	pst.setString(1, email);
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
		stuCourse = rs.getString("StuCourse");
	}
	
	/* System.out.println("\n" + "Student Course: " + stuCourse); */
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Add Skills Details</title>
	
	<!-- Display image in tab -->
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	
	<!-- Link CSS File for styling this page -->
	<link rel="stylesheet" href="../../CSS/User/AddUserDetails.css">

</head>
<body>

	<section id="container">

		<a href="../Index.jsp"> <img src="../../Images/KHubLogo.png" alt="KHubLogo" title="KHUB" class="logo"> </a>
		<h1 class="container-formheading"> Profession and Extra Curriculum Skills </h1>

		<div class="container-form">

			<% 
				/* IF, this page is redirected from AddUserAcademicDetailAction.jsp with msg=exception
				 * condtion is true and message in <p>...</p> is displayed
				*/
				String msg = request.getParameter("msg");
				if("exception".equals(msg))
				{
			%>		
				<p> Something went wrong, Try Again!</p>
			<%  } %>
			
			<form action="AddUserSkillsDetailAction.jsp" method="post">

			    <table class="skills-table">
						
				<!-- Enter Professional Skills -->
						<tr> <td colspan="2"> <p class="skills-sub-heading">Professional Skills</p> </td> </tr>
						
						<% 
						/* if BBA OR MBA */
						if(stuCourse.equalsIgnoreCase("BBA") || stuCourse.equalsIgnoreCase("MBA"))
						{
						%>
							
						<!-- Accounting and Marketing skills -->
							<tr>
								<td>Accounting*</td>
								<td>Marketing*</td>
							</tr>
							<tr>
								<td> <input type="number" name="accounting" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="marketing" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- Excel and Management skills -->
							<tr>
								<td>Excel*</td>
								<td>Management*</td>
							</tr>
							<tr>
								<td> <input type="number" name="excel" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="management" placeholder="(%)"  title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- Tally and Analytics skills -->
							<tr>
								<td>Tally*</td>
								<td>Analytics*</td>
							</tr>
							<tr>
								<td> <input type="number" name="tally" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="analytics" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>

						<%
						}
						/* Close: if BBA OR MBA */
						%>
						
						<% 
						/* if BCA OR MCA */
						if(stuCourse.equalsIgnoreCase("BCA") || stuCourse.equalsIgnoreCase("MCA"))
						{
						%>
					
							<!-- HTML and C skills -->
							<tr>
								<td>HTML*</td>
								<td>C*</td>
							</tr>
							<tr>
								<td> <input type="number" name="html" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="c" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- CSS and C++ skills -->
							<tr>
								<td>CSS*</td>
								<td>C++*</td>
							</tr>
							<tr>
								<td> <input type="number" name="css" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="cpp" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- JavaScript and Java skills -->
							<tr>
								<td>JavaScript*</td>
								<td>Java*</td>
							</tr>
							<tr>
								<td> <input type="number" name="javaScript" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="java" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
						
						<%
						}
						/* Close: if BCA OR MCA */
						%>
						
						
						<% 
						/* if BE OR ME */
						if(stuCourse.equalsIgnoreCase("BE") || stuCourse.equalsIgnoreCase("ME"))
						{
						%>
						
							<!-- HTML and C skills -->
							<tr>
								<td>HTML*</td>
								<td>Java*</td>
							</tr>
							<tr>
								<td> <input type="number" name="html" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="java" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- CSS and Python skills -->
							<tr>
								<td>CSS*</td>
								<td>Python*</td>
							</tr>
							<tr>
								<td> <input type="number" name="css" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="python" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>
	
							<!-- JavaScript and PHP skills -->
							<tr>
								<td>JavaScript*</td>
								<td>PHP*</td>
							</tr>
							<tr>
								<td> <input type="number" name="javaScript" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
								<td> <input type="number" name="php" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							</tr>

						<%
						}
						/* Close: if BE OR ME */
						%>
				<!-- Close: Enter Professional Skills -->

				<!-- Adding Interpersonal SKills -->
						<tr> <td colspan="2"> <p class="skills-sub-heading">Interpersonal Skills</p> </td> </tr>
						<!-- Communication and Problem Solving skills -->
						<tr>
							<td>Communication*</td>
							<td>Problem Solving*</td>
						</tr>
						<tr>
							<td> <input type="number" name="communication" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
							<td> <input type="number" name="problemSolving" placeholder="(%)" title="Enter value between 1 to 100" min="1" max="100" required> </td>
						</tr>

						<!-- Teamwork and Time Management skills -->
						<tr>
							<td>Teamwork*</td>
							<td>Time Management*</td>
						</tr>
						<tr>
							<td> <input type="number" name="teamwork" placeholder="(%)"  title="Enter value between 1 to 100" min="1" max="100" required> </td>
							<td> <input type="number" name="timeManagement" placeholder="(%)" title="Enter value between 1 to 100"  min="1" max="100" required> </td>
						</tr>

						<!-- Perseverance and Agility skills -->
						<tr>
							<td>Perseverance*</td>
							<td>Agility*</td>
						</tr>
						<tr>
							<td> <input type="number" name="perseverance" placeholder="(%)" title="Enter value between 1 to 100"   min="1" max="100" required> </td>
							<td> <input type="number" name="agility" placeholder="(%)"  title="Enter value between 1 to 100"  min="1" max="100" required> </td>
						</tr>
				<!-- Close: Interpersonal Skills -->


						<tr>
							<td colspan="2"> <input type="submit" value="Submit"> </td>
						</tr>

					</table>

    		</form>
		
		</div>
		<!-- container-form close -->

	</section>


</body>
</html>