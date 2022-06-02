<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- 
	This is header file, its contain header used in /JSP/Admin/page.jsp
	NOTE: This header is not used in /JSP/page.jsp and /JSP/Admin/page.jsp
 -->

<!-- Header menus for Admin -->
<!-- This file specify header which is used on multiple pages using <%-- <%@include file="" %> --%> tag of jsp -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../../CSS/Admin/AdminHeader.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

	<!-- Menu Section -->
	<section id="menu">
		<nav class="menu-container">

			<!-- HireUp Icon Image fetched from web -->
			<a href="../Index.jsp"><img class="logo" src="../../Images/KHubLogo.png" alt="KHubLogo-img" title="KHub"></a>

			<ul>
				<!-- This are header, menu item -->
				<li><a href="AdminIndex.jsp" title="Home"><span class="material-icons"> home </span></a></li>
				
				<li class="discription">
					<a href="#" title="Opportunities"><span class="material-icons"> post_add </span></a>
					<div class="dropdown-content">
  						<a href="AdminAddNewOppDetail.jsp">Add New Opportunity</a>
  						<a href="AdminViewAllOpp.jsp?status=Active">View Opportunity list</a>
  					</div>
				</li>
				
				<li><a href="AdminViewUserRecords.jsp" title="Student Records"><span class="material-icons"> table_chart </span></a></li>
				
				<li><a href="AdminViewContacts.jsp" title="View Messages"><span class="material-icons"> forum </span></a></li>

				<li><a href="../Logout.jsp" title="Logout"><span class="material-icons"> logout </span></a></li>
			</ul>
		</nav>
	</section>
<!-- End of Menu  Section -->

</body>
</html>