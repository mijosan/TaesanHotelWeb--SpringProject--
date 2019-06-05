package com.spring.TaesanHotelWeb.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
			mav.setViewName("redirect:reservationStatus.do");
			return mav;
		}
	}
	
	@RequestMapping("reservationStatus.do")
	public ModelAndView getReservation(HttpSession session,ModelAndView mav){
		UserVO userVO = (UserVO)session.getAttribute("user");
		List<ReservationVO> vo = reservationService.getReservation(userVO.getId());
		mav.addObject("reservationList", vo);
		mav.setViewName("reservationStatus");
		return mav;
	}
	
	@RequestMapping("deleteReservation.do")
	@ResponseBody
	public void getReservation(@RequestBody ReservationVO vo){
		reservationService.deleteReservation(vo.getR_seq());
	}
}
