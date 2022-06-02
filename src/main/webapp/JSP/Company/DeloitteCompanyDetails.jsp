<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on any Deloitte company image this page will be called

	This page is showing details:
		About Deloitte 
		Deloitte Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n DeloitteCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Deloitte Info</title>
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
<header class="w3-container w3-center deloitte-header company-header" style="padding:128px 16px;">
	  <h1 class="w3-margin w3-jumbo company-header-h1">DELOITTE</h1>
	  <p class="w3-xlarge company-slogan">Always One Step Ahead</p>
	  <a href="https://www2.deloitte.com/in/en/pages/careers/topics/make-an-impact-that-matters.html?icid=top_make-an-impact-that-matters" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	Deloitte is the brand under which tens of thousands of dedicated professionals in independent firms throughout the world collaborate to provide audit & assurance, consulting, risk and financial advisory, risk management, tax, and related services to select clients.
      </h5>

      <h5>
      	Deloitte in India recognized amongst 2021 Top 10 Best Companies for Women in India,  2021 Top 10 Hall of Fame for being featured on this list for a minimum of five years and 2021 "Champion of Inclusion" award in the Working Mother and Avtar Most Inclusive Companies Index. <br>
      	🏆 'Gold' category winner in the India Workplace Equality Index 2021. <br>
      	🏆 Deloitte ranked #6 in LinkedIn’s top companies 2021 list for India.</h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/DeloitteIcon.jpg">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/DeloitteIcon2.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>
				We know hiring processes can seem overwhelming, but Deloitte take care that not anyone should feel overwhelmed by the recruitment process. Deloitte selection process has a number of stages to give you the chance to know more about Deloitte, as well as them knowing more about you. <br>

				Once your application is submit. Your online application will be reviewed by the relevant Talent Acquisition team member. They will assess your skills and experience to determine your match to the key selection criteria.<br><br>

				Deloitte interviews are competency based and are conducted by experienced interviewers:<br>
			</h5>
			<ul>
					<li>The first interview will generally be a telephonic screening / face to face initial interview with a member of the Talent Acquisition team. This is also your opportunity to ask any questions about the role and the firm</li>
					<li>This is followed by a face-to-face technical, panel or case study interview with the service line you are applying for. This is an in-depth interview and discussion regarding your technical and motivational fit for the role, team and firm. The number of interviews varies from service line to service line</li>
					<li>The final stage will be a meeting with a Partner/Director from the service line you may be joining.</li>
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