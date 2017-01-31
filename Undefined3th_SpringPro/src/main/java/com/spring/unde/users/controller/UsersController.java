package com.spring.unde.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.users.dto.UsersDto;
import com.spring.unde.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;

	// "users/signin_form.do" 로그인 폼 요청 처리
	@RequestMapping("/users/signin_form")
	public String signin_form(HttpSession session){
		//세션 초기화
		session.invalidate();
		//뷰페이지로 forward 이동
		return "users/signin_form";
	}
	
	@RequestMapping("/users/signup_form")
	public String signup_form(){
		return "users/signup_form";
	}

	// ajax "/users/checkid.do 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=usersService.canUseId(inputId);
		//json 문자열로 응답
		return map;
	}	
	
	//
	@RequestMapping("/users/signup")
	public ModelAndView signup(HttpServletRequest request, @ModelAttribute UsersDto dto){
		boolean isSuccess=usersService.insert(dto);
		String alertMess="";
		String redirectUri=request.getContextPath()+"/home.do";
		if(isSuccess){
			alertMess="회원가입 성공 했습니다.";
		}else{
			alertMess="회원가입 실패 했습니다.";
			redirectUri=request.getContextPath()+"/users/signup_form.do";
		}
		ModelAndView mView=new ModelAndView();
		
		mView.addObject("alertMess", alertMess);
		mView.addObject("redirectUri", redirectUri);
		mView.setViewName("alert");		
		return mView;		
	}
	
}
