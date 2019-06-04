package com.spring.TaesanHotelWeb.biz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.ReservationService;
import com.spring.TaesanHotelWeb.biz.vo.ReservationVO;

@Service("ReservationService")
public class ReservationImpl implements ReservationService{
	@Autowired
	private ReservationDAOMybatis reservationDAO;
	
	@Override
	public void insertReservation(ReservationVO vo) {
		reservationDAO.insertReservation(vo);
	}
	
}
