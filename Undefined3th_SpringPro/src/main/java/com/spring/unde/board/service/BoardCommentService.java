package com.spring.unde.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.board.dto.BoardCommentDto;

public interface BoardCommentService {

	public void insert(BoardCommentDto dto);
	public ModelAndView getList(HttpServletRequest request, int pageNum, int num);
	public int getSequence();
	public ModelAndView getData(int num);
	public void update(BoardCommentDto dto);
	public void delete(int num);
}
