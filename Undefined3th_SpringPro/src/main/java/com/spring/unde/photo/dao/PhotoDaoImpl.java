package com.spring.unde.photo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.unde.photo.dto.PhotoDto;

@Repository
public class PhotoDaoImpl implements PhotoDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public PhotoDto getData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void upload(PhotoDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PhotoDto> getList(PhotoDto dto) {
		List<PhotoDto> list = session.selectList("photo.getList", dto);
		return list;
	}

}
