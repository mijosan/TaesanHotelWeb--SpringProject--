package com.spring.TaesanHotelWeb.biz.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

@Repository
public class LikeDAOMybatis extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public int checkLike(LikeVO vo){
		System.out.println("===> Mybatis로 checkLike() 기능 처리");
		return getSqlSession().selectOne("LikeDAO.checkLike", vo);
	}
	
	public void deleteLike(LikeVO vo){
		System.out.println("===> Mybatis로 deleteLike() 기능 처리");
		getSqlSession().delete("LikeDAO.deleteLike", vo);
	}
	
	public void addLike(LikeVO vo){
		System.out.println("===> Mybatis로 addLike() 기능 처리");
		getSqlSession().insert("LikeDAO.addLike", vo);
	}
}
