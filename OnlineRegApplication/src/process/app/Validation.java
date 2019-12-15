package process.app;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	
	public String validateFullName(String fullName){
		
		boolean fullNameValidResults;
		String fullNameErrorMsg = "valid";
				
		if(fullName.equals("")){
			
			fullNameErrorMsg = "Please enter your full name";
			
		}else{
			
			Pattern strPattern = Pattern.compile("^[ A-Za-z]+$");
			Matcher strMatch = strPattern.matcher(fullName);
			fullNameValidResults =  strMatch.matches();
			if(fullNameValidResults == false){
				fullNameErrorMsg = "Your full name contains invalid characters, please check!";
			}
			
		}
		
		return fullNameErrorMsg;
	}
	
	public String validateIDNumber(String idNumber){
		
		String fullNameErrorMsg = "valid";
		String regex = "\\d+";
				
		if(idNumber.equals("")){
			
			fullNameErrorMsg = "Please enter your ID number";
			
		}else{
								
			if(idNumber.length() != 13 || idNumber.matches(regex) != true){
				
				fullNameErrorMsg = "Please enter valid ID Number";
			}
			
		}
		
		return fullNameErrorMsg;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		


	}

}
