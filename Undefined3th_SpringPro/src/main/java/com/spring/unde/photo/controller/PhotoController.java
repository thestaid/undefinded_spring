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
	public String authUploadform(){
		return "photo/private/uploadform";
	}
	
	@RequestMapping("/photo/private/upload")
	public ModelAndView authUpload(HttpServletRequest request, @ModelAttribute PhotoDto dto){
		ModelAndView mView = new ModelAndView();
		photoService.upload(request, dto);
		mView.addObject("alertMess", "새 사진이 이 추가되었습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/photo/list.do");
		mView.setViewName("alert");
		return mView;
	}
	
	@RequestMapping("/photo/download")
	public ModelAndView download(@RequestParam int num){
		ModelAndView mView=photoService.getData(num);
		System.out.println("요기요");
		System.out.println(num);
		/*
		 *  view 페키지에 DownloadView class 에 지정한
		 *  @Component("downloadView") 를 가리킨다. 
		 */
		mView.setViewName("downloadView");
		System.out.println("들어가기전");
		return mView;
	}
	
	@RequestMapping("/photo/private/delete")
	public ModelAndView authDelete(HttpServletRequest request ,@RequestParam int num){
		photoService.delete(num);
		String id = (String)request.getSession().getAttribute("id");
		ModelAndView mView = new ModelAndView();
		mView.addObject("alertMess", id+" 님 "+num+" 번째 글을 삭제하였습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/photo/list.do");
		mView.setViewName("alert");
		return mView;
	}
 
}
