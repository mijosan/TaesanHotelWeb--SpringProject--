package com.spring.TaesanHotelWeb.biz.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;


public class UserDAOMybatis extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public UserVO loginCheck(UserVO vo) {
		System.out.println("===> Mybatis로 loginCheck() 기능 처리");
		return (UserVO)getSqlSession().selectOne("UserDAO.loginCheck", vo);
	}
}
