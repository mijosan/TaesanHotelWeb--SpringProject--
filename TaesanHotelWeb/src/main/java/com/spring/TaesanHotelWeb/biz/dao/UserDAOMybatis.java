package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Repository
public class UserDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//로그인
	public UserVO loginCheck(UserVO vo) {
		System.out.println("===> Mybatis로 loginCheck() 기능 처리");
		return (UserVO)getSqlSession().selectOne("UserDAO.loginCheck", vo);
	}
	//중복체크
	public int idCheck(String id) {
		System.out.println("===> Mybatis로 idCheck() 기능 처리");
		return (Integer)getSqlSession().selectOne("UserDAO.idCheck", id);
	}
	
	//회원가입
	public void register(UserVO vo) {
		System.out.println("===> Mybatis로 register() 기능 처리");
		getSqlSession().insert("UserDAO.register", vo);
	}
	
	//회원정보 변경
	public void updateMember(UserVO vo) {
		System.out.println("===> Mybatis로 updateMember() 기능 처리");
		getSqlSession().update("UserDAO.updateMember", vo);
	}
	
	//이메일체크
	public int emailCheck(String email) {
		System.out.println("===> Mybatis로 emailCheck() 기능 처리");
		return (Integer)getSqlSession().selectOne("UserDAO.emailCheck", email);
	}
	
	//이메일체크
	public List<String> idSearch(String email) {
		System.out.println("===> Mybatis로 emailCheck() 기능 처리");
		return getSqlSession().selectList("UserDAO.idSearch", email);
	}
}
