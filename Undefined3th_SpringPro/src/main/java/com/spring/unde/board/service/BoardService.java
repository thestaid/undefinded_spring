package com.spring.unde.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.board.dto.BoardDto;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public void insert(BoardDto dto);
	public BoardDto getData(int num);
	public void update(BoardDto dto);
	public void delete(int num);
	public ModelAndView updateForm(int num);

}
