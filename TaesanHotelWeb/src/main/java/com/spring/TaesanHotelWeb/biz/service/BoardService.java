package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;

public interface BoardService {

	//글 삽입
	void insertBoard(BoardVO vo);

	//글 수정
	void updateBoard(BoardVO vo);

	//글 삭제
	void deleteBoard(BoardVO vo);

	//글 상세 조회
	BoardVO getBoard(BoardVO vo);
	
	//조회수 증가
	void updateCnt(BoardVO vo);

	//글 목록 조회
	List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo);
	
	//글 목록 갯수
	int getBoardListCnt();
	
	
}