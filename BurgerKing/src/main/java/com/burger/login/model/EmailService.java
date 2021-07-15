package com.burger.login.model;

import javax.mail.internet.MimeMessage;
import javax.print.DocFlavor.STRING;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;



@Service("EmailService")
public class EmailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SimpleMailMessage preConfiguredMessage;
	
	
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			  
			MimeMessageHelper messageHelper  = new MimeMessageHelper(message,true,"UTF-8");
			
			
			messageHelper.setFrom("@naver.com","안형준");
		    messageHelper.setSubject(subject);
		    messageHelper.setTo(to);
		    messageHelper.setText(body);
		    
		    mailSender.send(message);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Async
	public void sendPreConfiguredMail(String message) {
		SimpleMailMessage mailMessage =  new SimpleMailMessage(preConfiguredMessage);
		
		mailMessage.setText(message);
		mailSender.send(mailMessage);
		
		
	}

	
}
