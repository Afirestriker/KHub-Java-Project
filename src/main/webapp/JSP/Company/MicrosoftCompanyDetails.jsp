<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on any Microsoft company image this page will be called

	This page is showing details:
		About Microsoft and its Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n MicrosoftCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Microsoft Info</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="../../CSS/Company/CompanyDetails.css">
	
	<!-- Icons Embedded from Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
		/*Icon size*/
		.fa-anchor,.fa-coffee {font-size:200px}
	</style>
	
</head>
<body>

<!-- Navigation Bar -->
<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->


<!-- Section 1: Header -->
<header class="w3-container w3-center company-header microsoft-header" style="padding:128px 16px;">
	  <h1 class="w3-margin w3-jumbo company-header-h1">MICROSOFT</h1>
	  <p class="w3-xlarge company-slogan">Be What's Next</p>
	  <a href="https://careers.microsoft.com/students/us/en" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->


<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	Microsoft Corporation is an American multinational technology corporation which produces computer software, consumer electronics, personal computers, and related services. Its best-known software products are the Microsoft Windows line of operating systems, the Microsoft Office suite, and the Internet Explorer and Edge web browsers.
      </h5>

      <h5>
      	Satya Nadella took over as CEO in 2014 and henceforth the company has scaled back on hardware after losing market in the domain of mobiles and has instead focused on cloud computing, a move that helped the company's shares reach its highest value since December 1999. As of 2016, it is the world's largest software maker by revenue, and one of the world's most valuable companies.
      </h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/MicrosoftIcon.png">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/microsoftOfficeIcon.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>
					We know hiring processes can seem overwhelming, but Microsoft take care that not anyone should feel overwhelmed by the recruitment process. Microsoft selection process has a number of stages to give you the chance to know more about Microsoft, as well as them knowing more about you. <br>

					Once your application is submit. Your online application will be reviewed by the relevant Talent Acquisition team member. They will assess your skills and experience to determine your match to the key selection criteria.<br><br>

					Microsoft conducts 4 to 5 rounds to select the freshers as SDE in their organization:<br>
				</h5>
				<ul>
						<li>Online Round</li>
						<li>Onsite Round</li>
						<li>Technical Round 1</li>
						<li>Technical Round 2</li>
						<li>Technical Round 3 (System Design Round)</li>
						<li>Technical-cum-HR round</li>
				</ul>

		</div>
    </div>
  </div>
</div>

<!-- Quotes / Message -->
<div class="w3-container w3-black w3-center w3-opacity w3-padding-14">
    <h1 class="w3-margin w3-xlarge">Quote of the day: Try Everything</h1>
</div>


<!-- Footer -->
<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>
</html>