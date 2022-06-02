<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	Here, Admin can see user records, 
	Admin can see only those student records, whose details are present in all three basic tables
	 i.e. Personal Detail, Academic Detail, and SKills Detail
	
	Only needed records are displayed by fetching detail from database table
	student_personal_deatail, student_academic_detail, and Student Skills table
 -->

<%
	/* Print on console, indicating the navigation of pages */
	System.out.print("\n AdminViewUserRecords.jsp called \n");
	
	/* session attribute "admin" is set only, in LoginAction.jsp page, only when admin login,
       credentials are matched.
       Its also helps, in preventing unauthorised access to admin pages
    */
	String admin = session.getAttribute("admin").toString();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>View User Records</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/Admin/AdminViewUserRecords.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<!-- This is JQuery embedded link, used for search field (Script is written at end of this page) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<!-- Menu Section -->
	<%@include file="AdminHeader.jsp" %>	
<!-- End of Menu  Section -->


	<div class="admin-view-user-records-container">

		<div class="col-left">
			
			<div class="text-content">
				All Student Records
			</div>

			<div class="table-container">

			<%
				String msg = request.getParameter("msg");
				if("exception".equals(msg))
				{
			%>
				<p style="text-align: center; color: #ff6969; font-size: 20px; font-weight: bold;"> Something went wrong! Data cannot be fetched</p>
			<%	} %>
			
			<%
				if("unSufficientRecord".equals(msg))
				{
			%>
				<p style="text-align: center; color: #ff6969; font-size: 20px; font-weight: bold;"> Not Sufficient Records for given student! Can't Show Resume</p>
			<%	} %>
			
			
			
				<input type="search" id="searchField" placeholder="Search for names.." title="Type in a name"> <span class="material-icons"> search </span> <br>

				<div id="printableTable">
				<table border="1">

					<thead>
						<tr>
							<th>Email</th>
							<th>Name</th>
							<th>Age</th>
							<th>Course</th>
							<th>College Grade</th>
							<th>View Resume</th>
							<!-- <th>Selection Status</th> -->
						</tr>
					</thead>

<%
	/*********************************************************************************** 
	 * Java Business Logic,
	 * 1. Making Connection with JDBC
	 * 2. Fetching Records from student_personal_detail and student_academic_detail table of khubv1 database table
	 * 3. Displaying those records
	 */
	 
	 try{
		 
		/* 
		* Make DBMS connection,
		* class DbConnection belongs to khudb package 
		* getConnection() is a static method of DbConnection which return connection object 
		*/
		Connection con = DbConnection.getConnection();
		
		String fetchSPD = "SELECT stuemail, stufirstname, stulastname, stuage FROM student_personal_detail";
		
		Statement st = con.createStatement();
		ResultSet rsSPD = st.executeQuery(fetchSPD);
		
		while(rsSPD.next())
		{
			String fetchSAD = "SELECT stucourse, college_aggregate FROM student_academic_detail WHERE stuemail = ?";
			PreparedStatement pst = con.prepareStatement(fetchSAD);
			pst.setString(1, rsSPD.getString("stuemail"));
			ResultSet rsSAD = pst.executeQuery();			
		
			while(rsSAD.next())
			{
				
				/* Check Skills table records exist for current user or not */
				int recordCount = 0;
				String checkSkillsDetails = "SELECT COUNT(stuemail) FROM skills WHERE stuemail = ?";
				PreparedStatement pstCheckSkillsDetails = con.prepareStatement(checkSkillsDetails);
				pstCheckSkillsDetails.setString(1, rsSPD.getString("stuemail"));
				ResultSet rsCheckSkills = pstCheckSkillsDetails.executeQuery();
				while(rsCheckSkills.next())
				{
					recordCount = rsCheckSkills.getInt(1);	
				}
				
				if(recordCount != 0)
				{
				
%>

					<tbody id="tableBody">
						<tr>
							<td>
								<%= rsSPD.getString("stuemail")  %>
							</td>

							<td>
								<%= rsSPD.getString("stufirstname") + " " + rsSPD.getString("stulastname") %>
							</td>

							<td>
								<%= rsSPD.getInt("stuage") %>
							</td>

							<td>
								<%= rsSAD.getString("stucourse") %>
							</td>

							<td>
								'<%= rsSAD.getString("college_aggregate") %>'
							</td>

							<td>
								<a href="AdminViewUserResumeAction.jsp?stuEmail=<%= rsSPD.getString("stuemail") %>" target="_blank">View</a>
							</td>
							
							<!-- 
							<td>
								<a href="#" target="_blank">Selected</a>
							</td> 
							-->
						</tr>
						
					</tbody>

<%
				} /* close if block */
			} /* inner while loop while(rsSAD.next()) close */
		} /* outter while loop while(rsSPD.next()) close */
		/* Closing the connection */
		con.close();
	} /* try block close */
	catch(Exception e)
	{
		 System.out.print("\n AdminViewUserRecords.jsp Exception: " + e);
		 response.sendRedirect("AdminViewUserRecords.jsp?msg=exception");
	} /* catch block close */
	
	/* ********************************************************************************* */
%>
				</table>
				</div>
				<!-- div id="printableTable" close -->

				 <button class="button_print" onclick="printDiv()">Print</button>
				 <iframe name="print_table" width="0" height="0" frameborder="0" src="about:blank"></iframe>

			</div>
			<!-- table-container close -->

		</div>
		<!-- col-left close -->
			

		<div class="col-right">
			<div class="page-img">
				<img src="https://image.freepik.com/free-vector/recruit-agent-analyzing-candidates_74855-4565.jpg">
			</div>	
		</div>
	
	</div>
	<!-- admin-view-user-records-container close -->

<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->


</body>

<!-- This field contains concept for searching records and printing the displayed records -->
<script src="../../JS/Admin/AdminViewRecords.js"></script>

</html>