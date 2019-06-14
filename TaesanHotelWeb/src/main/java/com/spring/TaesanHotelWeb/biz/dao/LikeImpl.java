package com.spring.TaesanHotelWeb.biz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.LikeService;
import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

@Service("likeService")
public class LikeImpl implements LikeService{
	
	@Autowired
	private LikeDAOMybatis likeDAO;

	//좋아요를 눌렀는지 판단
	@Override
	public int checkLike(LikeVO vo) {
		return likeDAO.checkLike(vo);
	}
	
	//좋아요 삭제
	@Override
	public void deleteLike(LikeVO vo) {
		likeDAO.deleteLike(vo);
	}
	
	//좋아요 추가
	@Override
	public void addLike(LikeVO vo) {
		likeDAO.addLike(vo);		
	}
	
	//좋아요 가져오기
	@Override
	public int getLike(int b_seq) {
		return likeDAO.getLike(b_seq);
	}
}
