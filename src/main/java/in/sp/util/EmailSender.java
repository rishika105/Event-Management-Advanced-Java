package in.sp.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailSender {

    private static final String SMTP_HOST = "smtp.gmail.com"; 
    private static final String SMTP_PORT = "587"; 
    private static final String SMTP_USER = System.getenv("SMTP_USER"); 
    private static final String SMTP_PASSWORD = System.getenv("SMTP_PASSWORD"); 

    // Method to send password reset email
    public static void sendResetEmail(String toEmail, String resetLink) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); 
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.trust", SMTP_HOST); 

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

    // Method to send feedback email
    public static void sendFeedbackEmail(String userName, String userEmail, String feedback) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); 
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.trust", SMTP_HOST); 

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SMTP_USER));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("admi2n106@gmail.com")); // Admin's email
            message.setSubject("New Feedback Received");
            message.setText("Feedback from: " + userName + "\nEmail: " + userEmail + "\n\nFeedback:\n" + feedback);

            Transport.send(message);
            System.out.println("Feedback email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send feedback email.");
        }
    } // Close the sendFeedbackEmail method

} // Close the EmailSender class
