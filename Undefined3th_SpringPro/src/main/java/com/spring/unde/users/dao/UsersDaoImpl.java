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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String getPassword(String id) {
		// TODO Auto-generated method stub
		return null;
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
	public boolean canUseId(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UsersDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
