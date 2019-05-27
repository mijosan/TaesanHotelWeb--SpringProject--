package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.CommentVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAOMybatis boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo); 
	}
	@Override
	public void updateCnt(BoardVO vo) {
		boardDAO.updateCnt(vo);
	}
	
	@Override
	public List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo) {
		return boardDAO.getBoardList(pagenum,contentnum,vo);
	}

	@Override
	public int getBoardListCnt() {
		return boardDAO.getBoardListCnt();
	}
	@Override
	public int getSeq() {
		return boardDAO.getSeq();
	}
	
	@Override
	public int getOrd(BoardVO vo) {
		return boardDAO.getOrd(vo);
	}
	
	@Override
	public void updateOrd(BoardVO vo) {
		boardDAO.updateOrd(vo);
	}
	
	//´ñ±Û
	@Override
	public List<CommentVO> getComment(int b_seq, int start, int end) {
		return boardDAO.getComment(b_seq,start,end);
	}
	
	@Override
	public void insertComment(CommentVO vo) {
		boardDAO.insertComment(vo);
		
	}
	
	@Override
	public void deleteComment(int c_seq) {
		boardDAO.deleteComment(c_seq);
		
	}
	@Override
	public void updateComment(CommentVO vo) {
		boardDAO.updateComment(vo);
	}
	@Override
	public int getC_seq() {
		return boardDAO.getC_seq();
	}
	@Override
	public void commentUpdateOrd(CommentVO vo) {
		boardDAO.commentUpdateOrd(vo);
	}
}
