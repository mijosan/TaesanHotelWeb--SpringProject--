package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;


public interface UserService {
	
		//로그인 체크
		UserVO loginCheck(UserVO vo);

		//아이디 중복체크
		int idCheck(String userid);
		
		//회원가입
		void register(UserVO vo);
		
		//회원정보 변경
		void updateMember(UserVO vo);
		
		//이메일 체크
		int emailCheck(String email);
		
		//회원정보 검색
		List<UserVO> idSearch(String email);
}
