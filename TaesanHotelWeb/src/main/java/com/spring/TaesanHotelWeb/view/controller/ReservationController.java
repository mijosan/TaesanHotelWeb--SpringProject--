package com.spring.TaesanHotelWeb.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.service.ReservationService;
import com.spring.TaesanHotelWeb.biz.vo.ReservationVO;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("reservation.do")
	public ModelAndView reservation(ModelAndView mav, ReservationVO vo, HttpSession session) {
		if(session.getAttribute("user") == null) {
			mav.setViewName("redirect:loginForm.jsp");
			return mav;
		}else {
			UserVO userVO = (UserVO)session.getAttribute("user");
			vo.setId(userVO.getId());
			reservationService.insertReservation(vo);
			mav.setViewName("redirect:index.jsp");
			return mav;
		}
	}
}
