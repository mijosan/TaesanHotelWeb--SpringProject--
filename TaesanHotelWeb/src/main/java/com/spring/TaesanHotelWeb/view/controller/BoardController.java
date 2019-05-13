package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.common.PageMaker;
import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller 어노테이션을 써야 Command객체가 만들어짐
@SessionAttributes("board") // Model에 "board"라는 이름으로 저장되는 데이터가 있다면 그 데이터를 세션에도 자동으로 저장하라는 설정이다.
public class BoardController implements ApplicationContextAware {
	@Autowired
	private BoardService boardService;

	private WebApplicationContext context = null;
	
	String SAVE_PATH="C:/Spring/TaesanHotelWeb/TaesanHotelWeb/src/main/webapp/resources/files/";

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
		pagemaker.setPagenum(pagenum);//현재 페이지를 페이지 객체에 저장
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
		mav.addObject("boardList",boardService.getBoardList((pagemaker.getPagenum()-1)*10,pagemaker.getContentnum(), vo)); //0~10, 11~21
		mav.addObject("page", pagemaker);
		mav.setViewName("board");

		return mav;     
		
	}
	
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(@RequestParam(value="uploadFile", required = false) MultipartFile mf,String editor, BoardVO vo, HttpSession session) throws IllegalStateException, IOException {
        System.err.println("저장할 내용 : " + editor);
        	//파일 업로드 처리
      		
      		if(!mf.isEmpty()) {
      			String originalFileName = System.currentTimeMillis() + mf.getOriginalFilename();
      			long fileSize = mf.getSize();
      			String safeFile = SAVE_PATH + originalFileName; //같은 파일명을 업로드하여도 안겹침
      			vo.setOriginalFileName(originalFileName);
      			vo.setFileName(mf.getOriginalFilename());
      			
      			mf.transferTo(new File(safeFile));
      		}

      		UserVO userVO = (UserVO)session.getAttribute("user");
      		vo.setWriter(userVO.getId());
      		vo.setRegDate(new Date());
      		boardService.insertBoard(vo);
        return "redirect:getBoardList.do";
    }
    
    @RequestMapping("download.do")
    public ModelAndView download(HttpServletRequest request, ModelAndView mv) throws UnsupportedEncodingException{
    	String fullPath = SAVE_PATH+request.getParameter("originalFileName");
		File file = new File(fullPath);
		System.out.println(fullPath);
		return new ModelAndView("download", "downloadFile", file);
    	}

    @Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException {
         
        this.context = (WebApplicationContext)arg0;
         
    }

    // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:/Spring/TaesanHotelWeb/TaesanHotelWeb/src/main/webapp/resources/editor/photoUpload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/TaesanHotelWeb/resources/editor/photoUpload/")
                                                  
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    


	@RequestMapping(value="/writeCheck.do")
	public String writeCheck(HttpSession session) throws Exception{
		
		UserVO vo = (UserVO)session.getAttribute("user");
		if(vo != null) {
			return "write";
		}else {
			return "redirect:loginForm.jsp";
		}
	}
	
	@RequestMapping(value="/getBoard.do") 
	public ModelAndView getBoard(BoardVO vo, ModelAndView mav, @RequestParam("message") String message) throws Exception {
		System.out.println("글 상세 조회 처리");
		
		//조회수 증가
		boardService.updateCnt(vo);
		if(message.equals("fail2")) {
			mav.addObject("message","로그인이 필요합니다.");
		}else if(message.equals("fail1")){
			mav.addObject("message","삭제 권한이 없습니다.");
		}
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
	public ModelAndView deleteBoard(BoardVO vo, ModelAndView mav, HttpSession session ,HttpServletResponse response) throws Exception {
		System.out.println("글 삭제 처리");
		
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			if(user.getId().equals(vo.getWriter())) {
				boardService.deleteBoard(vo);
				mav.setViewName("redirect:getBoardList.do");
				return mav;
			}else { //아이디가 틀릴때
				mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail1");
				return mav;
			}
		}else { //로그인을 하지않았을때
			mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail2");
			return mav;
		}
	
	}

	
}
