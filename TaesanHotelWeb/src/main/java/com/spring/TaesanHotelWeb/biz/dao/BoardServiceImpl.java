package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;

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
	
}
