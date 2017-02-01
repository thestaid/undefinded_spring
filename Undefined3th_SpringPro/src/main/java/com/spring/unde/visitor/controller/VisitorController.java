package com.spring.unde.visitor.controller;

import javax.servlet.http.HttpServletRequest;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.visitor.dto.VisitorDto;
import com.spring.unde.visitor.service.VisitorService;

@Controller
public class VisitorController {

	private static final int PAGE_ROW_COUNT = 5;
	private static final int PAGE_DISPLAY_COUNT = 5;
	
	@Autowired
	private VisitorService visitorService;
		
	//파라미터로 페이지 번호가 넘어올수도 있고 안넘어 올 수도 있다.
	//만일 안넘어오면 default 값으로 1을 넣어준다.
	@RequestMapping("/visitor/visitors")
	public ModelAndView list(HttpServletRequest request){
				
		/*//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = VisitorDao.getInstance().getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// 현재 페이지 번호 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		// 전재 페이지의 갯수
		request.setAttribute("totalPageCount", totalPageCount);	*/	
		
		ModelAndView mView=visitorService.getList(request);
		
		mView.setViewName("visitor/visitors");
		return mView;
	}
		
	// 새글 저장 요청 처리
	@RequestMapping("/visitor/insert")
	public ModelAndView autoInsert(@ModelAttribute VisitorDto dto){
	   visitorService.insert(dto);
	   return new ModelAndView("redirect:/visitor/visitors.do");
	}
	
	
	//글 삭제 요청 처리
	@RequestMapping("/visitor/delete")
	public ModelAndView authDelete(@RequestParam int num){
		visitorService.delete(num);
		return new ModelAndView("redirect:/visitor/visitors.do");
	}
	
	//글 수정폼 요청 처리
	@RequestMapping("/visitor/updateform")
	public ModelAndView authUpdateform(@RequestParam int num){
		//수정할 글의 정보가 담긴 ModelAndView 객체를 리턴받는다
	ModelAndView mView= visitorService.updateForm(num);
	//view 페이지 정보 설정하고
	mView.setViewName("visitor/private/updateform");
	//리턴해준다
			return mView;   
	   }
	
	@RequestMapping("/visitor/update")
	public ModelAndView authUpdate(@ModelAttribute VisitorDto dto){
		visitorService.update(dto);
		return new ModelAndView("redirect:/visitor/visitors.do");
	}
}
