<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on EY company image this page will be called

	This page is showing details:
		About EY and their Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n EYCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>EY Info</title>
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
<header class="w3-container w3-center ey-header company-header" style="padding:128px 16px">
	  <h1 class="w3-margin w3-jumbo company-header-h1">EY</h1>
	  <p class="w3-xlarge company-slogan">Building a better working tomorrow</p>
	  <a href="https://eyglobal.yello.co/job_boards/c1riT--B2O-KySgYWsZO1Q" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	At EY, our purpose is building a better working world. The insights and services we provide help to create long-term value for clients, people and society, and to build trust in the capital markets.
      </h5>

      <h5>At EY, our purpose is Building a better working world. The insights and quality services we provide help build trust and confidence in the capital markets and in economies the world over. We develop outstanding leaders who team to deliver on our promises to all our stakeholders. In so doing, we play a critical role in building a better working world for our people, for our clients and for our communities.</h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/EYLogo.png">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/EYRecruitmentProcess.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>From first steps to the final interview, learn everything there is to know about the EY hiring process and discover the best way to become part of an EY team.</h5>
			<p style="font-style: italic; font-size: 12px;">Please note- The process steps listed below are shared for your general understanding of our evaluation methodology and are purely indicative. Actual evaluation process may vary based on aspects like profile, position, role and its requirements.</p><br>

			<dl>
				<dt>1. Explore EY</dt>
				<dd>Explore what you can do at EY to identify an opportunity that aligns with your academic background and interests.</dd>

				<dt>2. Search and apply</dt>
				<dd>Visit the EY student job board, use the search features and apply for an opportunity.</dd>

				<dt>3. EY review process</dt>
				<dd>After you complete your application for employment, EY will review your resume and qualifications. Students are selected for interviews based on academic background, extracurricular activities and work experience.</dd>
			
				<dt>4. Interviews</dt>
				<dd>Selected candidates will be invited to participate in the interview process, which in most cases is virtual</dd>

				<dt>5. Offer decisions</dt>
				<dd>A decision is usually made within a few weeks of the final interview. EY knows that waiting to hear can be tough - They will try to let you know as soon as we can. EY recruiters and professionals will stay in touch with you throughout the recruiting process</dd>
				
			</dl>

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