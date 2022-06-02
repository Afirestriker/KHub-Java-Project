<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on any Google company image this page will be called

	This page is showing details about google company
		About Google
		Google Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n GoogleCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Google Info</title>
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
<header class="w3-container w3-red w3-center google-header company-header" style="padding:128px 16px">
	  <h1 class="w3-margin w3-jumbo company-header-h1">GOOGLE</h1>
	  <p class="w3-xlarge company-slogan">BUILD for everyone</p>
	  <a href="https://careers.google.com/jobs/results/" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- Section: About -->
<!-- First Grid: -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	Google LLC is an American multinational technology company that specializes in 
      	Internet-related services and products, which include a search engine, online advertising technologies, 
      	cloud computing, software, and hardware.
      </h5>

      <h5>
      	Google is proudly known to be an equal opportunity work-place and is an affirmative action employer. 
      	Google is committed to equal employment opportunity regardless of race, color, ancestry, religion, national origin, 
      	age, citizenship, marital status, disability, gender identity or Veteran status. 
      	It also consider qualified applicants regardless of criminal histories, consistent with legal requirements.
      </h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/googleIcon256px.png">
    </div>
  </div>
</div>
<!-- Close: Section About -->

<!-- Selection Criteria Section -->
<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/google_assistant_icon256px.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>
				We know hiring processes can seem overwhelming, but Google take care that not anyone should feel 
				overwhelmed at Google. Google want all candidates from entry level to leadership, to have access to 
				the same information and resources. Googlers care deeply about their teams and the people who make them up. 
				Google also care about building a more representative and inclusive workplace, and that begins with hiring. 
				In order to truly <span class="span-slogan">build for everyone</span>, they know that we need a 
				diversity of perspectives and experiences, and a fair hiring process is the first step in getting there. 
				With that in mind, Google have broken down the process both visually and verbally as below 
			</h5>

			<ul>
				<li>Self-reflection</li>
				<li>Job searching</li>
				<li>Your resume</li>
				<li>Apply online</li>
				<li>Interviews</li>
				<li>Decision and offer</li>
			</ul>
		</div>
    </div>
  </div>
</div>
<!-- Close: Selection Criteria Section -->

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