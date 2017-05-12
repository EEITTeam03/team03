package myutil;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSMessage {
	
	public static final String ACCOUNT_SID = "ACaeb5a588d9c603aade15044f41b7ccb1";
	public static final String AUTH_TOKEN = "260067cd3b5ca045ee6de811b4ed2364";

	public SMSMessage (){
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	}
	
	public void sendSMS(String number,String content){
		
		String numberformated = "+886" + number.substring(1);
		
		Message message = Message.creator(
			 	new PhoneNumber(numberformated),  //to
		        new PhoneNumber("+13343846257"),  //from
		        content).create();
		
		System.out.println(message.getDateCreated().getZone());
		System.out.println("簡訊已寄給"+number);
	}
	
}
