package com.spring.unde.photo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.photo.dto.PhotoDto;

public interface PhotoService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public void upload(HttpServletRequest request, PhotoDto dto);
	public ModelAndView getData(int num);
	public void delete(int num);

}
