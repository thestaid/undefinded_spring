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

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum){
		
		ModelAndView mView=boardService.getList(request, pageNum);
		mView.setViewName("board/list");
		return mView;
	}
	
	@RequestMapping("/board/private/insertform")
	public String authInsertform(){
		return "board/private/insertform";
	}
	
	@RequestMapping("/board/private/insert")
	public ModelAndView authInsert(HttpServletRequest request, @ModelAttribute BoardDto dto){
		ModelAndView mView = new ModelAndView();
		boardService.insert(dto);
		mView.addObject("alertMess", "새 글이 추가되었습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/board/list.do");
		mView.setViewName("alert");
		return mView;
	}
	
	@RequestMapping("/board/detail")
	public ModelAndView detail(@RequestParam int num){
		ModelAndView mView=boardService.getData(num);
		mView.setViewName("board/detail");
		return mView;
	}
	

	@RequestMapping("/board/private/updateform")
	public ModelAndView authUpdateform(@RequestParam int num){
		ModelAndView mView=boardService.updateForm(num);
		mView.setViewName("board/private/updateform");
		return mView;
	}
	
	@RequestMapping("/board/private/update")
	public ModelAndView authUpdate(HttpServletRequest request ,@ModelAttribute BoardDto dto){
		boardService.update(dto);
		ModelAndView mView = new ModelAndView();
		mView.addObject("alertMess", "글이 수정되었습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/board/list.do");
		mView.setViewName("alert");
	 	return mView;
	}
	
	@RequestMapping("/board/private/delete")
	public ModelAndView authDelete(HttpServletRequest request ,@RequestParam int num){
		boardService.delete(num);
		String id = (String)request.getSession().getAttribute("id");
		ModelAndView mView = new ModelAndView();
		mView.addObject("alertMess", id+" 님 "+num+" 번째 글을 삭제하였습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/board/list.do");
		mView.setViewName("alert");
		return mView;
	}
}
