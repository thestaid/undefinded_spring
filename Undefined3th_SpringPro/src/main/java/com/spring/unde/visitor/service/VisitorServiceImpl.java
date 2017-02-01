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
	public ModelAndView getList(HttpServletRequest request) {
		//모델앤뷰에 담으면 자동으로 리퀘스트에 담긴다.
		List<VisitorDto> list = visitorDao.getList();
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
	
	

}
