package com.spring.unde.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
