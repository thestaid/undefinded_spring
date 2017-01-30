package com.spring.unde.photo.dao;

import java.util.List;

import com.spring.unde.photo.dto.PhotoDto;

public interface PhotoDao {
	public List<PhotoDto> getList(PhotoDto dto);
	public void upload(PhotoDto dto);
	public PhotoDto getData();
	public void update();
	public void delete();
	public int getCount();
}
