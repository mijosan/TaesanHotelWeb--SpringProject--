package com.spring.TaesanHotelWeb.biz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOMybatis userDAO;
	
	
	@Override
	public UserVO loginCheck(UserVO vo) {
		return userDAO.loginCheck(vo);
	}
}
