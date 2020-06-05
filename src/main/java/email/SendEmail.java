package email;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import login.MemberVo_m;

public class SendEmail {
	   public SendEmail() {
	   
	   }
	   
	   public void MailSend(MemberVo_m vo) {
	      
	      String host = "smtp.gmail.com";
	      String user = "leemyly@gmail.com";
	      String password = "dlaudfuf59486!!";
	 
	      
	      // SMTP 서버 정보 설정
	      Properties prop = new Properties();
	      prop.put("mail.smtp.host", host);
	      prop.put("mail.smtp.port", 465);
	      prop.put("mail.smtp.auth", "true");
	      prop.put("mail.smtp.ssl.enable", "true");
	      prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	      Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(user,password);
	         }
	      });
	      
	      
	      try {
	         MimeMessage message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(user));
	         //수신자 메일 주소
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getMem_email()));
	         
	    
	            //제목
	            message.setSubject("[Twitch] 개인정보 전송");
	            
	            //내용
	            message.setContent("<h1>[개인정보 안내]</h1><br>"
	                  + "<p>아이디는 <b> "+ vo.getMem_Id() + "<p>비밀번호는 <b> "+ vo.getMem_pwd() + "</b> 입니다.</p><br> <a href='daum123.gonetis.com'><b>Twitch</b></a> 으로 이동", "text/html; charset=utf-8");
	            
	            Transport.send(message); // 전송
	           
	         
	      }catch (AddressException e) {
	         e.printStackTrace();
	      }catch (MessagingException e) {
	         e.printStackTrace();
	      }
	   }
	}
