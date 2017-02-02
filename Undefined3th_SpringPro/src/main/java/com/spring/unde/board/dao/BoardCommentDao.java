package com.spring.unde.board.dao;

import java.util.List;

import com.spring.unde.board.dto.BoardCommentDto;

public interface BoardCommentDao {

	public void insert(BoardCommentDto dto);
	public List<BoardCommentDto> getList(BoardCommentDto dto);
	public int getSequence();
	public int getCount(int num);
	public BoardCommentDto getData(int num);
	public void update(BoardCommentDto dto);
	public void delete(int num);
}
