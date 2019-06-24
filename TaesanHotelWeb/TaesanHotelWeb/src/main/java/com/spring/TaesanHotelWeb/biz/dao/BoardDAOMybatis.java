package com.spring.TaesanHotelWeb.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.CommentVO;


@Repository
public class BoardDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� insertBoard() ��� ó��");
		getSqlSession().insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� updateBoard() ��� ó��");
		getSqlSession().update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� deleteBoard() ��� ó��");
		getSqlSession().delete("BoardDAO.deleteBoard", vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� getBoard() ��� ó��");
		return (BoardVO)getSqlSession().selectOne("BoardDAO.getBoard", vo);
	}
	
	public void updateCnt(BoardVO vo) {
		System.out.println("===> Mybatis�� updateCnt() ��� ó��");
		getSqlSession().update("BoardDAO.updateCnt", vo);
	}
	
	public List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo) {
		System.out.println("===> Mybatis�� getBoardList() ��� ó��");
		HashMap map = new HashMap<String, Object>();
		
		map.put("pagenum",pagenum);
		map.put("contentnum",contentnum);
		map.put("BoardVO",vo);
		return getSqlSession().selectList("BoardDAO.getBoardList", map);
	}
	
	//���� �� �� ��� ����Ʈ ��������
	public List<BoardVO> getMyBoardList(int pagenum, int contentnum, BoardVO vo) {
		System.out.println("===> Mybatis�� getMyBoardList() ��� ó��");
		HashMap map = new HashMap<String, Object>();
		
		map.put("pagenum",pagenum);
		map.put("contentnum",contentnum);
		map.put("BoardVO",vo);
		return getSqlSession().selectList("BoardDAO.getMyBoardList", map);
	}
	
	//���� �� �� ��� ����Ʈ ��������
	public List<CommentVO> getMyCommentList(int pagenum, int contentnum, CommentVO vo) {
		System.out.println("===> Mybatis�� getMyCommentList() ��� ó��");
		HashMap map = new HashMap<String, Object>();
			
		map.put("pagenum",pagenum);
		map.put("contentnum",contentnum);
		map.put("CommentVO",vo);
		return getSqlSession().selectList("BoardDAO.getMyCommentList", map);
	}
	
	public List<CommentVO> getComment(int b_seq, int start, int end) {
		System.out.println("===> Mybatis�� getComment() ��� ó��");
		HashMap map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("b_seq", b_seq);
		
		return getSqlSession().selectList("BoardDAO.getComment", map);
	}
	
	public int getBoardListCnt() {
		return getSqlSession().selectOne("BoardDAO.getBoardListCnt");
	}
	
	public int getMyCommentListCnt(String id) {
		return getSqlSession().selectOne("BoardDAO.getMyCommentListCnt",id);
	}
	
	public int getMyBoardListCnt(String id) {
		return getSqlSession().selectOne("BoardDAO.getMyBoardListCnt",id);
	}
	
	public int getSeq() {
		System.out.println("===> Mybatis�� getSeq() ��� ó��");
		return getSqlSession().selectOne("BoardDAO.getSeq");
	}
	
	public int getOrd(BoardVO vo) {
		System.out.println("===> Mybatis�� getOrd() ��� ó��");
		return getSqlSession().selectOne("BoardDAO.getOrd",vo);
	}
	
	public void updateOrd(BoardVO vo) {
		System.out.println("===> Mybatis�� updateOrd() ��� ó��");
		getSqlSession().update("BoardDAO.updateOrd",vo);
	}
	
	//���
	public void insertComment(CommentVO vo) {
		System.out.println("===> Mybatis�� insertComment() ��� ó��");
		getSqlSession().insert("BoardDAO.insertComment",vo);
	}
	
	public void deleteComment(int c_seq) {
		System.out.println("===> Mybatis�� deleteComment() ��� ó��");
		getSqlSession().delete("BoardDAO.deleteComment",c_seq);
	}
	
	public void updateComment(CommentVO vo) {
		System.out.println("===> Mybatis�� updateComment() ��� ó��");
		getSqlSession().update("BoardDAO.updateComment",vo);
	}
	
	public int getC_seq() {
		System.out.println("===> Mybatis�� getC_seq() ��� ó��");
		return getSqlSession().selectOne("BoardDAO.getC_seq");
	}
	public void commentUpdateOrd(CommentVO vo) {
		System.out.println("===> Mybatis�� commentUpdateOrd() ��� ó��");
		getSqlSession().update("BoardDAO.commentUpdateOrd",vo);
	}
	
}