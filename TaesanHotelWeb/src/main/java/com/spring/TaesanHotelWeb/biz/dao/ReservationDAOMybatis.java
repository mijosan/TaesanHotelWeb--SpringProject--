package com.spring.TaesanHotelWeb.biz.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.ReservationVO;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertReservation(ReservationVO vo) {
		System.out.println("===> Mybatis로 insertReservation() 기능 처리");
		getSqlSession().insert("ReservationDAO.insertReservation", vo);
	}
	
	
	
}
