package com.spring.unde.visitor.dao;

import java.util.List;

import com.spring.unde.visitor.dto.VisitorDto;

public interface VisitorDao {
	public void insert(VisitorDto dto);
	public List<VisitorDto> getList(VisitorDto dto);
	public VisitorDto getData(int num);
	public VisitorDto getDataform(int num);
	public void update(VisitorDto dto);
	public void delete(int num);
	public int getCount(VisitorDto dto);

}
