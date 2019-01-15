package mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import property.SiteProperty;

public class SendMail {
	
//	// 파일 첨부가 없는 메일을 보내기
//	public static int sendEmail(String from, String to, String subject, String contents) throws Exception, SendFailedException {
//		int result = 0;
//		try {
//			Properties props = System.getProperties();
//			props.put("mail.smtp.host", SiteProperty.SMTP_HOST);
//			props.put("mail.smtp.port", SiteProperty.SMTP_PORT);
//			props.put("mail.smtp.auth", "true");
//			props.put("mail.smtp.ssl.enable", "true");  
//			props.put("mail.smtp.ssl.trust", SiteProperty.SMTP_HOST);  
//			Authenticator loAuthenticator = new MailAuthenticator(SiteProperty.SMTP_USER, SiteProperty.SMTP_PASSWORD); 
//			Session session = Session.getInstance(props, loAuthenticator);
//			
//			session.setDebug(false);
//			
//			MimeMessage message = new MimeMessage(session);
//			
//			InternetAddress fromAddress = new InternetAddress(from, SiteProperty.COMPANY_NAME);
//			message.setFrom(fromAddress);
//			message.addRecipients(Message.RecipientType.TO, to);
//			
//			message.setSubject(subject, "utf-8");
//
//			message.setContent(contents,"text/html; charset=utf-8");
//		
//			Transport.send(message);				// 메일 발송
//			result = 1;								// 정상 발송
//		} catch (SendFailedException e) {			// 메일 주소 중 형식 올바르지 않는 주소가 있을 때
//			result = 2;
//		} catch (Exception e){
//			System.out.println(e.toString());
//		}
//		return result;
//	}

	// 파일 첨부형 메일 보내기
	public static void sendEmailFile(String[] emails, int index, MimeMessage message) throws Exception, SendFailedException {

		int cnt=index;
		
		try {
			for (int i=index; i<emails.length; i++) {
				cnt++;
				message.setRecipients(Message.RecipientType.TO, emails[i]);		// TO(받는사람) 여려명을 보내면 받는사람에 같이 나타난다.
				Transport.send(message);										// 메일 발송
			}

		} catch (SendFailedException e) {										// 메일 주소 중 형식 올바르지 않는 주소가 있을 때
			sendEmailFile(emails, cnt, message);
		} catch (Exception e){
			System.out.println(e.toString());
		}
	}
	
	

	public static void sendEmail() throws Exception{
		
		// 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = SiteProperty.SMTP_USER;       //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
        final String password = SiteProperty.SMTP_PASSWORD;   //네이버 이메일 비밀번호를 기재합니다.
        int port=465;
        
        // 메일 내용
        String recipient = "tssu106@naver.com";    //메일을 발송할 이메일 주소를 기재해 줍니다.
        String subject = "네이버를 사용한 발송 테스트입니다.";
        String body = "내용 무";
        
        Properties props = System.getProperties();
         
         
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
          
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
          
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("zebra_yun@naver.com"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);

	}

}
