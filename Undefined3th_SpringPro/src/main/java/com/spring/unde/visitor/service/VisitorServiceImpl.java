package com.spring.unde.visitor.service;

import java.util.List;		

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.visitor.dao.VisitorDao;
import com.spring.unde.visitor.dto.VisitorDto;

@Component
public class VisitorServiceImpl implements VisitorService{

	
	@Autowired
	private VisitorDao visitorDao; 
	
	@Override
	public ModelAndView getList(HttpServletRequest request) {
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		VisitorDto dto=new VisitorDto();
		
		if(keyword!=null){//검색어가 전달된 경우
			dto.setWriter(keyword);
			request.setAttribute("keyword", keyword);
		}
		
		//모델앤뷰에 담으면 자동으로 리퀘스트에 담긴다.
		List<VisitorDto> list = visitorDao.getList(dto);
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		return mView;
		
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

	@Override
	public void getCount(VisitorDto dto) {
		visitorDao.getCount(dto);
	}
	
	

}
