package com.spring.TaesanHotelWeb.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Controller
public class EmailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserService userService;
	
	String emailDept;
	// mailForm
	 
	  // mailSending 코드
	  @ResponseBody
	  @RequestMapping(value = "/mail.do")
	  public Map<Object, Object> mailSending(@RequestBody UserVO vo) {
		 
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = userService.emailCheck(vo.getEmail());
		
		if(count != 0) { //Email이 존재할때
	   
		    String setfrom = "erptaesanchoi@gmail.com";         
		    String tomail  = vo.getEmail();// 받는 사람 이메일
		    emailDept = vo.getEmail(); //아이디를 찾을때를위해 저장
		    String title   = "[TsHotel] 회원님의 아이디 찾기 인증번호 입니다.";      // 제목
		    String content;    // 내용
		    
		    int number = (int)(Math.random()*100000)+1;
		    content = "인증번호 : "+number;
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		     
		      mailSender.send(message);
		      
		      //인증번호 리턴
		      map.put("number", number);
		      return map;
		    } catch(Exception e){
		      System.out.println(e);
		    }
	  }else { //email 이 존재 하지 않을때
		  map.put("result", "fail");
		  return map;
	  }
		 return null;
	  }	
	  
	  @ResponseBody
	  @RequestMapping(value = "/idSearch.do")
	  public Map<Object, Object> idSearch() {
		 List<String> list = userService.idSearch(emailDept);
		 HashMap<Object,Object> map = new HashMap<Object,Object>();
		 map.put("list", list);
		 
		 return map;	
	  }	 
}
