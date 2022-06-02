package calculation;

//important import statements  
import java.time.*;  
import java.time.format.DateTimeFormatter;

public class DatePicker {

	public static String getCurrentDate() {
		
		LocalDate dateObj = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
        String date = dateObj.format(formatter);
        System.out.println("  calculation.DatePicker.getCurrenDate() called which return Current Date:" + date);
        
        return date;
	}
	
}
