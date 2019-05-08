package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.common.PageMaker;
import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;


@Controller // Controller 어노테이션을 써야 Command객체가 만들어짐
@SessionAttributes("board") // Model에 "board"라는 이름으로 저장되는 데이터가 있다면 그 데이터를 세션에도 자동으로 저장하라는 설정이다.
public class BoardController {
	@Autowired
	private BoardService boardService;


	//검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("내용","CONTENT");
			conditionMap.put("제목","TITLE");
			conditionMap.put("작성자","WRITER");
			return conditionMap;
	}

	
	@RequestMapping(value="/getBoardList.do")
	public ModelAndView getBoardList(@RequestParam(value="pagenum", defaultValue="1") int pagenum, BoardVO vo, ModelAndView mav) throws Exception {
		PageMaker pagemaker = new PageMaker();
		
		pagemaker.setTotalcount(boardService.getBoardListCnt());//전체 게시글 개수
		pagemaker.setPagenum(pagenum-1);//현재 페이지를 페이지 객체에 저장
		pagemaker.setContentnum(10);//한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
		pagemaker.setCurrentblock(pagenum);//현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
		pagemaker.setLastblock(pagemaker.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
		
		pagemaker.prevnext(pagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다
		pagemaker.setStartPage(pagemaker.getCurrentblock());//시작 페이지를 페이지 블록 번호로 정한다.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());//마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
		//Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		//정보 저장
		mav.addObject("boardList",boardService.getBoardList(pagemaker.getPagenum()*10,pagemaker.getContentnum(), vo));
		mav.addObject("page", pagemaker);
		mav.setViewName("board.jsp");
		return mav;     
		
	}
	
	@RequestMapping(value="/getBoard.do") 
	public ModelAndView getBoard(BoardVO vo, ModelAndView mav) throws Exception {
		System.out.println("글 상세 조회 처리");
		
		mav.addObject("board", boardService.getBoard(vo)); //Model 정보 저장
		mav.setViewName("getBoard");
		return mav;
	}
	
	@RequestMapping(value="/updateBoard.do")
	public ModelAndView updateBoard(@ModelAttribute("board") BoardVO vo, ModelAndView mav) throws Exception {//세션에 있는 BoardVO객체를 먼저 할당되고 그리고 사용자가 입력한 파라미터값을 vo 객체에 할당
		System.out.println("글 수정 처리");
		
		System.out.println("작성자 이름 : " + vo.getWriter());
		boardService.updateBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public ModelAndView deleteBoard(BoardVO vo, ModelAndView mav) throws Exception {
		System.out.println("글 삭제 처리");
		
		
		boardService.deleteBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	

	

	@RequestMapping(value="/insertBoard.do") // HandlerMapping 대체
	public String insertBoard(BoardVO vo) throws Exception{
		System.out.println("글 등록 처리");
		//파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/Spring/" + fileName));
		}

		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
		
	}
	

	
	
	
}
