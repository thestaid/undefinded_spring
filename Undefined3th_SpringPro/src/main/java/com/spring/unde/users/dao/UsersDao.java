package com.spring.unde.users.dao;

import java.util.List;

import com.spring.unde.users.dto.UsersDto;

public interface UsersDao {
	public boolean insert(UsersDto dto);
	public String getPassword(String id);
	public boolean update(UsersDto dto);
	public boolean delete(String id);
	public boolean canUseId(String id); 
	public UsersDto getData(String id);
	public List<UsersDto> getList(UsersDto dto);
	public int getCount(UsersDto dto);
}
