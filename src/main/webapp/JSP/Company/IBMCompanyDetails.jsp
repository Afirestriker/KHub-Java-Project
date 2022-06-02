<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on IBM company image this page will be called

	This page is showing details:
		About IBM and their Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n IBMCompanyDetails.jsp Called \n"); 
	
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
<header class="w3-container w3-center ibm-header company-header" style="padding:128px 16px">
	  <h1 class="w3-margin w3-jumbo company-header-h1">IBM</h1>
	  <p class="w3-xlarge company-slogan">THINK</p>
	  <a href="https://krb-sjobs.brassring.com/TGnewUI/Search/Home/Home?partnerid=26059&siteid=5016#home" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
      	IBMers believe in progress - that the application of intelligence, reason and science can improve business, society and the human condition
      </h5>

      <h5>IBM has developed a thoughtful, comprehensive approach to corporate citizenship that we believe aligns with IBM's values and maximised the impact we can make as a global enterprise. We focus on specific societal issues, including the environment, community economic development, education and skills, public health, literacy, language and culture.</h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/IBMLogo.jpg">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/IBMWatson.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
			<h5>From opportunity to offer, here's what to expect<br></h5>
			<p style="font-style: italic; font-size: 12px;">Please note- The process steps listed below are shared for your general understanding of our evaluation methodology and are purely indicative. Actual evaluation process may vary based on aspects like profile, position, role and its requirements.</p><br>

			<dl>
				<dt>1. Apply</dt>
				<dd>Once you find a role that interests you, the first step is to complete your application online.</dd>

				<dt>2. Screening</dt>
				<dd>Your application will be read by real IBMers who are experts in screening resumes and specialists in their respective fields.</dd>

				<dt>3. Online assessments</dt>
				<dd>You may be asked to complete some of our online assessments, which will vary depending on the role you applied to.</dd>
			
				<dt>4. Assessment Center / interview</dt>
				<dd>If you're successful in completing the assessments, the next stage may involve you being invited for an interview or Assessment Center.</dd>

				<dt>5. Decision / offer</dt>
				<dd>IBM keep you regularly informed of any updates with your application status along the way. If you would like feedback following an interview we are always happy to help - just ask.</dd>
				
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