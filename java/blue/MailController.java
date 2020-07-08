package com.spring.blue;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blue.vo.MailVo;

@Controller
@RequestMapping("/mail")
public class MailController {
  String flag;
  
  @Autowired
  private JavaMailSender mailSender;

  
  @RequestMapping(value="/mailForm", method=RequestMethod.GET)
  public String mailFormGet() {
    return "mail/mailForm";
  }
  
  @RequestMapping(value="/mailForm", method=RequestMethod.POST)
  public String mailFormPost(MailVo vo) {
    String fromMail = "cjsk1126@gamil.com";
    String toMail = vo.getToMail();
    String title = vo.getTitle();
    String content = vo.getContent();
    
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
      
      messageHelper.setFrom(fromMail);  // 생략불가
      messageHelper.setTo(toMail);      // 생략불가
      messageHelper.setSubject(title);  // 생략가능
      messageHelper.setText(content);   // 생략불가
      
      mailSender.send(message);  // 메일형식으로 인코딩을 통한 조합된 내용을 전송한다.
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    
    flag = "mailSendOk";
    return "redirect:/msg/" + flag;
  }
  
}
