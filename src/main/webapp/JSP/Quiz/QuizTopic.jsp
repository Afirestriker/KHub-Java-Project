<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="../User/UserError.jsp"%>

<!--
	This page is called from JSP/User/ViewQuizIndex.jsp file 
		whenever user click on any quiz type this page will be called
		and also a key-value parameter will be passed to this page
			as -> QuizTopic.jsp?type="quiz-topic-name"
			Example: -> QuizTopic.jsp?type="java"

	This page is used for taking Quiz, 
		there's no any MySQL for this page,
		we have use HTML i.e JSP, CSS, and JavaScript file
		
	The QuizTopic.jsp file, and the CSS file is common
		Only changes is in the JS file, where the questions are saved 
		i.e => <quiz-topic-name>QuizQuestions.js
		which is saved in JS/Quiz folder of this project workspace
		
	Logic:
		When this page is called from JSP/User/ViewQuizIndex.jsp page
		it will pass parameter in URL.
		We fetched that parameter value and then using JSP Expression tag  put it in
			Page Tab-Title
			Quiz Title, for Main heading i.e "Ready! <quiz name> Quiz
			and also in Quiz-box heading 
-->


<%
	/* Fetching passed parameter in URL bar */
	String quizType = request.getParameter("quizType");	

	/* Print message on console, indicating which page is visited */
	System.out.println("\n QuizTopic.jsp?quizType=" + quizType + " Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Take <%= quizType %> Quiz</title>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
    <link rel="stylesheet" href="../../CSS/Quiz/QuizTopic.css">
    
    <!-- FontAweome CDN Link for Icons-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>

<!-- start Quiz button -->
    <div class="start_btn"><button>Ready! <%= quizType %> Quiz</button></div>

    <!-- Info Box -->
    <div class="info_box">
        <div class="info-title"><span> Quiz Rules!</span></div>
        <div class="info-list">
            <div class="info">1. You will have only <span>30 seconds</span> to attempt each question.</div>
            <div class="info">2. Once you select your answer, it can't be undone.</div>
            <div class="info">3. You can't select any option once time goes off.</div>
            <div class="info">4. Once quiz started, you can't exit till completed.</div>
            <div class="info">5. You'll get points on the basis of your correct answers.</div>
            <div class="info">6. You'll be able to see your score only after the quiz ends.</div>
        </div>
        <div class="buttons">
            <button class="quit">Exit Quiz</button>
            <button class="restart">Start Quiz</button>
        </div>
    </div>

    <!-- Quiz Box -->
    <div class="quiz_box">
        <header>
            <div class="title"> <%= quizType %> MCQ</div>
            <div class="timer">
                <div class="time_left_txt">Seconds Left</div>
                <div class="timer_sec">--</div>
            </div>
            <div class="time_line"></div>
        </header>
        <section>
            <div class="que_text">
                <!-- Here I've inserted question from JavaScript -->
            </div>
            <div class="option_list">
                <!-- Here I've inserted options from JavaScript -->
            </div>
        </section>

        <!-- footer of Quiz Box -->
        <footer>
            <div class="total_que">
                <!-- Here I've inserted Question Count Number from JavaScript -->
            </div>
            <button class="next_btn">Next Que >> </button>
        </footer>
    </div>

    <!-- Result Box -->
    <div class="result_box">
        <div class="icon">
            <img src="../../Images/KHubLogo.png">
            <!-- <i class="fas fa-crown"></i> -->
        </div>
        <div class="complete_text">Thank You for Taking this Quiz!</div>
        <div class="score_text">
            <!-- Here I've inserted Score Result from JavaScript -->
        </div>
        <div class="buttons">
            <button class="restart">Replay Quiz</button>
            <button class="quit">Exit Quiz</button>
        </div>
    </div>

    
    <!-- Inside this JavaScript file I've inserted Questions and Options only -->
    <script src="../../JS/Quiz/<%=quizType%>QuizQuestions.js"></script>

    <!-- Inside this JavaScript file I've coded all Quiz Codes -->
    <script src="../../JS/Quiz/QuizMainScript.js"></script>

</body>
</html>