package com.spring.unde.visitor.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.visitor.dto.VisitorDto;

public interface VisitorService {
	public void insert(VisitorDto dto);
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public ModelAndView getData(int num);
	public void update(VisitorDto dto);
	public ModelAndView updateForm(int num);
	public void delete(int num);
	
	public void getCount(VisitorDto dto);
	
}
