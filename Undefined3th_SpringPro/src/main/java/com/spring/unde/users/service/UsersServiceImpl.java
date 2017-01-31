package com.spring.unde.users.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.users.dao.UsersDao;
import com.spring.unde.users.dto.UsersDto;

@Component
public class UsersServiceImpl implements UsersService{
	//비밀번호 인코터 객체
	private PasswordEncoder pEncoder=new BCryptPasswordEncoder();
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public boolean insert(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isValid(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
