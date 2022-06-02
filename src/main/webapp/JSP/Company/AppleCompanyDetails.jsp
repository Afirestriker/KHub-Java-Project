<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on any Apple company image this page will be called

	This page is showing details:
		About Apple Organization and its Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n AppleCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Apple Info</title>
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
<header class="w3-container w3-center company-header apple-header" style="padding:128px 16px;">
	  <h1 class="w3-margin w3-jumbo company-header-h1">APPLE</h1>
	  <p class="w3-xlarge company-slogan">Join us. Be you.</p>
	  <a href="https://jobs.apple.com/en-in/search?location=india-INDC" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
				Apple Inc. is an American multinational technology company that specializes in consumer electronics, software and online services. Apple is the largest information technology company by revenue, totaling US$365.8 billion in 2021) and, as of January 2021, it is the world's most valuable company, the fourth-largest personal computer vendor by unit sales and second-largest mobile phone manufacturer. It is one of the Big Five American information technology companies, alongside Alphabet, Amazon, Meta, and Microsoft.
			</h5>
      <h5>
      	Apple is a diverse collective of thinkers and doers, continually reimagining what's possible to help everyone do what they love in new ways. And the same innovation that goes into their products also applies to their practices - strengthening their commitment to leave the world better than it was found.
      </h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/AppleIcon.png">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/AppleIcon.png">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
				<h5>
					This is where individual imaginations gather together, committing to the values that lead to great work. Here, you'll do more than join something - you'll add something.
					<br>

					The Apple recruitment process is made of four different stages; each requiring you to do your best and outperform your competitors if you want to land your dream job.<br><br>

					This step-by-step guide provides you with expert tips for each of the stages of Apple's recruitment process, which is as follows:<br>
				</h5>
				<dl>
					<dt>1. Apple Online Application</dt>
					<dd>This part of the recruitment process is your first chance to set a good impression and stand out from your competition. The online form will ask you to provide details of your education and any academic results, as well as your work experience. </dd>
				
					<dt>2. Apple Telephone interview</dt>
					<dd>After you passed the online tests stage, you will be invited to the Apple office for their first round interview. This is a chance for you to demonstrate your passions and skills that would make you suitable for the role. <br> 
					It will be conducted over the phone and will be competency based (CBI). We recommend that you consider past projects you have worked on, in your professional and educational experiences, and think about what your role was, what you achieved, and how you approached any problems.</dd>

					<dt>3. Apple Assessment Centre</dt>
					<dd>The Apple Assessment Centre will be a chance for you to network with professionals working at Apple, and learn more about the company. It is the perfect time for you to get a better insight into what it is like to work at Apple.
					<br>
					The exercises you might be expected to take are:<br>
					<ul>
						<li>Apple Group Exercise</li>
						<li>Apple Written Exercise</li>
						<li>Apple Role Play Exercise</li>
					</ul>
					</dd>

					<dt>4. Apple Final Interviews</dt>
					<dd>Congratulations, you've reached the last stage of Apple's recruitment process. This stage will consist of a one-on-one interview with a director or senior manager from the business area you wish to join. Interviews will be competency based, and will be a final chance for you to demonstrate your passion, skills and enthusiasm for wanting to work at Apple.</dd>

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