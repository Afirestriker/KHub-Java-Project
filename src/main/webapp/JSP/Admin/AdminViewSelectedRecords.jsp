<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="AdminError.jsp" %>

<!-- importing khubdb package classes and interface for connection to database -->
<%@ page import="khubdb.*" %>

<!-- importing java.sql package which provide classes and interfaces for JDBC -->
<%@ page import="java.sql.*" %>

<!-- 
	Here, Admin can see user records who are Hired, 
	Only needed records are displayed by fetching detail from database table
	student_personal_deatail, student_academic_detail
 -->
<%
	/* Print on console, indicating the navigation of pages */
	System.out.print("\n AdminViewSelectedRecords.jsp called \n");
	
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
	<title>View Selected Records</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" type="text/css" href="../../CSS/Admin/AdminViewUserRecords.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<!-- This is jquery embeded link, used for search field (Script is written at end of this page) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

<!-- Menu Section -->
	<%@include file="AdminHeader.jsp" %>	
<!-- End of Menu  Section -->


	<div class="admin-view-user-records-container">

		<div class="col-left">
			
			<div class="text-content">
				Selected Student Records
			</div>

			<div class="table-container">

			<%
				String msg = request.getParameter("msg");
				if("exception".equals(msg))
				{
			%>
				<p style="text-align: center; color: #ff6969; font-size: 20px; font-weight: bold;"> Something went wrong! Data cannot be fecthed</p>
			<%	} %>

				<input type="search" id="searchField" placeholder="Search for names.." title="Type in a name"> <span class="material-icons"> search </span> <br>

				<div id="printableTable">
				<table border="1">

					<thead>
						<tr>
							<th>Email</th>
							<th>Company Name</th>
							<th>Joining Date</th>
							<th>Package (in lakh)</th>
							<th>Offer Letter</th>
							<th>HireStatus</th>
						</tr>
					</thead>

<%
	/*********************************************************************************** 
	 * Java Business Logic,
	 * 1. Making Connection with JDBC
	 * 2. Fetching Records from student_academic_detail and company table of hireupv1 database
	 * 3. Displaying thoes records
	 */
	 
	try{
		 
		/* 
		* Make DBMS connection,
		* class DbConnection belongs to khubdb package
		* getConnection() is a static method of DbConnection which return connection object 
		*/
		Connection con = DbConnection.getConnection();

		/* SSR = Selected Student Records */
		String fetchSSRQuery = "SELECT company.stuemail, companyName, joiningDate, package, offerLetterStatus, HireUpStatus "
						+ "FROM company, student_academic_detail " 
						+ "WHERE company.stuEmail = company.stuemail GROUP BY(stuemail)";
		
		Statement stFetchSSR = con.createStatement();
		ResultSet rsFetchSSR = stFetchSSR.executeQuery(fetchSSRQuery);
		
		while(rsFetchSSR.next())
		{
			
%>

					<tbody id="tableBody">
						<tr>
							<td>
								<%= rsFetchSSR.getString("stuemail") %>
							</td>

							<td>
								<%= rsFetchSSR.getString("companyName") %>
							</td>

							<td>
								<%= rsFetchSSR.getString("joiningDate") %>
							</td>

							<td>
								<%= rsFetchSSR.getString("package") %>
							</td>

							<td>
								<%= rsFetchSSR.getString("offerLetterStatus") %>
							</td>

							<td style="color: green; font-weight: bold">
								<%= rsFetchSSR.getString("hireUpStatus") %>
							</td>
						</tr>

					</tbody>

<%
		} /* while loop close */
		/* Closing the connection */
		con.close();
	} /* try block close */
	catch(Exception e)
	{
		System.out.print("\n AdminViewSelectedRecords.jsp Exception: " + e);
	 	response.sendRedirect("AdminViewSelectedRecords.jsp?msg=exception");
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
				<img style="height: 420px;" src="../../Images/Admin/job_selected.jpg">
			</div>	
		</div>
	
	</div>
	<!-- admin-view-user-records-container close -->


<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>

<!-- This fiel contains concept for searching records and printing the displayed records -->
<script src="../../JS/Admin/AdminViewRecords.js"></script>

</html>