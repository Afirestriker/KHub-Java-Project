package khubdb;

import java.sql.Connection;
import java.sql.Statement;

import hireupdb.DbConnection;

public class CreateTables {

	public static void main(String[] args) {

		//DbConnection is public class declared in DbConnection.java in khubdb package
		Connection con = DbConnection.getConnection();
		
	//Create Admin Table in khubv1 database
		try
		{	
			String adminTable = "CREATE TABLE Admin"
								+ "("
								+ "Username VARCHAR(50) PRIMARY KEY,"
								+ "Password VARCHAR(20) NOT NULL"
								+ "); ";

			Statement st = con.createStatement();
			st.executeUpdate(adminTable);
				System.out.println("Table 'Admin' Created");
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Admin Exception: " + e);
		}
		
		
	//Create Login Table in khubv1 database
		try
		{	
			String loginTable = "CREATE TABLE Login "
								+ "("
								+ "Email VARCHAR(320) PRIMARY KEY,"
								+ "Username VARCHAR(50) UNIQUE,"
								+ "Password VARCHAR(20) NOT NULL"
								+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(loginTable);
				System.out.println("Table 'Login' Created");
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Login Exception: " + e);
		}
		
		
	//Create Student_Personal_Detail Table in khubv1 database
		try
		{	
			String spdTable= "CREATE TABLE Student_Personal_Detail"
							+ "("
							+ "StuEmail VARCHAR(320) UNIQUE, "				//student email (collected from login table)
							+ "StuFirstName VARCHAR(50) NOT NULL, "     	//Student first name
							+ "StuLastName VARCHAR(50) NOT NULL, "      	//Student Last name 
							+ "StuBirthDate VARCHAR(12) NOT NULL, "			//Student Birth Date in varchar (Date format validation is done in front end part, while user filling form)
							+ "StuAge INT NOT NULL, "						//Student Age in integer (number)
							+ "StuMobile VARCHAR(20) NOT NULL, "			//Student Mobile Number with in Indian format with country code
							+ "StuGender ENUM('F', 'M', 'O') NOT NULL, "	//Student Gender (only M, F, O are allowed)
							+ "StuAddress VARCHAR(300) NOT NULL ,"			//Student Address (max 300 characters)
							+ "StuCity VARCHAR(50) NOT NULL, "				//Student City name
							+ "StuState VARCHAR(50) NOT NULL, "				//Student State name
							+ "StuCountry VARCHAR(50) NOT NULL, "			//Student country name
							+ "StuAbout VARCHAR(500) NOT NULL ,"			//More About Student (max 500 characters)
							+ "FOREIGN KEY (StuEmail) REFERENCES Login(Email) "	//Student email foreign key reference
							+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(spdTable);
				System.out.println("Table 'Student_Personal_Detail' Created");
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Student_Personal_Detail Exception: " + e);
		}
		
		
	//Create Student_Academic_Detail Table in khubv1 database
		try
		{	
			String spdTable= "CREATE TABLE Student_Academic_Detail"
							+ "("
							+ "StuEmail VARCHAR(320) UNIQUE, "										//Student email (collected from login table)

							+ "College_University_Name VARCHAR(300) NOT NULL ,"						//Student college University Name (maxlength 300 character)
							+ "College_Name VARCHAR(300) NOT NULL ,"								//Student college School Name (maxlength 300 character)
							+ "StuCourse ENUM('BBA', 'MBA', 'BCA', 'MCA', 'BE', 'ME') NOT NULL,"	//Student Course with pre-defined allowed values
							+ "College_Aggregate ENUM('A', 'B', 'C', 'D') NOT NULL, "				//Student College Aggregate with pre-defined allowed values
							+ "College_Start_Pass_Year VARCHAR(15) NOT NULL ,"						//Student college start pass year (maxlength 15 character)

							+ "12th_University_Name VARCHAR(300) NOT NULL ,"						//Student 12th University Name (maxlength 300 character)
							+ "12th_College_Name VARCHAR(300) NOT NULL ,"							//Student 12th School Name (maxlength 300 character)
							+ "12th_Grade ENUM('A', 'B', 'C', 'D') NOT NULL, "						//Student 12th grade with pre-defined allowed values
							+ "12th_Start_Pass_Year VARCHAR(15) NOT NULL ,"							//Student 12th start pass year (maxlength 15 character)

							+ "10th_University_Name VARCHAR(300) NOT NULL ,"						//Student 10th University Name (maxlength 300 character)
							+ "10th_School_Name VARCHAR(300) NOT NULL ,"							//Student 10th School Name (maxlength 300 character)
							+ "10th_Grade ENUM('A', 'B', 'C', 'D') NOT NULL, "						//Student 10th grade with pre-defined allowed values
							+ "10th_Start_Pass_Year VARCHAR(15) NOT NULL ,"							//Student 10th start pass year (maxlength 15 character)
							
							+ "FOREIGN KEY (StuEmail) REFERENCES Login(Email) "						//Student email foreign key reference
							+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(spdTable);
				System.out.println("Table 'Student_Academic_Detail' Created");
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Student_Academic_Detail Exception: " + e);
		}
		
		
	//Create Skills Table in khubv1 database
		try
		{	
			String skillsTable =  "CREATE TABLE Skills "
									+ "("
									+ "StuEmail VARCHAR(320) UNIQUE,"			//Student email (collected from login table)
									
									+ "Accounting INT NOT NULL DEFAULT 0 ,"				//Student Accounting skills value (1% to 100%)
									+ "Excel INT NOT NULL DEFAULT 0 ,"					//Student Excel skills value (1% to 100%)
									+ "Tally INT NOT NULL DEFAULT 0 ,"					//Student Tally skills value (1% to 100%)
									+ "Marketing INT NOT NULL DEFAULT 0 ,"				//Student Marketing skills value (1% to 100%)
									+ "Management INT NOT NULL DEFAULT 0 ,"				//Student Management skills value (1% to 100%)
									+ "Analytics INT NOT NULL DEFAULT 0 ,"				//Student Analytics skills value (1% to 100%)
									
									+ "HTML INT NOT NULL DEFAULT 0,"					//Student HTML skills value (1% to 100%)
									+ "CSS INT NOT NULL DEFAULT 0,"						//Student CSS skills value (1% to 100%)
									+ "JavaScript INT NOT NULL DEFAULT 0,"				//Student JavaScript skills value (1% to 100%)
									+ "C INT NOT NULL DEFAULT 0,"						//Student C skills value (1% to 100%)
									+ "CPP INT NOT NULL DEFAULT 0,"						//Student CPP skills value (1% to 100%)
									+ "Java INT NOT NULL DEFAULT 0,"					//Student Java skills value (1% to 100%)
									+ "Python INT NOT NULL DEFAULT 0,"					//Student Python skills value (1% to 100%)
									+ "PHP INT NOT NULL DEFAULT 0,"						//Student PHP skills value (1% to 100%)
									
									+ "Communication INT NOT NULL DEFAULT 0,"			//Student Communication skills value (1% to 100%)
									+ "Teamwork INT NOT NULL DEFAULT 0,"				//Student TeamWork skills value (1% to 100%)
									+ "Perseverance INT NOT NULL DEFAULT 0,"			//Student perseverance skills value (1% to 100%)
									+ "ProblemSolving INT NOT NULL DEFAULT 0,"			//Student Problem Solving skills value (1% to 100%)
									+ "TimeManagement INT NOT NULL DEFAULT 0,"			//Student Time Management skills value (1% to 100%)
									+ "Agility INT NOT NULL DEFAULT 0,"					//Student Agility skills value (1% to 100%)
									
									
									+ " FOREIGN KEY (StuEmail) REFERENCES Login(Email) "	//Student email foreign key reference
									+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(skillsTable);
				System.out.println("Table 'Skills' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Skills Exception: " + e);
		}
		
		
	//Create Company Table in khubv1 database
	/*
	 * try { String CompanyTable = "CREATE TABLE Company " + "(" +
	 * "StuEmail VARCHAR(320) UNIQUE," //Student email (collected from login table)
	 * + "CompanyName VARCHAR(500) NOT NULL ," //Company Name in which student is
	 * hired + "JoiningDate VARCHAR(20) NOT NULL ," //Company Joining Date +
	 * "Package VARCHAR(20) NOT NULL ," //Package value +
	 * "OfferLetterStatus ENUM('Recieved', 'Not-Recieved') NOT NULL ,"
	 * //OfferLetterStatus whether Recieved or Not-Recieved
	 * 
	 * + " FOREIGN KEY (StuEmail) REFERENCES Login(Email) " //Student email foreign
	 * key reference + "); ";
	 * 
	 * Statement st = con.createStatement(); st.executeUpdate(CompanyTable);
	 * System.out.println("Table 'Company' Created"); } catch(Exception e) {
	 * System.out.println("CreateTables Company Exception: " + e); }
	 */
		
	//Create Contacts Table in khubv1 database
		try
		{	
			String contactsTable =  "CREATE TABLE Contacts "
									+ "("
									+ "ContactName VARCHAR(50) NOT NULL, "
									+ "ContactEmail VARCHAR(320) NOT NULL, "
									+ "ContactPlace VARCHAR(20) NOT NULL, "
									+ "ContactComment LONGTEXT, "
									+ "ContactStatus VARCHAR(20) NOT NULL DEFAULT 'unread' "
									+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(contactsTable);
				System.out.println("Table 'Contacts' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Contacts Exception: " + e);
		}
		
	/*-------------------------------------------------------------------------------------------------------------------*/	

	//Create Job_Opportunity Table in khubv1 database
		try
		{	
			String JobOpportunity =  "CREATE TABLE Job_Opportunity "
									+ "("
									+ "OppID INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,"								//OppID to uniquely identify each opportunity
									+ "OppPublishDate VARCHAR(20) NOT NULL ,"										//Opp published date
									+ "OppEndDate VARCHAR(20) NOT NULL ,"											//Opp End Date
									+ "JobRole VARCHAR(500) NOT NULL ,"												//Job Role Name
									+ "CourseEligible VARCHAR(500) NOT NULL ,"										//Course for which this opp is applicable
									+ "CompanyName VARCHAR(500) NOT NULL ,"											//Company Name
									+ "JobLocation VARCHAR(500) NOT NULL ,"											//Job Location
									+ "JobType ENUM('Full-Time', 'Part-Time') NOT NULL ,"							//Job Type
									+ "MaxPackage VARCHAR(20) NOT NULL ,"												//Package annum value in lakh
									+ "JobDescription VARCHAR(1000) NOT NULL ,"										//Job Description
									+ "OppLink VARCHAR(2050) NOT NULL ,"											//Opp Link
									+ "OppStatus ENUM('Active', 'Inactive') NOT NULL DEFAULT 'Active' "				//Opp status whether Active or inactive
									
									+ "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(JobOpportunity);
				System.out.println("Table 'Job_Opportunity' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Job_Opportunity Exception: " + e);
		}
		
		
	//Create Student_Achievements Table in khubv1 database
		try
		{	
			String student_Achivements =  "CREATE TABLE Student_Achievements"
										  + "("
										  + "StuEmail VARCHAR(320) UNIQUE,"										//Student email (collected from login table)
										  + "Achievement1 VARCHAR(1000) NOT NULL ,"							//Achivement1 Detail
										  + "Achievement2 VARCHAR(1000) NOT NULL ,"							//Achivement2 Detail
										  + "Achievement3 VARCHAR(1000) NOT NULL ,"							//Achivement3 Detail
										  + "Achievement4 VARCHAR(1000) NOT NULL ,"							//Achivement4 Detail
										  + "Achievement5 VARCHAR(1000) NOT NULL ,"							//Achivement5 Detail
										  
										  + " FOREIGN KEY (StuEmail) REFERENCES Login(Email) "					//Student email foreign key reference
										  + "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(student_Achivements);
				System.out.println("Table 'Student_Achievements' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables Student_Achievements Exception: " + e);
		}
		
		
	//Create Student_Project_Exp Table in khubv1 database
		try
		{	
			String student_Project_Exp =  "CREATE TABLE Student_Project_Exp"
										  + "("
										  + "StuEmail VARCHAR(320) UNIQUE,"						//Student email (collected from login table)
										  + "Project1Name VARCHAR(500) NOT NULL ,"				//Project1Name Detail
										  + "Project1StartTime VARCHAR(20) NOT NULL ,"			//Project1StartTime Detail
										  + "Project1EndTime VARCHAR(20) NOT NULL ,"			//Project1EndTime Detail
										  + "Project1Description VARCHAR(1000) NOT NULL ,"		//Project1Description Detail
										  
										  + "Project2Name VARCHAR(500) NOT NULL ,"				//Project2Name Detail
										  + "Project2StartTime VARCHAR(20) NOT NULL ,"			//Project2StartTime Detail
										  + "Project2EndTime VARCHAR(20) NOT NULL ,"			//Project2EndTime Detail
										  + "Project2Description VARCHAR(1000) NOT NULL ,"		//Project2Description Detail
										  
										  + " FOREIGN KEY (StuEmail) REFERENCES Login(Email) "	//Student email foreign key reference
										  + "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(student_Project_Exp);
				System.out.println("Table 'student_Project_Exp' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables student_Project_Exp Exception: " + e);
		}
		
		
	//Create Student_Application_Status Table in khubv1 database
		try
		{	
			String student_Application_Status =  "CREATE TABLE Student_Application_Status"
										  + "("
										  + "StuEmail VARCHAR(320) NOT NULL,"																		//Student email (collected from login table)
										  + "OppID int NOT NULL ,"																					//Job_Opportunity ID (collection from Job_Opportunity table)
										  + "ApplicationStatus ENUM('No-Action', 'Applied', 'Not-Interested') NOT NULL DEFAULT 'No-Action' ,"		//ApplicationStatus Detail
										  
										  + "PRIMARY KEY (StuEmail, OppID) ,"																		//Composite Primary key (StuEmail, OppID)
										  + " FOREIGN KEY (StuEmail) REFERENCES Login(Email) ,"														//Student email foreign key reference
										  + " FOREIGN KEY (OppID) REFERENCES Job_Opportunity(OppID) "												//Student email foreign key reference
										  + "); ";
			
			Statement st = con.createStatement();
			st.executeUpdate(student_Application_Status);
				System.out.println("Table 'student_Application_Status' Created");	
		}
		catch(Exception e)
		{
			System.out.println("CreateTables student_Application_Status Exception: " + e);
		}		
				
				
				
	} //main() method close

} //class CreateTables close
