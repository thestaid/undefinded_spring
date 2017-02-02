package com.spring.unde.photo.dao;

import java.util.List;

import com.spring.unde.photo.dto.PhotoDto;

public interface PhotoDao {
	public List<PhotoDto> getList(PhotoDto dto);
	public void upload(PhotoDto dto);
	public PhotoDto getData(int num);
	public void delete(int num);
	public int getCount();
}
