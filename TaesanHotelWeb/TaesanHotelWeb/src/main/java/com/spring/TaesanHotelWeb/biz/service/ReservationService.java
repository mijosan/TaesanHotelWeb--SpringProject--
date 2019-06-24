package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import com.spring.TaesanHotelWeb.biz.vo.ReservationVO;

public interface ReservationService {
	public void insertReservation(ReservationVO vo);
	
	public List<ReservationVO> getReservation(String id);
	
	public void deleteReservation(int r_seq);
}
