<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on KPMG company image this page will be called

	This page is showing details:
		About KPMG and their Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n KPMGCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>KPMG Info</title>
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
<header class="w3-container w3-red w3-center kpmg-header company-header" style="padding:128px 16px">
	  <h1 class="w3-margin w3-jumbo company-header-h1">KPMG</h1>
	  <p class="w3-xlarge company-slogan">BUILD for everyone</p>
	  <a href="https://aa046.taleo.net/careersection/ex/jobsearch.ftl?lang=en" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	At KPMG in India, every career journey is unique. Whether your desire is to become a Partner, or you aspire to become an entrepreneur eventually, the skills and experience you acquire at KPMG in India are sure to help you achieve your full potential.
      </h5>

      <h5>At KPMG in India, you have the opportunity to work with some of the national and global leading business enterprises, major public sector entities, not-for-profits and innovative start-ups. Getting to work with a multi-disciplinary team, acquiring industry-driven approach to client engagements, developing a deep understanding of the financial, technical and industry issues as well as attaining expertise of a specific industry is all possible within your journey with us.</h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/KPMGLogo.jpg">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/KpmgCareerStage.jpg">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>KPMG in India, are committed to build careers and help individuals create a strong foundation of their professional journey. An applicant undergoes series of tests and interview rounds to make way to the organisation. These are thoughtfully designed to assess candidates and determine the best fit for the firm.</h5>
			<p style="font-style: italic; font-size: 12px;">Please note- The process steps listed below are shared for your general understanding of our evaluation methodology and are purely indicative. Actual evaluation process may vary based on aspects like profile, position, role and its requirements.</p><br>

			<dl>
				<dt>1. Online Assessment Test</dt>
				<dd>Requires shortlisted applicant to use his/her computer to attempt this proctored test shared via a link by invite only. Typically, these tests are of 60-90-minute duration and include questions that assess comprehension, interpretation, logical & verbal reasoning, and psychometric abilities. Some practices may additionally use this assessment for checking proficiency in areas like quantitative math and data analytics.</dd>

				<dt>2. Group Discussion</dt>
				<dd>An open discussion activity that enables evaluation of soft skills like oral communication, articulation, structured thinking, attitude and attributes like proactiveness, presence of mind, teaming and leadership.</dd>

				<dt>3. Case Study Round</dt>
				<dd>Case studies are often used for assessing subject matter expertise. However, they can also be used in other forms for evaluating verbal or written communication, pragmatic thinking, general knowledge and business acumen. This assessment may be conducted as a written test or an interactive discussion.</dd>
			
				<dt>4. Evaluation By Recruiter</dt>
				<dd>Direct interaction held in-person/telephonically or virtually by a Recruiter to assess overall fitment within the designated role and the firm at large also behavioural aspects of the applicant - personality, business awareness, skills and ability, resilience.</dd>

				<dt>5. Evaluation By Technical Panel</dt>
				<dd>Direct interaction held in-person/telephonically or virtually by the hiring team personnel to assess a candidate's technical competency required for the job in addition to the attributes mentioned above. This assessment is typically 'one on one' however, in some cases, there comprise a panel of two to three interviewers. This stage can also involve multiple interactions with the hiring team ranging from the Hiring Manager to Team Lead, Business leader/Partner and even Function Heads.</dd>
				
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