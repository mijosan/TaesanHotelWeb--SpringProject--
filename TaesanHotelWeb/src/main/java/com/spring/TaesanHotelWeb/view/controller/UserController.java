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
		System.out.println("로그인 처리");
		
		UserVO user = userService.loginCheck(vo);
		
		//3. 화면 네비게이션
			if(user !=null){
				mav.setViewName("redirect:index.jsp");
				//mav.addObject("msg","success");
				//mav.addObject("user",user.getName()); 바로 getBoardList.jsp로 간다면 쓸수있는데 getBoardList.do에서 새롭게  ModelAndView 객체를 생성해서 쓰기때문에 기존의 MAV와 다르다.
				session.setAttribute("user", user); //로그인성공시 회원정보 세션등록

			}else{
				//mav.addObject("msg","failure");
				mav.setViewName("redirect:loginForm.jsp?msg=failure");

			}
		return mav;

	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("로그아웃 처리");
		
		session.removeAttribute("user");
		mav.setViewName("redirect:index.jsp");
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
	
	@RequestMapping("member.do")
	public ModelAndView member(ModelAndView mav) {
		mav.setViewName("member");
		return mav;
	}
	//회원정보 변경
	@RequestMapping("updateMember.do")
	@ResponseBody
	public void updateMember(@RequestBody UserVO vo) {
		System.out.println("회원정보 변경");
		userService.updateMember(vo);
	}
	
	//회원가입
	@RequestMapping(value="/register.do")
	public ModelAndView register(UserVO vo, ModelAndView mav) throws Exception {
		System.out.println("회원가입 처리");

		userService.register(vo);
		mav.setViewName("redirect:loginForm.jsp");
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping("deleteMember.do")
	@ResponseBody
	public HashMap<String,String> deleteMember(@RequestBody UserVO vo, HttpSession session ) {
		System.out.println("회원탈퇴");
		UserVO userVO = (UserVO)session.getAttribute("user");
		HashMap<String, String> map = new HashMap<String,String>();
		if(userVO.getPassword().equals(vo.getPassword())) {
			userService.deleteMember(vo);
			session.removeAttribute("user");
			map.put("result","success");
			return map;
		}else {
			map.put("result","fail");
			return map;
		}
	}

}
