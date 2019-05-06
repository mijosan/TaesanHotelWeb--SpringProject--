package com.spring.TaesanHotelWeb.view.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller 어노테이션을 써야 Command객체가 만들어짐
public class UserController {

	@Autowired
	private UserService userService;
	
	//로그인
	@RequestMapping(value="/login.do")
	public ModelAndView login(UserVO vo, ModelAndView mav, HttpSession session)throws SQLException {
		if(vo.getId()==null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
			
		}
		System.out.println("로그인 처리");
		
		UserVO user = userService.loginCheck(vo);

		//3. 화면 네비게이션
			if(user !=null){
				mav.setViewName("index.jsp");
				mav.addObject("msg","success");
				//mav.addObject("user",user.getName()); 바로 getBoardList.jsp로 간다면 쓸수있는데 getBoardList.do에서 새롭게  ModelAndView 객체를 생성해서 쓰기때문에 기존의 MAV와 다르다.
				session.setAttribute("user", user);
			}else{
				mav.addObject("msg","failure");
				mav.setViewName("loginForm.jsp");
			}
		return mav;

	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("로그아웃 처리");
		
		session.invalidate();
		mav.setViewName("index.jsp");
		return mav;
	}
	
	
	//아이디 중복체크
	@RequestMapping(value="/idcheck.do")
	@ResponseBody //Ajax
	public Map<Object, Object> idCheck(@RequestBody String id, ModelAndView mav) throws Exception {
		System.out.println("아이디 중복체크");
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = userService.idCheck(id);
		map.put("cnt", count);
		
		return map;
	}
	
	//회원가입
	@RequestMapping(value="/register.do")
	public ModelAndView register(UserVO vo, ModelAndView mav) throws Exception {
		System.out.println("회원가입 처리");
		
		userService.register(vo);
		mav.setViewName("loginForm.jsp");
		return mav;
	}

}
