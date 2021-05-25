package com.rianta9.util;

public class VaildPassword {
	 public static Integer isValidPassword(String password)
	    {
	            int isValid = 0;
	            if (password.length() > 15 || password.length() < 8)
	            {
	                    System.out.println("Password must be less than 20 and more than 8 characters in length.");
	                    isValid = 1;
	            }
	            String upperCaseChars = "(.*[A-Z].*)";
	            if (!password.matches(upperCaseChars ))
	            {
	                    System.out.println("Password must have atleast one uppercase character");
	                    isValid = 2;
	            }
	            String lowerCaseChars = "(.*[a-z].*)";
	            if (!password.matches(lowerCaseChars ))
	            {
	                    System.out.println("Password must have atleast one lowercase character");
	                    isValid = 3;
	            }
	            String numbers = "(.*[0-9].*)";
	            if (!password.matches(numbers ))
	            {
	                    System.out.println("Password must have atleast one number");
	                    isValid = 4;
	            }
	            String specialChars = "(.*[@,#,$,%].*$)";
	            if (!password.matches(specialChars ))
	            {
	                    System.out.println("Password must have atleast one special character among @#$%");
	                    isValid = 5;
	            }
	            return isValid; 
	    }
	 public static String NotificationErrorPass(String password) {
		 String notification = null;
		 int result = isValidPassword(password);
		 if(result == 1)
			 notification = "Password must be less than 20 and more than 8 characters in length.";
		 else if (result == 2 ) {
			notification = "Password must have atleast one uppercase character";
		}
		 else if(result == 3) notification = "Password must have atleast one lowercase character";
		 
		 
		 return notification;
	 }
}
