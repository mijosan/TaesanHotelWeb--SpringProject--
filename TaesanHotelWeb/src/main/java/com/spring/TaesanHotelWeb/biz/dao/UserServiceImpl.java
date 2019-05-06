package com.spring.TaesanHotelWeb.biz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOMybatis userDAO;
	
	//로그인
	@Override
	public UserVO loginCheck(UserVO vo) {
		return userDAO.loginCheck(vo);
	}
	
	//아이디 중복체크
	@Override
	public int idCheck(String id) {
		return userDAO.idCheck(id);
	}
	
	//회원가입
	@Override
	public void register(UserVO vo) {
		userDAO.register(vo);
	}
}
