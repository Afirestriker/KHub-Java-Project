
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" %>

<% 
	/* This statement display a message on consle */
	System.out.print("\n\n Index.jsp called \n ");
%>

<!-- NOTE: At the end of this page, Header.js script file is link for
     changing menu background on scroll Y axis
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Welcome To KHub!</title>
	
	<!-- Linking, with specific .css file i.e index.css file  -->
	<link rel="stylesheet" type="text/css" href="../CSS/index.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	

	<!-- Display icon is title bar -->
	<link rel="icon" type="image/png" href="../Images/KHubLogo.png">
</head>
<body>

<!-- Menu Section -->
	<%@include file="Header.jsp" %>	
<!-- End of Menu  Section -->

<!-- Home Section -->
	<section id="index">
		<div class="index container">
			<h1>Welcome to, <span>KHub</span> </h1>
		</div>
	</section>
<!-- End of Home Page Section -->


<!-- About Section -->
	<section id="about">
		<div class="about container">
			
			<!-- About section Header -->
			<div class="about-header">
				<h1 class="section-title">About KHub</h1>
				<p>
				The purpose behind "KHub" application is to develop a system that effectively manages data related to placement process, provide facility to auto-generate resume in multiple format.
				Also provide resource such as practice-quiz, Technical & HR interview question & their sample answers to crack test and interviews.
				Moreover display top company Info, their Selection-criteria, and Career page link.
				</p>
			</div>

			<br><br>
			<h2 class="team-heading">Meet The Team</h2>

			<!-- About section image gallery -->
			<!-- Image1 TeamMember1 -->
			<div class="about-body">
				
				<!-- TeamMember1 image Nikhil Jain -->
				<div class="team-img-gallery">
					<img src="../Images/Team/TeamMember2.jpg" alt="Nikhil Jain Pic" style="object-fit: fill;">
					<div class="img-desc">
						<div class="name"> Nikhil Jain </div>
						<div class="position">Designer plus Coder</div>
						<div class="aboutme">Hi, I Like Doing Research And Talking With People</div>
						<div class="email">1052190283@mitwpu.edu.in</div>
					</div>
				</div>
				
				<!-- TeamMember2 Image Ashish Agrawal -->
				<div class="team-img-gallery">
					<img src="../Images/Team/TeamMember.jpg" alt="Ashish Agrawal Pic" style="object-fit: fill;">
					<div class="img-desc">
						<div class="name"> Ashish Agrawal </div>
						<div class="position">Designer plus Coder</div>
						<div class="aboutme">Hi, I Like Designing, Programming And Playing Soccer</div>
						<div class="email">1052190598@mitwpu.edu.in</div>
					</div>
				</div>

				<!-- TeamMember3 Image Prof. Vrushali Kulkarni-->
				<div class="team-img-gallery">
					<img src="../Images/Team/MaamIcon.jpg" alt="Prof. Vrushali Kulkarni Pic" style="object-fit: fill;">
					<div class="img-desc">
						<div class="name"> Prof. Vrushali Kulkarni </div>
						<div class="position">Guide plus Mentor</div>
						<div class="aboutme">She is Our Guide plus Mentor For This Project</div>
						<div class="email">vrushali.kulkarni.vf@mitwpu.ac.in</div>
					</div>
				</div>
		</div>
	  </div>
	</section>
<!-- End of About Section -->


<!-- Contact section -->
	<section id="contact">
		<div class="contact container">
			
			<!-- Contact header -->
			<div class="contact-header">
				<h1 class="section-title">Contact</h1>
				<hr>
			</div>

			<!-- Contact form -->
			<div class="contact-form">
				<p>Any Query, Feel Free To Ask</p><br>
				
				<% 
					String msg = request.getParameter("msg");
					String name = request.getParameter("name");
					if("valid".equals(msg))
					{
				%>
						<h3>Thank You <%= name %>, Your message is submitted</h3>
				<%	}
					
					if("invalid".equals(msg))
					{
				%>
						<h3>Error in sending message, Try Again! </h3>
				<%	}
				%>
				
				<form action="addMessage.jsp" method="post" >
					<input type="text" name="name" placeholder="Name*" required> <br>
					<input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Email*" required> <br>
					<input type="text" name="place" placeholder="Place*" required> <br>
					<input type="text" name="comment" placeholder="Comment*" required> <br>
					<input type="submit" name="SendMessage" value="SEND MESSAGE"> <br>
				</form>
			</div>

		</div>
	</section>

<!-- End of Contact section -->



<!-- Company List section -->
	<section id="comp-list">

		<div class="comp-list container">

			<h1 class="section-title">Top Organization</h1>

			<div class="company-img-gallery">
  				<a target="_blank" href="../Images/Company/Microsoft.jpg" title="Microsoft">
    				<img src="../Images/Company/Microsoft.jpg" alt="Microsoft" width="200" height="200">
  				</a>
			</div>

			<div class="company-img-gallery">
  				<a target="_blank" href="../Images/Company/Google.jpg" title="Google">
    				<img src="../Images/Company/Google.jpg" alt="Google" width="200" height="200">
  				</a>
			</div>

			<div class="company-img-gallery">
  				<a target="_blank" href="../Images/Company/Apple.jpg" title="Apple">
    				<img src="../Images/Company/Apple.jpg" alt="Apple" width="200" height="200">
  				</a>
			</div>

			<div class="company-img-gallery">
  				<a target="_blank" href="../Images/Company/Samsung.jpg" title="Twitter">
    				<img src="../Images/Company/Samsung.jpg" alt="Twitter" width="200" height="200">
  				</a>
			</div>
			
		</div>
	</section>
<!-- End of company list section -->


<!-- footer section -->
	<% /* Adding Footer Page */ %>
	<%@include file="Footer.jsp" %>
<!-- End footer section -->

</body>
<!-- Header.js script file is link for changing menu background on scroll Y axis -->
<script src="../JS/Header.js"></script>
</html>

