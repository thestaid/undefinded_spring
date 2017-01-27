package com.spring.unde.board.dao;

import java.util.List;

import com.spring.unde.board.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> getList(BoardDto dto);
	public void insert(BoardDto dto);
	public BoardDto getData(int num);
	public void increaseViewCount(int num);
	public void update(BoardDto dto);
	public void delete(int num);
	public int getCount();
	
}
