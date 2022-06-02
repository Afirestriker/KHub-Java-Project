<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="../User/UserError.jsp"%>


<!--
	This page is called from JSP/User/ViewCompanyIndex.jsp file 
		whenever user click on any PWC company image this page will be called

	This page is showing details:
		About PWC Organization and its Selection Process
		
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS File
-->


<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n PWCCompanyDetails.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>PWC Info</title>
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
<header class="w3-container w3-center company-header pwc-header" style="padding:128px 16px;">
	  <h1 class="w3-margin w3-jumbo company-header-h1" style="font-weight: bold;">pwc</h1>
	  <p class="w3-xlarge company-slogan">Building trust for today and tomorrow.</p>
	  <a href="https://www.pwc.in/careers/job-search.html" target="_blank"><button class="w3-padding-large w3-large w3-margin-top">Career Page</button></a>
</header>
<!-- Close: Section 1: Header -->

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> About</h1>
      <h5 class="w3-padding-32">
				PricewaterhouseCoopers is a multinational professional services network of firms, operating as partnerships under the PwC brand. PwC ranks as the second-largest professional services network in the world and is considered one of the Big Four accounting firms, along with Deloitte, EY and KPMG.
			</h5>
      <h5>
      	The purpose at PwC is to build trust in society and solve important problems. PWC is a network of firms in 156 countries with over 295,000 people who are committed to delivering quality in assurance, advisory and tax services.
      </h5>
    </div>

    <div class="w3-third w3-center">
      <img class="w3-padding-64 iconFirst-margin-left" src="../../Images/Company/pwcIcon.png">
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img class="w3-padding-64 w3-margin-right" src="../../Images/Company/pwcIcon2.jpg">
    </div>

    <div class="w3-twothird">
      <h1 class="company-section-title"><i class="fa fa-caret-right"></i> Hiring Process</h1>
      	<div class="company-hiring-process-content">
				<h5>
					Working with pwc, you will have unique access to global knowledge networks and the opportunity to learn from highly skilled professionals
					<br>

					Shedding a light on the recruitment process. PWC selection process consists of a number of stages through which PWC come to understand your experience and motivation.<br><br>

					Details on the stages are below, but they can vary from country to country. Familiarise yourself with all of them and after you have applied, a manager will confirm what your next steps are!<br>
				</h5>
				<dl>
					<dt>1. Application</dt>
					<dd>Your journey starts with the application. When you apply for a job on our webpage, you will be asked to create an account to our personal system Workday. In your Workday account you can check the progress of our application during the recruitment process.</dd>
				
					<dt>2. Game-based assessment</dt>
					<dd>Once your application is accepted by a recruiter, you will get an email invitation to a quick and enjoyable set of games. You will be asked to undertake a series of short challenges, which are designed to measure several different skills and abilities in an interactive and stimulating way. Those should take you no more than 15 minutes.</dd>

					<dt>3. Video interview</dt>
					<dd>This is a unique opportunity to bring your application to life and to stand out from the rest. A video interview shows who you are much better than a paper cover letter attached to your CV.</dd>

					<dt>4. Assessment Center</dt>
					<dd>The assessment center is a full-day event consisting of two to three stages, such as group exercises, interviews and exams.
					This may sound like a lot, but it is a great opportunity for you to show off a range of skills and how motivated you are.  It is also a chance to meet potential future colleagues and to learn more about PwC and our corporate culture..</dd>

					<dt>5. Interview with manager and/or partner</dt>
					<dd>The one-on-one interview provides you with an opportunity to display your best qualities. PWC are looking for evidence of your skills, experience and abilities. They also want to see that you have carefully considered your career choice. You should be able to demonstrate your clear interest in the business world and PwC, and that you have what it takes to be a "PwC Professional".</dd>

					<dt>6. Offer and pre-hire portal</dt>
					<dd>If you are offered a position with PwC and you accept it, you will be invited to join the portal Look Inside for new joiners to learn more about the firm's corporate culture, what your first days and months will look like and how to connect with PWC and other new joiners. You can also initiate this by connecting with your recruiter.</dd>

					<dt>7. Start date</dt>
					<dd>You will receive practical information about your first day from your recruiter or any other PwC representative in your country. You will be most probably asked to do some preparations before your start date such as providing some personal information or/and documents. Please check your email and follow the instructions. First working day you will receive all the equipment needed and do not worry - you will not be alone in this as we have a buddy system so you will be assigned with somebody who will help you with all necessary things. Good luck!</dd>

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