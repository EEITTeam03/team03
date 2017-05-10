package myutil;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class TwilioSMS {

    // Find your Account Sid and Auth Token at twilio.com/console
	public static final String ACCOUNT_SID = "ACaeb5a588d9c603aade15044f41b7ccb1";
	public static final String AUTH_TOKEN = "260067cd3b5ca045ee6de811b4ed2364";

	
	public static void main(String[] args) {
		
		 Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		 
		 Message message = Message.creator(
				 	new PhoneNumber("+886958584817"),  //to
			        new PhoneNumber("+13343846257"),  //from
			        "Hello SQL Queen!!! 瞻創楷").create();
		 
		 System.out.println(message.getSid());
		 System.out.println(message.getPrice());
		 System.out.println(message.getDateCreated().getZone());
		 System.out.println(message.getFrom());
		 System.out.println(message.getErrorCode());
		 System.out.println(message.getErrorMessage());
		 System.out.println("簡訊已寄出");
		 
	}

}
