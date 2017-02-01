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

	@Autowired
	private VisitorService visitorService;
		
	//파라미터로 페이지 번호가 넘어올수도 있고 안넘어 올 수도 있다.
	//만일 안넘어오면 default 값으로 1을 넣어준다.
	@RequestMapping("/visitor/visitors")
	public ModelAndView list(HttpServletRequest request){
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
	
	@RequestMapping("/visitor/detail")
	public ModelAndView detail(@RequestParam int num){
		ModelAndView mView =  visitorService.getData(num);
		mView.setViewName("visitor/detail");
		return mView;
	}
	
	//글 삭제 요청 처리
	@RequestMapping("/visitor/private/delete")
	public ModelAndView authDelete(@RequestParam int num){
		visitorService.delete(num);
		return new ModelAndView("redirect:/visitor/list.do");
	}
	
	//글 수정폼 요청 처리
	@RequestMapping("/visitor/private/updateform")
	public ModelAndView authUpdateform(@RequestParam int num){
		//수정할 글의 정보가 담긴 ModelAndView 객체를 리턴받는다
	ModelAndView mView= visitorService.updateForm(num);
	//view 페이지 정보 설정하고
	mView.setViewName("visitor/private/updateform");
	//리턴해준다
			return mView;   
	   }
	
	@RequestMapping("/visitor/private/update")
	public ModelAndView authUpdate(@ModelAttribute VisitorDto dto){
		visitorService.update(dto);
		return new ModelAndView("redirect:/visitor/list.do");
	}
}
