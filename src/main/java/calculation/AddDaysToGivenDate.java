package calculation;

import java.text.SimpleDateFormat;  
import java.util.Calendar;  
import java.text.ParseException;

public class AddDaysToGivenDate {

	/* Method to add days to the date pass to this function 
	 * This function is called from AdminAddNewOppDetail for Adding opportunity end Date */
	
	public static String addDaysBy(String currentDate, int addDays)
	{
		String addUpDate= "";
		
		System.out.println("  calculation.AddDaysToGivenDate.addDaysBy() function called which add 2 days to given date");
		System.out.println("  " + currentDate+" is the current date before adding days");

		// create instance of the SimpleDateFormat that matches the given date  
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        
        //create instance of the Calendar class and set the date to the given date  
        Calendar cal = Calendar.getInstance();  
        try
        {  
           cal.setTime(sdf.parse(currentDate));  
        }
        catch(ParseException e)
        {  
            e.printStackTrace();  
         }  
		
        // use add() method to add the days to the given date  
        cal.add(Calendar.DAY_OF_MONTH, 2);  
        addUpDate = sdf.format(cal.getTime());
        
        System.out.println("  " + addUpDate+" is the date after adding 2 days");
		
		return addUpDate;
	}
}
