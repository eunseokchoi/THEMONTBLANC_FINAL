package mont.blanc.mvc;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.*;
import java.util.*;
import java.security.Security;
import mont.blanc.common.*;
 
public class SendMailController{
	public void sendMail(DBbean bean){
		Properties p = new Properties();
		p.put("mail.smtp.user", "montblanchotel2@gmail.com");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			String email = bean.getEmail();
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true);
	 
			MimeMessage msg = new MimeMessage(session);
			Address fromAddr = new InternetAddress("montblanchotel2@gmail.com");
			BodyPart messageBodyPart = new MimeBodyPart();
			String message = "<img src=\"cid:image\">";
			messageBodyPart.setContent(message, "text/html");
			msg.setSubject(bean.getId()+"님 MONTBLANC 호텔&리조트 회원가입을 축하합니다.");//이메일제목
			msg.setFrom(fromAddr);
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
	   
			messageBodyPart = new MimeBodyPart();
			String filename = "/login/images/welcome.jpg";
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setHeader("Content-ID", "<image>");
			multipart.addBodyPart(messageBodyPart);
	   
			Address toAddr = new InternetAddress(email);  // 받는 사람의 메일주소
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			msg.setContent(multipart);
	   
			System.out.println("Message: " + msg.getContent());
			Transport.send(msg);
			System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
		}catch (Exception mex) {
			mex.printStackTrace(); 
		} 
	}
 
	private static class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("montblanchotel2", "ahdqmffkd");
		}
	} 
}