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
	
	
	public void setProps(String userId,String userName,Calendar cal) {
		
		
		try {
			int m = cal.get(Calendar.MONTH)+1;
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("eeit9306@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userId));
			message.setSubject("您的車明天有預約洗車服務");
			message.setText("Dear " + userName + ", \n\n 您預約的時間是" + m+"月"
					+cal.get(Calendar.DATE)+"日"+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE));

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
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memberEmail));
			message.setSubject("親愛的"+name+"，感謝您的預約");
			sbd.append("親愛的 "+name+"\n");
			sbd.append("感謝您的預約"+"\n");
			sbd.append("--------------"+"\n");
			sbd.append("預約日期為: "+month+"月"+date+"日"+"\n");
			sbd.append("預約編號: "+no+"\n");
			sbd.append("預約車輛: "+car+"\n");
			sbd.append("師傅: "+emp+"\n");
			sbd.append("--------------"+"\n");
			sbd.append("\n\n\n"+"期待您的光臨!");
			message.setText(sbd.toString());
			
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
