
package in.sp.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailSender {

	private static final String SMTP_HOST = "smtp.gmail.com"; // Your SMTP server
	private static final String SMTP_PORT = "587"; // Use 587 for TLS
	private static final String SMTP_USER = System.getenv("SMTP_USER"); // Your email
	private static final String SMTP_PASSWORD = System.getenv("SMTP_PASSWORD"); // Your email password

	public static void sendResetEmail(String toEmail, String resetLink) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true"); // Use STARTTLS
		props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.smtp.port", SMTP_PORT);
		props.put("mail.smtp.ssl.trust", SMTP_HOST); // This is required for some configurations

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(SMTP_USER));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Password Reset Request");
			message.setText("Click the following link to reset your password: " + resetLink);

			Transport.send(message);
			System.out.println("Reset email sent successfully.");
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Failed to send email.");
		}
	}
}
