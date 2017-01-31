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
	public void delete(int num) {
		session.delete("photo.delete", num);
	}

	@Override
	public int getCount() {
		int count=session.selectOne("photo.getCount");
		return count;
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
