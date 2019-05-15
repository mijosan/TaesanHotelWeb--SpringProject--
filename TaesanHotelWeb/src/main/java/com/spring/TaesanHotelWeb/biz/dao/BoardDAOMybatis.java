package com.spring.TaesanHotelWeb.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;



@Repository
public class BoardDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 insertBoard() 기능 처리");
		getSqlSession().insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 updateBoard() 기능 처리");
		getSqlSession().update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 deleteBoard() 기능 처리");
		getSqlSession().delete("BoardDAO.deleteBoard", vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 getBoard() 기능 처리");
		return (BoardVO)getSqlSession().selectOne("BoardDAO.getBoard", vo);
	}
	
	public void updateCnt(BoardVO vo) {
		System.out.println("===> Mybatis로 updateCnt() 기능 처리");
		getSqlSession().update("BoardDAO.updateCnt", vo);
	}
	
	public List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo) {
		System.out.println("===> Mybatis로 getBoardList() 기능 처리");
		HashMap map = new HashMap<String, Object>();
		
		map.put("pagenum",pagenum);
		map.put("contentnum",contentnum);
		map.put("BoardVO",vo);
		return getSqlSession().selectList("BoardDAO.getBoardList", map);
	}
	
	public int getBoardListCnt() {
		return getSqlSession().selectOne("BoardDAO.getBoardListCnt");
	}
	
	public int getSeq() {
		System.out.println("===> Mybatis로 getSeq() 기능 처리");
		return getSqlSession().selectOne("BoardDAO.getSeq");
	}
	
	public int getOrd(BoardVO vo) {
		System.out.println("===> Mybatis로 getOrd() 기능 처리");
		return getSqlSession().selectOne("BoardDAO.getOrd",vo);
	}
	
}
