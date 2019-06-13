package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.CommentVO;

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
	
	//내가 쓴 글 목록 조회
	List<BoardVO> getMyBoardList(int pagenum, int contentnum, BoardVO vo);
	
	//내가 쓴 댓글 목록 조회
	List<CommentVO> getMyCommentList(int pagenum, int contentnum, CommentVO vo);
	
	//글 목록 갯수
	int getBoardListCnt();
	
	//댓글 목록 갯수
	int getMyCommentListCnt(String id);
	
	
	//내가 쓴 글 목록 갯수
	int getMyBoardListCnt(String id);
	
	//글 최상위 번호 조회
	int getSeq();
	
	//같은 계층에서 가장 높은 순서 구하기
	int getOrd(BoardVO vo);
	
	//groupOrd + 1 쿼리
	void updateOrd(BoardVO vo);

	//////////////////////////////////////댓글//////////////////////////////////////////// 
	
	//댓글 가져오기
	List<CommentVO> getComment(int b_seq, int start, int end);
	
	//댓글 삭제
	void deleteComment(int c_seq);
	
	//댓글 수정
	void updateComment(CommentVO vo);
	
	//댓글 삽입
	void insertComment(CommentVO vo);
	
	//댓글 최상위 번호 조회
	int getC_seq();
	
	//groupOrd + 1 쿼리
	void commentUpdateOrd(CommentVO vo);

	

}