package com.spring.unde.visitor.service;

import java.util.List;		

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.visitor.dao.VisitorDao;
import com.spring.unde.visitor.dto.VisitorDto;

@Component
public class VisitorServiceImpl implements VisitorService{

	private static final int PAGE_ROW_COUNT = 5;
	private static final int PAGE_DISPLAY_COUNT = 5;
	
	@Autowired
	private VisitorDao visitorDao; 
	
	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		/*//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
	      

		VisitorDto dto= new VisitorDto();
		if(keyword != null){ //검색어가 전달된 경우
			dto.setWriter(keyword);
		}
		// list.jsp 뷰페이지에서 필요한 내용을 request 에 담는다.
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
			
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = visitorDao.getCount();
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
		
		//시작 row 번와 끝 row 번호를 CafeDto에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
				
		//모델앤뷰에 담으면 자동으로 리퀘스트에 담긴다.
		List<VisitorDto> list = visitorDao.getList(dto);
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		return mView;*/	
		return null;
	}

	@Override
	public ModelAndView getData(int num) {
		VisitorDto dto = visitorDao.getData(num);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		return mView;
	}
	
	@Override
	public void insert(VisitorDto dto) {
		visitorDao.insert(dto);
		
	}

	@Override
	public void update(VisitorDto dto) {
		visitorDao.update(dto);
	}
	
	@Override
	public ModelAndView updateForm(int num) {
		VisitorDto dto = visitorDao.getData(num);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		return mView;
	}
	
	@Override
	public void delete(int num) {
		visitorDao.delete(num);
	}
	
	

}
