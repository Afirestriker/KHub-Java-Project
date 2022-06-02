<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="UserError.jsp"%>

<!--
	This page is used to show user FAQ for Technical and HR round,
		there's no any MySQL for this page,
		we have use 
			CSS, JS file
-->

    
<%
	/* Print message on console, indicating which page is visited */
	System.out.println("\n ViewTechnicalAndHrFAQ.jsp Called \n"); 
	
	/* collect username value, from session set in JSP/LoginAction.jsp page */
	String username = session.getAttribute("username").toString();
%>

    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Interview & HR FAQ</title>
	<script>document.getElementsByTagName("html")[0].className += " js";</script>
	<link rel="icon" href="../../Images/KHubLogo.png" type="image/png">
	<link rel="stylesheet" href="../../CSS/Quiz/ViewQuizTechnicalAndHrFAQ.css">
</head>
<body>

<!-- Menu Section -->
	<%@include file="UserHeader.jsp" %>	
<!-- End of Menu  Section -->

<!-- Header section for Image and Page Title -->
	<header class="cd-header flex flex-column flex-center">
	  <div class="text-component text-center">
	    <br><br>
		    <img src="../../Images/user/img-FAQ.png" alt="img-FAQ" title="Technical & HR FAQ">
		    <h1 style="font-weight: bold;">Technical & HR...</h1>
	  </div>
	</header>
<!-- Close: Header section for Image and Page Title -->

