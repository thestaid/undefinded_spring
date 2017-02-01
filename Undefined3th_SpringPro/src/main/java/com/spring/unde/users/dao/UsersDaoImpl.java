package com.spring.unde.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.unde.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public boolean insert(UsersDto dto) {
		boolean isSuccess=false;
		try{
			session.insert("users.insert", dto);
			isSuccess=true;
		}catch(Exception e){
			isSuccess=false;
		}
		return isSuccess;
	}

	@Override
	public String getPassword(String id) {
			String password=session.selectOne("users.getPwd", id);			
		return password;
	}

	@Override
	public boolean update(UsersDto dto) {
		boolean isSuccess=false;
		try{		
			session.update("users.update", dto);
			isSuccess=true;
		}catch(Exception e){isSuccess=false;}		
		return isSuccess;
	}

	@Override
	public boolean delete(String id) {
		boolean isSuccess=false;
		try{		
			session.delete("users.delete", id);
			isSuccess=true;
		}catch(Exception e){isSuccess=false;}			
		return isSuccess;
	}

	@Override
	public boolean canUseId(String id) {
		//인자로 전달된 아이디를 DB에서 select 해본다.
		String selectedId=session.selectOne("users.isExistId", id);
		if(selectedId==null){//없으면
			return true;//사용가능한 아이디가 없으면
		}else{
			return false;
		}
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto=session.selectOne("users.getData", id);
		return dto;
	}

	@Override
	public List<UsersDto> getList(UsersDto dto) {
		List<UsersDto> list=session.selectList("users.getList", dto);
		return list;
	}

	@Override
	public int getCount(UsersDto dto) {
		int count=session.selectOne("users.getCount", dto);
		return count;
	}

	@Override
	public boolean pwdSearch(UsersDto dto) {
		boolean isMatching=false;
		UsersDto resultDto=session.selectOne("users.pwdSearch", dto);
		if(resultDto==null){
			isMatching=false;
		}else{
			isMatching=true;
		}
		return isMatching;
	}

	@Override
	public boolean pwdupdate(UsersDto dto) {
		boolean isSuccess=false;
		try{		
			session.update("users.pwdupdate", dto);
			isSuccess=true;
		}catch(Exception e){isSuccess=false;}		
		return isSuccess;
	}
}
