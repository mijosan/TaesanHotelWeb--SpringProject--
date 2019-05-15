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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller ������̼��� ��� Command��ü�� �������
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//�α���
	@RequestMapping(value="/login.do")
	public ModelAndView login(UserVO vo, ModelAndView mav, HttpSession session)throws SQLException {
		System.out.println("�α��� ó��");
		
		UserVO user = userService.loginCheck(vo);

		//3. ȭ�� �׺���̼�
			if(user !=null){
				mav.setViewName("redirect:index.jsp");
				//mav.addObject("msg","success");
				//mav.addObject("user",user.getName()); �ٷ� getBoardList.jsp�� ���ٸ� �����ִµ� getBoardList.do���� ���Ӱ�  ModelAndView ��ü�� �����ؼ� ���⶧���� ������ MAV�� �ٸ���.
				session.setAttribute("user", user); //�α��μ����� ȸ������ ���ǵ��
			}else{
				//mav.addObject("msg","failure");
				mav.setViewName("redirect:loginForm.jsp?msg=failure");

			}
		return mav;

	}
	
	//�α׾ƿ�
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("�α׾ƿ� ó��");
		
		session.invalidate();
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
	
	//���̵� �ߺ�üũ
	@RequestMapping(value="/idcheck.do")
	@ResponseBody //Ajax
	public Map<Object, Object> idCheck(@RequestBody String id, ModelAndView mav) throws Exception {
		System.out.println("���̵� �ߺ�üũ");
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = userService.idCheck(id);
		map.put("cnt", count);
		
		return map;
	}
	
	//ȸ������
	@RequestMapping(value="/register.do")
	public ModelAndView register(UserVO vo, ModelAndView mav) throws Exception {
		System.out.println("ȸ������ ó��");
		
		userService.register(vo);
		mav.setViewName("loginForm.jsp");
		return mav;
	}

}