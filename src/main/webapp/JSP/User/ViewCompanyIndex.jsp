<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!--
	This page is used to show Company Index page, from where user can redirect to 
		specific company details page stored in JSP/Company/ folder
-->

    
<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n ViewCompanyIndex.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Top Organizations</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="../../CSS/Company/UserViewCompanyIndex.css">
</head>
<body>

<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->


<!-- Page content -->
<div class="w3-content w3-padding container-quiz-topic">

  <!-- Quiz Topics Section -->
  <div class="w3-container container-page-heading" id="projects">
    <h3 class="w3-border-bottom w3-border-black w3-padding-16"> <span style="font-size:40px" class="material-icons">business</span> Company Details</h3>
  </div>


  <!-- Row 1 "Big 4" -->
  <div class="w3-row-padding">
    <h3>Big 4</h3>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/DeloitteCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Deloitte</div>
          <img src="../../Images/Company/Deloitte.jpg" alt="Deloitte.jpg" style="width:100%">
        </div>
      </a>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/PWCCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">PwC</div>
          <img src="../../Images/Company/PWC.jpg" alt="PWC.jpg" style="width:100%">
        </div>
      </a>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/KPMGCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">KPMG</div>
          <img src="../../Images/Company/KPMG.jpg" alt="KPMG.jpg" style="width:100%">
        </div>
      </a>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/EYCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Ernst & Young (EY)</div>
          <img src="../../Images/Company/EY.jpg" alt="EY.jpg" style="width:100%">
        </div>
      </a>
    </div>
  </div>


  <!-- Row 2 "Tech Company" -->
  <div class="w3-row-padding">
    <h3>Tech Company</h3>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/GoogleCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Google</div>
          <img src="../../Images/Company/Google.jpg" alt="Google.jpg" style="width:100%">
        </div>
      </a>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/MicrosoftCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Microsoft</div>
          <img src="../../Images/Company/Microsoft.jpg" alt="Microsoft.jpg" style="width:100%">
        </div>
      </a>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/AppleCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Apple</div>
          <img src="../../Images/Company/Apple.jpg" alt="Apple.jpg" style="width:100%">
        </div>
      </a>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <a href="../Company/IBMCompanyDetails.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">IBM</div>
          <img src="../../Images/Company/IBM.png" alt="IBM.png" style="width:100%">
        </div>
      </a>
    </div>
  </div>

<!-- End page content -->
</div>

<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>
</html>