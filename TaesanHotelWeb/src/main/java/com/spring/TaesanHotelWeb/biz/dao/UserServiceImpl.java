package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Transactional
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
	
	//회원정보 변경
	@Override
	public void updateMember(UserVO vo) {
		userDAO.updateMember(vo);	
	}
	
	//이메일 체크
	@Override
	public int emailCheck(String email) {
		return userDAO.emailCheck(email);
	}
	
	//아이디 검색
	@Override
	public List<UserVO> idSearch(String email) {
		return userDAO.idSearch(email);
	}

	//회원탈퇴
	@Override
	public void deleteMember(UserVO vo) {
		userDAO.deleteMember(vo);
	}
}
