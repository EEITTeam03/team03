package myutil;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;

import com.memberinfo.model.MemberService;

public class SendEmail {
	private static final String host = "smtp.gmail.com";
	private static final int port = 587;
	private static final String username = "eeit9306@gmail.com";
	private static final String password = "EEITTeam03";// your password

	public SendEmail() {
	}

	public static void setProps(String userId,String userName,Calendar cal) {
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("eeit9306@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userId));
			message.setSubject("您的車明天有預約洗車服務");
			message.setText("Dear " + userName + ", \n\n 您預約的時間是" + cal.get(Calendar.MONTH)+"月"
					+cal.get(Calendar.DATE)+"日"+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE));

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送email結束.");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

}
