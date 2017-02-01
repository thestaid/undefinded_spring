package com.spring.unde.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.users.dto.UsersDto;


public interface UsersService {
	public boolean insert(UsersDto dto);
	public boolean isValid(UsersDto dto);
	public boolean update(UsersDto dto);
	public boolean delete(String id);
	public Map<String, Object> canUseId(String id);
	public ModelAndView getData(String id);
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public boolean pwdSearch(UsersDto dto);
	public boolean pwdupdate(UsersDto dto);
}
