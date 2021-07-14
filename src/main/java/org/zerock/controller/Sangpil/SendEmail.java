package org.zerock.controller.Sangpil;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public static void sendEmail(int num, String idE) {

  String host     = "smtp.gmail.com";
  final String user   = "qkrtkdvlf011@gmail.com";
  final String password  = "sso02005";

  String to = idE;

  
  // Get the session object
  Properties props = new Properties();
//  props.put("mail.smtp.starttls.enable", "true");
//  props.put("mail.smtp.host", host);
//  props.put("mail.smtp.auth", "true");
  
  props.put("mail.smtp.host", "smtp.gmail.com"); 
  props.put("mail.smtp.port", 465); 
  props.put("mail.smtp.auth", "true"); 
  props.put("mail.smtp.ssl.enable", "true"); 
  props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(user, password);
   }
  });

  // Compose the message
  try {
   MimeMessage message = new MimeMessage(session);
   message.setFrom(new InternetAddress(user));
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

   // Subject
   message.setSubject("메일 인증 번호");
   
   // Text    num int여서 + "" 
  message.setText(" 인증 번호는 " + num + " 입니다.");

   // send the message
   Transport.send(message);
   System.out.println("message sent successfully...");

  } catch (MessagingException e) {
   e.printStackTrace();
  }
 }
}