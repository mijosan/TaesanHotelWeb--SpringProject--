package com.spring.TaesanHotelWeb.biz.service;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;


public interface UserService {
	
		//로그인 체크
		UserVO loginCheck(UserVO vo);

		//아이디 중복체크
		int idCheck(String userid);
		
		//회원가입
		void register(UserVO vo);

}
