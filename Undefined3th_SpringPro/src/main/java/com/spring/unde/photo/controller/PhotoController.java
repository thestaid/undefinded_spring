package com.spring.unde.photo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.board.dto.BoardDto;
import com.spring.unde.photo.dto.PhotoDto;
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
	
	@RequestMapping("/photo/private/uploadform")
	public String uploadform(){
		return "photo/private/uploadform";
	}
	
	@RequestMapping("/photo/private/upload")
	public ModelAndView upload(HttpServletRequest request, @ModelAttribute PhotoDto dto){
		ModelAndView mView = new ModelAndView();
		photoService.upload(request, dto);
		mView.addObject("alertMess", "새 사진이 이 추가되었습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/photo/list.do");
		mView.setViewName("alert");
		return mView;
	}
	
	
}
