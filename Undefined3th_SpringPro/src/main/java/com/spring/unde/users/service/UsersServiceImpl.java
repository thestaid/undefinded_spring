package com.spring.unde.users.service;

import java.util.HashMap;
import java.util.List;
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
		//암포화된 비밀번호를 얻어낸다.
		String encodePwd=pEncoder.encode(dto.getPwd());
		//Dto  객체에 다시 넣어준다.
		dto.setPwd(encodePwd);
		boolean isSuccess=usersDao.insert(dto);
		return isSuccess;
	}

	@Override
	public boolean isValid(UsersDto dto) {
		//아이디가 유효한지 여부
		boolean isValid=false;
		//아이디에 해당되는 DB에 저장된 암호화된 비밀번호를 읽어온다.
		String password=usersDao.getPassword(dto.getId());
		if(password!=null){//아이디가 존재하는 경우
			//.matches(사용자가 입력한 비밀번호, DB에 저장된 암호화 비밀번호를 
			//이용해서 비밀번호가 맞는지 여부를 boolean type으로 리턴받기)
			isValid=pEncoder.matches(dto.getPwd(), password);
		}
		return isValid;
	}

	@Override
	public boolean update(UsersDto dto) {
		//암포화된 비밀번호를 얻어낸다.
		String encodePwd=pEncoder.encode(dto.getPwd());
		//Dto  객체에 다시 넣어준다.
		dto.setPwd(encodePwd);		
		boolean isSuccess=usersDao.update(dto);
		return isSuccess;
	}

	@Override
	public boolean delete(String id) {
		boolean isSuccess=usersDao.delete(id);
		return isSuccess;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		//아이디 사용가능 여부를 리턴받는다.
		boolean canUse=usersDao.canUseId(id);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("canUse", canUse);
		//Map 리턴해주기
		return map;
	}

	@Override
	public ModelAndView getData(String id) {
		//Dao 를 이용해서 회원정보를 얻어온다.
		UsersDto dto=usersDao.getData(id);
		//ModelAndView 객체를 생성해서
		ModelAndView mView=new ModelAndView();
		//회원 정보를  "dto"라는 키값으로 담는다.
		mView.addObject("dto", dto);
		//ModelAndView 객체를 리턴해준다.
		return mView;
	}

	@Override
	public ModelAndView getList() {
		//Dao 를 이용해서 회원정보를 얻어온다.
		List<UsersDto> list=usersDao.getList();
		//ModelAndView 객체를 생성해서
		ModelAndView mView=new ModelAndView();
		//회원 정보를  "dto"라는 키값으로 담는다.
		mView.addObject("list", list);
		//ModelAndView 객체를 리턴해준다.
		return mView;
	}

}
