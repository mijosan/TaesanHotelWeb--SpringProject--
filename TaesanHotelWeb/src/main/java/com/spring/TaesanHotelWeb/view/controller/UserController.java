package com.spring.TaesanHotelWeb.view.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.TaesanHotelWeb.biz.common.NaverLoginBO;
import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller 어노테이션을 써야 Command객체가 만들어짐
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	private String apiResult = null;
	
	//네아로
	@RequestMapping(value = "naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void naverLogin(HttpSession session, HttpServletResponse response) throws IOException {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		response.sendRedirect(naverAuthUrl);
	}
	
	//네아로 콜백
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, UserVO user) throws IOException, ParseException {
		
		JSONParser parser = new JSONParser();
		
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		String apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		//2. String형식인 apiResult를 json형태로 바꿈 
		Object obj = parser.parse(apiResult); 
		JSONObject jsonObj = (JSONObject) obj;

		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
		
		//response의 nickname값 파싱 
		
		String email = (String)response_obj.get("email"); 
		String id = email.substring(0,email.indexOf("@"));
		
		user.setEmail(email);
		user.setId(id);
		
		session.setAttribute("user", user);
		session.setAttribute("naver", "true");
		
		return "redirect:index.jsp";
	}
	
	//로그인
	@RequestMapping(value="login.do")
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
	@RequestMapping(value="logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("로그아웃 처리");
		
		session.removeAttribute("user");
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
	
	//아이디 중복체크
	@RequestMapping(value="idcheck.do")
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
	@RequestMapping(value="register.do")
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
