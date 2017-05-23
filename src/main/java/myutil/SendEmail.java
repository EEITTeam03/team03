package myutil;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;
import com.schedule.model.ReservVO;

public class SendEmail {
	private static final String host = "smtp.gmail.com";
	private static final int port = 587;
	private static final String username = "eeit9306@gmail.com";
	private static final String password = "EEITTeam03";// your password
	
	private Session session;
	
	public SendEmail() {
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
	}
	public void sendPassword(String clientId,String subject,String clientName,String pswd){
		StringBuilder sbd = new StringBuilder(); 
		try { 
			MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(username));
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(clientId));
		   message.setSubject("Check your password","utf-8");
//		   message.setContent("Dear "+clientName+", <br><br> your password is "+pswd, "text/html;charset=UTF-8");
		   sbd.append("Dear "+clientName+", <br><br> your password is "+pswd+"<br><br>");
		   sbd.append("Link to Our Website<br>");
		   sbd.append("http://washme03.azurewebsites.net/team03/ <br>");
		   message.setContent(sbd.toString(), "text/html;charset=UTF-8");
		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);
		   System.out.println("寄送email結束.");
		}catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void setProps(String userId,String clientName,Calendar cal) {
		
		StringBuilder sbd = new StringBuilder(); 
		try {
			int m = cal.get(Calendar.MONTH)+1;
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userId));
			message.setSubject("您的車明天有預約水膜汽車美容的洗車服務","utf-8");
			if(cal.get(Calendar.MINUTE)==0){
//				message.setContent("Dear " + clientName + ", <br><br> 您預約的時間是" + m+"月"
//						+cal.get(Calendar.DATE)+"日"+cal.get(Calendar.HOUR_OF_DAY)+":00", "text/html;charset=UTF-8");
				sbd.append("Dear " + clientName + ", <br><br> 您預約的時間是" + m+"月"
						+cal.get(Calendar.DATE)+"日"+cal.get(Calendar.HOUR_OF_DAY)+":00<br><br>");
				sbd.append("Link to Our Website<br>");
				   sbd.append("http://washme03.azurewebsites.net/team03/ <br>");
				   message.setContent(sbd.toString(), "text/html;charset=UTF-8");
				   //System.out.println("testtest");
			}else{
				sbd.append("Dear " + clientName + ", <br><br> 您預約的時間是" + m+"月"
					+cal.get(Calendar.DATE)+"日"+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+"<br><br>");
			   sbd.append("Link to Our Website<br>");
			   sbd.append("http://washme03.azurewebsites.net/team03/ <br>");
			   message.setContent(sbd.toString(), "text/html;charset=UTF-8");
			   //System.out.println("testtest2");
			}
			//得到預約前一天
			Calendar lastDay = Calendar.getInstance();
			lastDay.setTime(cal.getTime());
			lastDay.set(Calendar.HOUR_OF_DAY, 0);
			lastDay.set(Calendar.MINUTE,0);
			lastDay.add(Calendar.DATE, -1);
			//設定預約前一天寄信
			System.out.print(lastDay.getTime());
			message.setSentDate(lastDay.getTime());
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);

			System.out.println("寄送email結束.");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void reserveOK (ReservVO reserve){
		
		//取出訂單內容
		String name = reserve.getMembercarsVO().getMemberInfoVO().getMemberName();
		String memberEmail = reserve.getMembercarsVO().getMemberInfoVO().getEmail();
		String car = reserve.getMembercarsVO().getCarLicense();
		Integer no = reserve.getReservNo();
		String emp = reserve.getEmployeeVO().getEmployeeName();
		Calendar start = reserve.getReservDateTime();
		Integer year = start.get(Calendar.YEAR);
		Integer month = start.get(Calendar.MONTH)+1;
		Integer date = start.get(Calendar.DATE);
		
		StringBuilder sbd = new StringBuilder();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memberEmail));
			message.setSubject("親愛的"+name+"，感謝您的預約","utf-8");
			sbd.append(name+"<br>");
			sbd.append("感謝您的預約"+"<br>");
			sbd.append("--------------"+"<br>");
			sbd.append("預約日期為: "+month+"月"+date+"日"+"<br>");
			sbd.append("預約編號: "+no+"<br>");
			sbd.append("預約車輛: "+car+"<br>");
			sbd.append("師傅: "+emp+"<br>");
			sbd.append("--------------"+"<br>");
			sbd.append("<br><br><br>"+"期待您的光臨!");
			sbd.append("<br><br><br>"+"預約可以隨時在網站查詢 :<br>");
			sbd.append("http://washme03.azurewebsites.net/team03/ <br>");
			message.setContent(sbd.toString(), "text/html;charset=UTF-8");
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);
			
			System.out.println("****寄送email結束****");
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
