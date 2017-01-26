package com.spring.unde.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.board.dao.BoardDao;
import com.spring.unde.board.dto.BoardDto;
import com.spring.unde.board.service.BoardService;

@Controller
public class BoardController {
	// 한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT = 10;
	// 하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT = 5;

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum){
		
		ModelAndView mView=boardService.getList(request, pageNum);
		mView.setViewName("board/list");
		return mView;
	}
	
	@RequestMapping("/board/private/insertform")
	public String insertform(){
		return "board/private/insertform";
	}
	
	@RequestMapping("/board/private/insert")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute BoardDto dto){
		ModelAndView mView = new ModelAndView();
		boardService.insert(dto);
		mView.addObject("alertMess", "새 글이 추가되었습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/board/list.do");
		mView.setViewName("alert");
		return mView;
	}
}
