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
	public PhotoDto getData(int num) {
		PhotoDto dto = session.selectOne("photo.getData", num);
		return dto;
	}

	@Override
	public void update() {
		
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
		session.insert("photo.upload", dto);
	}

	@Override
	public List<PhotoDto> getList(PhotoDto dto) {
		List<PhotoDto> list = session.selectList("photo.getList", dto);
		return list;
	}

}
