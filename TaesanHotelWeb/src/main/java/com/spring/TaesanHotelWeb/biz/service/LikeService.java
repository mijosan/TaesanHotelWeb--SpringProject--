package com.spring.TaesanHotelWeb.biz.service;

import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

public interface LikeService {
	
	//좋아요 체크
	public int checkLike(LikeVO vo);
	
	//좋아요 삭제
	public void deleteLike(LikeVO vo);
	
	//좋아요 추가
	public void addLike(LikeVO vo);
}
