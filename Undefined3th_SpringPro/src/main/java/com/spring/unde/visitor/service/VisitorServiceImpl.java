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

	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=10;
	
	@Autowired
	private VisitorDao visitorDao; 
	
	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		VisitorDto dto=new VisitorDto();
		
		if(keyword!=null){//검색어가 전달된 경우
			dto.setWriter(keyword);
			request.setAttribute("keyword", keyword);
		}
		
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
		int totalRow = visitorDao.getCount(dto);
		
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
		
		//모델앤뷰에 담으면 자동으로 리퀘스트에 담긴다.
		List<VisitorDto> list = visitorDao.getList(dto);
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		// 현재 페이지 번호
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		// 현재 페이지의 갯수
		mView.addObject("totalPageCount", totalPageCount);
		
		return mView;
	}

	@Override
	public ModelAndView getData(VisitorDto dto) {
		VisitorDto resultdto = visitorDao.getData(dto);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", resultdto);
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
		VisitorDto dto = visitorDao.getDataform(num);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		System.out.println(dto.getContent());
		return mView;
	}
	
	@Override
	public void delete(int num) {
		visitorDao.delete(num);
	}
	

}