<!-- Section for Topic list, and all category FAQ -->
	<section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">

	<!-- Left side Container for Category Topic List -->
		<ul class="cd-faq__categories">
			<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#hrfaq">HR FAQ</a></li>
			<li><a class="cd-faq__category truncate" href="#sdfaq">Software Developer</a></li>
			<li><a class="cd-faq__category truncate" href="#stfaq">Software Tester</a></li>
			<li><a class="cd-faq__category truncate" href="#accountingfag">Accounting</a></li>
			<li><a class="cd-faq__category truncate" href="#marketingfaq">Marketing</a></li>
			<li><a class="cd-faq__category truncate" href="#">Others</a></li>
		</ul> <!-- cd-faq__categories -->
	<!-- Close: Left side Container for Category Topic List -->


	<!-- Right side container for all category Questions and Answers -->
		<div class="cd-faq__items">

			<!-- Container for HR FAQ Category with ID -->
			<ul id="hrfaq" class="cd-faq__group">
				<!-- This is Category Title -->
				<li class="cd-faq__title"><h2>HR FAQ</h2></li>
				
		<!-- 1. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Tell me something about yourself in brief?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	This is one of the most frequently asked questions during an HR round interview.Your answer has to be short, crisp and to the point. Here are some possible high-impact answers to help you leave a great impression.<br><br>
	            	Example: <br>
	            	"Well, I am a confident, hard-working and a very professional individual. I have also been a good mentor to my juniors and never hesitate to guide them. On the other hand, I am a creative person and I love to test my boundaries."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 1. Question & Answer -->

		<!-- 2. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What is your greatest fear?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Remember that this is a stress test question. Don't simply talk about your weaknesses, your interviewer genuinely wants you to talk about your loopholes! <br><br>
	            	Example: <br>
	            	"I work too hard sometimes and care too much about my work. I take my tasks back home and work even during the weekends. You can call me a workaholic, but my family always points out that this is not right. Slowly and steadily I am realizing that speed and working smartly are the key. So, I have begun to reach out to my colleagues for ready-to-use workarounds so that I can give more time to my family."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 2. Question & Answer -->

		<!-- 3. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Why should we hire you?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Most freshers might treat this as a challenging question. Remember that it's not some sort of a blow to yo'ur ego, but a stress test which you can pass smoothly with a powerful answer. <br><br>
	            	Example<br>
	            	"Sir/Ma'am, I have all the requisite qualifications and skills. I can do the work that the profile requires me to do. Besides, I have the capacity to deliver exceptional results. I can blend into mixed cultures and will fit in beautifully, which will make me a great addition to the team. For a fresher, I have the right amount of exposure into this industry, as I have completed my internship with XYZ company only recently."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 3. Question & Answer -->

		<!-- 4. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						How do you work under pressure?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Example<br>
	            	"I like to work under pressure. It brings out the best in me as well as helps me grow. I learn faster and perform well when I have a strict deadline, because I plan accordingly, work in a more organized manner and also tend to finish my tasks with more efficiency. In my current job role, deadlines and 'pressure situations' are common, and I have grown immune to them."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 4. Question & Answer -->

			</ul> <!-- cd-faq__group -->
			<!-- Close: Container for HR FAQ Category with ID -->

			<!-- Container for Software Developer FAQ Category with ID -->
			<ul id="sdfaq" class="cd-faq__group">
				<!-- This is Category Title -->
				<li class="cd-faq__title"><h2>Software Developer FAQ</h2></li>
				
		<!-- 1. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Why Did You Choose a Career in Software Development?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	I've always had a knack for solving problems and I feel that software does just that. I chose a career in software development because I find satisfaction in helping consumers, companies, and organizations find the solutions they need, from creating spreadsheets to designing skyscrapers. Additionally, I have experience with a variety of programming languages and enjoy working with them. For example, while I was in college, I helped a relative build a business website and web app. I also built human resources software at my prior job.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 1. Question & Answer -->

		<!-- 2. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What Programming Languages Are You Proficient In?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	I first learned how to use JavaScript, CSS, and HTML in college. Those were the languages I used the most when I helped a relative build a business site and web app. But as part of that project, I started learning how to use Python and PHP. In addition, I used C++ and Java to create HR software at my previous job. I found the C++ language to be the most flexible. In fact, it was the primary building block for the HR software I helped develop.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 2. Question & Answer -->

		<!-- 3. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Can You Describe the Steps Involved in Software Development?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Initial planning and brainstorming is the first step in software development. During this stage, I determine the purpose and functionality of a program. The next step involves team analysis of the project, including the time frame and which tools and team members are needed. Then comes the design stage, where a program is designed by a team of software engineers before moving on to the development stage. Once in development, I step in to transform the design into functional software. It's then shipped off to quality assurance to identify any defects or bugs. Lastly, the software is officially installed and launched.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 3. Question & Answer -->

		<!-- 4. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						How Do You Ensure Quality and Fix Errors.
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	I usually launch code-based testing to identify and diagnose potential errors. When I helped test the HR software, I asked another member of the team peer review my code. They found one logical error that resulted in incorrect output. Once the coding error was corrected, I used Dynamic Testing to evaluate the software for functionality. By then, it appeared to work as projected.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 4. Question & Answer -->

			</ul> <!-- cd-faq__group -->
			<!-- Close: Container for Software Developer FAQ Category with ID -->

			<!-- Container for Software Developer FAQ Category with ID -->
			<ul id="stfaq" class="cd-faq__group">
				<!-- This is Category Title -->
				<li class="cd-faq__title"><h2>Software Tester FAQ</h2></li>
				
		<!-- 1. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What is white box testing and list the types of white box testing?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	White box testing technique involves selection of test cases based on an analysis of the internal structure (Code coverage, branches coverage, paths coverage, condition coverage, etc.) of a component or system. It is also known as Code-Based testing or Structural testing. Different types of white box testing are
	            	<br> 1. Statement Coverage
	            	<br> 2. Decision Coverage
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 1. Question & Answer -->

		<!-- 2. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						In white box testing, what do you verify?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	In white box testing following steps are verified.
	            	<br> 1. Verify the security holes in the code
	            	<br> 2. Verify the incomplete or broken paths in the code
	            	<br> 3. Verify the flow of structure according to the document specification
	            	<br> 4. Verify the expected outputs
	            	<br> 5. Verify all conditional loops in the code to check the complete functionality of the application
	            	<br> 6. Verify the line by line coding and cover 100% testing
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 2. Question & Answer -->

		<!-- 3. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What is black box testing? What are the different black box testing techniques?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Black box testing is the software testing method which is used to test the software without knowing the internal structure of code or program. This testing is usually done to check the functionality of an application. The different black box testing techniques are
	            	<br> 1. Equivalence Partitioning
					<br> 2. Boundary value analysis
					<br> 3. Cause-effect graphing
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 3. Question & Answer -->

		<!-- 4. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What are verification and validation?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Verification is a process of evaluating software at the development phase. It helps you to decide whether the product of a given application satisfies the specified requirements. Validation is the process of evaluating software at the after the development process and to check whether it meets the customer requirements.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 4. Question & Answer -->

			</ul> <!-- cd-faq__group -->
			<!-- Close: Container for Software Tester FAQ Category with ID -->

			<!-- Container for Software Developer FAQ Category with ID -->
			<ul id="accountingfag" class="cd-faq__group">
				<!-- This is Category Title -->
				<li class="cd-faq__title"><h2>Accounting FAQ</h2></li>
				
		<!-- 1. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What are the different types of accounting?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Financial Accounting - This branch of accounting records, summarises and reports the business transactions that take place over a time period in an organisation. It is required in both the private and public sectors. 
					<br><br>
					Administrative Accounting - Administrative accounting is focused on the administrative aspects of the company and is used above all to assess the fulfilment of the established objectives and improve the implemented strategy. It is very useful for making forecasts and planning the actions and resources to be used.
					<br><br>
					Tax Accounting -Tax accounting helps to register and prepare reports related to tax returns to the public treasury and payment of taxes.
					<br><br>
					Cost Accounting - This type of accounting is more focused on companies of an industrial nature. It helps to make a detailed analysis of the unit costs of production, sales, and, in general, of the production process that the company carries out.
					<br><br>
					Management Accounting - Management accounting has a broader vision than cost accounting since it records all the economic and financial information of the company to be able to make short-term and long-term decisions. 
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 1. Question & Answer -->

		<!-- 2. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Walk me through the three financial statements.
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	The balance sheet shows a company's assets, its liabilities, and shareholders' equity.  The income statement outlines the company's revenues and expenses.  The cash flow statement shows the cash flows from operating, investing, and financing activities.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 2. Question & Answer -->

		<!-- 3. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						How does an inventory write-down affect the three statements?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	On the balance sheet, the asset account of inventory is reduced by the amount of the write-down, and so is shareholders' equity. The income statement is hit with an expense in either COGS or a separate line item for the amount of the write-down, reducing net income.  On the cash flow statement, the write-down is added back to CFO as it's a non-cash expense but must not be double-counted in the changes of non-cash working capital.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 3. Question & Answer -->

		<!-- 4. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						If I had only one statement and wanted to review the overall health of a company, which statement would I use and why?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	Cash is king.  The cash flow statement gives a true picture of how much cash the company is generating.  That being said, it's important to note that all three statements truly are required to get a full picture of the health of a company.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 4. Question & Answer -->

			</ul> <!-- cd-faq__group -->
			<!-- Close: Container for Accounting FAQ Category with ID -->

			<!-- Container for Software Developer FAQ Category with ID -->
			<ul id="marketingfaq" class="cd-faq__group">
				<!-- This is Category Title -->
				<li class="cd-faq__title"><h2>Marketing FAQ</h2></li>
				
		<!-- 1. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What inspired you to pursue a career in marketing?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	This is a very open-ended question that you can use to tell a story about how you became passionate about a career in marketing. You can talk about something you learned in school, a previous job you had, or even something that inspired you in day-to-day life:
	            	<br><br>
	            	Example:<br>
	            	"I have always had a strong creative side and an interest in visual arts. I started my own business while in school creating simple websites and promotional materials for local businesses. I think that experience combined with my education really solidified marketing as my career of choice, and I'm really excited to be interviewing for this opportunity."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 1. Question & Answer -->

		<!-- 2. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What social media channels are you familiar with?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	As a social media marketing manager, interviewers will expect you to be familiar with all major social media channels. If you have experience with more obscure platforms, this is the time to highlight those as well.
	            	<br><br>
	            	Example:<br>
	            	"I have experience using in my personal life and have also set up my professional profile online. I also have experience with social media advertising and its functionality."
					<br><br>
					A good follow-up question you can ask is: "Are there any other social media platforms your company is using?" This can be a great way to get the interviewer engaged in a discussion about how the company uses social media.
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 2. Question & Answer -->

		<!-- 3. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						What do you think are the three essential skills for a career in marketing?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	This is your opportunity to demonstrate to your interviewer that you understand what skills and abilities they're looking for in a candidate. Your answer to this question should reference some of the skills that were outlined in the job ad like this:
	            	<br><br>
	            	"First of all, I think great communication skills are essential. A marketer needs to understand the requirements of the client and be able to present ideas and concepts. Being able to stay organized and work in a fast-paced environment is also an essential skill. I think being pro-active and trying to anticipate client needs is also very valuable."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 3. Question & Answer -->

		<!-- 4. Question & Answer -->
				<li class="cd-faq__item">
					<!-- Question Here -->
					<a class="cd-faq__trigger" href="#0"><span>
						Where do you see yourself in five years?
					</span></a>
					<div class="cd-faq__content">
	          <div class="text-component">
	      	<!-- Answer Here -->
	            <p>
	            	With this question, your interviewer is hoping to get an idea for your career ambitions. They want to know whether you’re looking for a fast track up the corporate ladder or whether there might be other training or schooling you’re interested in pursuing.
					<br>Try to craft an answer something like this:
					<br><br>
					"This would be my first professional marketing position, and I want to work hard and learn everything I can. In five years, I hope to have had one or two more senior marketing positions and determine what area of marketing I would like to specialize in."
	            </p>
	          </div>
					</div> <!-- cd-faq__content -->
				</li>
		<!-- Close: 4. Question & Answer -->

			</ul> <!-- cd-faq__group -->
			<!-- Close: Container for Marketing FAQ Category with ID -->


			
		</div> <!-- cd-faq__items -->
	<!-- Close: Right side container for all category Questions and Answers -->

		<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
	  
	  <div class="cd-faq__overlay" aria-hidden="true"></div>

	</section> <!-- cd-faq -->
<!-- Close: Section for Topic list, and all category FAQ -->


<!-- Footer Section -->
	<%@include file="../Footer.jsp" %>
<!-- Footer Section End -->

</body>

<script src="../../JS/Quiz/ViewQuizInterviewAndHrFAQutil.js"></script> <!-- util functions included in the CodyHouse framework -->
<script src="../../JS/Quiz/ViewQuizTechnicalAndHrFAQMain.js"></script>

</html>

<!-- 
CSS comments for future editing

 * Page margin top and bottom
 
 * Page Header Styling
 
 * Page Background color, FAQ Question Background color

 Topic Lists
 * Category Topic List item hover effect
 * Category Left Vertical Bar
 * Left side Topic List on Select Effect

 Topic Questions and Answer
 * Category heading for right section
 * Questions Sytling

-->
