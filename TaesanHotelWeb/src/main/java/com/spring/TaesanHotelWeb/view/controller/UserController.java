package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller 어노테이션을 써야 Command객체가 만들어짐
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/login.do")
	public ModelAndView login(UserVO vo, ModelAndView mav, HttpSession session)throws SQLException {
		if(vo.getId()==null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		System.out.println("로그인 처리");
		
		UserVO user;
		
		user = userService.loginCheck(vo);
		//3. 화면 네비게이션
			if(user !=null){
				mav.setViewName("index.jsp");
				//mav.addObject("user",user.getName()); 바로 getBoardList.jsp로 간다면 쓸수있는데 getBoardList.do에서 새롭게  ModelAndView 객체를 생성해서 쓰기때문에 기존의 MAV와 다르다.
				session.setAttribute("user", user);
			}else{
				mav.setViewName("login.jsp");
			}
		return mav;

	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("로그아웃 처리");
		
		session.invalidate();
		mav.setViewName("redirect:login.jsp");
		return mav;
	}

}
