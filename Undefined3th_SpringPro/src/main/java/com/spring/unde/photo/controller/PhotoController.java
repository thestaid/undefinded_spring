package com.spring.unde.photo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.photo.service.PhotoService;

@Controller
public class PhotoController {

	@Autowired
	private PhotoService photoService;
	
	@RequestMapping("/photo/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum){
		ModelAndView mView = photoService.getList(request, pageNum);
		mView.setViewName("photo/list");
		return mView;
	}
	
}
