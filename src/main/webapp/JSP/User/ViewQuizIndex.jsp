<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!--
	This page is used to show Quiz Index page, from where user can redirect to various pages as
		ViewQuizTechnicalAndHRFAQ.jsp page
		ViewQuizTopicWise.jsp&topic=""
-->

    
<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n ViewQuizIndex.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Quiz Index</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="../../CSS/Quiz/UserViewQuizIndex.css">
</head>
<body>

<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->


<!-- Page content -->
<div class="w3-content w3-padding container-quiz-topic">

  <!-- Quiz Topics Section -->
  <div class="w3-container container-page-heading" id="projects">
    <h3 class="w3-border-bottom w3-border-black w3-padding-16"> <span style="font-size:40px" class="material-icons">tips_and_updates</span> Interview FAQ & Quiz Topics</h3>
  </div>

  <!-- Row 1 "Interview FAQ" -->
  <div class="w3-row-padding">
    <h3>Interview FAQ</h3>
    <div class="w3-col l3 m6 w3-margin-bottom">
   <!-- Link to Technical&HR FAQ Page -->
      <a href="ViewQuizTechnicalAndHrFAQ.jsp">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Interview</div>
          <img src="../../Images/Quiz/InterviewFAQ.jpg" alt="InterviewFAQ.jpg" style="width:100%">
        </div>
      </a>
    </div>
  </div>


  <!-- Row 2 "General Aptitude Quiz" -->
  <div class="w3-row-padding">
    <h3>General Aptitude & GK</h3>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=English -->
      <a href="../Quiz/QuizTopic.jsp?quizType=English" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">English</div>
          <img src="../../Images/Quiz/englishQuiz.jpg" alt="englishQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=Reasoning -->
      <a href="../Quiz/QuizTopic.jsp?quizType=Reasoning" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Reasoning</div>
          <img src="../../Images/Quiz/reasoningQuiz.jpg" alt="reasoningQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=CurrentAffairs -->
      <a href="../Quiz/QuizTopic.jsp?quizType=CurrentAffairs" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Current Affairs</div>
          <img src="../../Images/Quiz/CurrentAffairs.jpg" alt="CurrentAffairs.jpg" style="width:100%">
        </div>
      </a>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=Gk -->
      <a href="../Quiz/QuizTopic.jsp?quizType=Gk" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">GK</div>
          <img src="../../Images/Quiz/gkQuiz.jpg" alt="gkQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>
  </div>


  <!-- Row 3 "Programming Quiz" -->
  <div class="w3-row-padding">
    <h3>Programming</h3>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=HtmlCss -->
      <a href="../Quiz/QuizTopic.jsp?quizType=HtmlCss" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">HTML | CSS</div>
          <img src="../../Images/Quiz/htmlcssQuiz.jpg" alt="htmlcssQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>
    
    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=Java -->
      <a href="../Quiz/QuizTopic.jsp?quizType=Java" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Java</div>
          <img src="../../Images/Quiz/javaQuiz.jpg" alt="javaQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=Python -->
      <a href="../Quiz/QuizTopic.jsp?quizType=Python" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">Python</div>
          <img src="../../Images/Quiz/pythonQuiz.jpg" alt="PythonQuiz.jpg" style="width:100%">
        </div>
      </a>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
    <!-- Link to take Quiz with parameter quizType=Php -->
      <a href="../Quiz/QuizTopic.jsp?quizType=Php" target="_blank">
        <div class="w3-display-container quiz-specific-topic-box">
          <div class="w3-display-topleft w3-black w3-padding">PHP</div>
          <img src="../../Images/Quiz/phpQuiz.jpg" alt="phpQuiz.jpg" style="width:100%">
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

