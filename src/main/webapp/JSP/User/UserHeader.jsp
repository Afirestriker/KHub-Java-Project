<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- 
	This is header file, its contain header used in /JSP/User/page.jsp
	NOTE: This header is not used in /JSP/page.jsp and /JSP/Admin/page.jsp
 -->

<!-- Header menus for users -->
<!-- This file specify header which is used on multiple pages using <%-- <%@include page="" %> --%> tag of jsp -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>User Header File</title>
	<link rel="stylesheet" type="text/css" href="../../CSS/User/UserHeader.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<!-- Menu Section -->
	<section id="menu">
		<nav class="menu-container">

			<!-- HireUp Icon Image fetched from web -->
			<a href="../Index.jsp"><img class="logo" src="../../Images/KHubLogo.png" alt="KHubLogo" title="KHUB"></a>

			<ul>
				<!-- This are header, menu item -->
				<li><a href="UserIndex.jsp" title="Home"><span class="material-icons"> home </span></a></li>

				<li class="discription"><a href=""><span class="material-icons"> description </span></a>
					<div class="dropdown-content">
						<a href="ViewNewOpp.jsp">New Opportunities</a>
						<a href="ViewAllApplications.jsp?status=Applied">Applications Details</a>
  						<!-- <a href="ViewUserPersonalDetail.jsp">Personal Details</a> -->
  						<!-- <a href="ViewUserAcademicDetail.jsp">Academic Details</a> -->
  					</div>
				</li>
				
				<li class="discription"><a href="#" title="Generate Resume"><span class="material-icons"> badge </span></a>
					<div class="dropdown-content">
						<a href="UserResume.jsp" target="_blank">Simple Template</a>
						<a href="UserResume2.jsp" target="_blank">Modern Template</a>
  						<a href="UserResume3.jsp" target="_blank">Advanced Template</a>
  					</div>
				</li>
				
				<li><a href="ViewQuizIndex.jsp" title="Practice Quiz"><span class="material-icons">quiz</span></a></li>
				
				<li><a href="ViewCompanyIndex.jsp" title="Company Details"><span class="material-icons">business</span></a></li>
				
				<li><a href="UserSettings.jsp" title="Settings"><span class="material-icons"> manage_accounts </span></a></li>

				<li><a href="../Logout.jsp" title="Logout"><span class="material-icons"> logout </span></a></li>
			</ul>
		</nav>
	</section>
<!-- End of Menu  Section -->

</body>
</html>