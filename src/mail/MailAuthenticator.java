package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator {

	private String userName;
	private String passwd;

	public MailAuthenticator(String userName, String passwd){
		this.userName = userName;
		this.passwd = passwd;
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, passwd);
	}

}
