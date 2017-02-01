package com.spring.unde.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.board.dao.BoardDao;
import com.spring.unde.board.dto.BoardCommentDto;
import com.spring.unde.board.dto.BoardDto;
import com.spring.unde.board.service.BoardCommentService;
import com.spring.unde.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	@RequestMapping("/board/private/commentInsert")
	public String authCommentInsert(@ModelAttribute BoardCommentDto dto){
		int seq=boardCommentService.getSequence();
		dto.setNum(seq);
		if(dto.getComment_group()==0){//원글에 대한 덧글인 경우
			//덧글의 그룹번호를 덧글의 글번호와 같게 설정한다.
			dto.setComment_group(seq);
		}else{//덧글의 덧글인 경우 
			//파라미터로 넘어온 덧글의 그룹번호를 넣어준다.
			dto.setComment_group(dto.getComment_group());
		}
		boardCommentService.insert(dto);
		return "redirect:/board/detail.do?num="+dto.getRef_group();
	}
	
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
	public ModelAndView detail(HttpServletRequest request, 
			@RequestParam(defaultValue="1") int pageNum, 
			@RequestParam int num){
		ModelAndView mView=boardCommentService.getList(request, pageNum, num);
		System.out.println("pageNum : "+pageNum);
		BoardDto dto = boardService.getData(num);
		mView.addObject("dto", dto);
		mView.setViewName("board/detail");
		return mView;
	}
	
	@RequestMapping("/board/private/commentUpdateform")
	public ModelAndView authCommentUpdateform(@RequestParam int num){
		ModelAndView mView = boardCommentService.getData(num);	
		mView.setViewName("board/private/commentUpdateform");
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
	
	@RequestMapping("/board/private/commentUpdate")
	public ModelAndView authCommentUpdate(HttpServletRequest request, @ModelAttribute BoardCommentDto dto){
		boardCommentService.update(dto);
		int textNum=Integer.parseInt(request.getParameter("textnum"));
		ModelAndView mView = new ModelAndView();
		mView.addObject("alertMess", "글을 수정하였습니다.");
		mView.addObject("redirectUri", request.getContextPath()+"/board/detail.do?num="+textNum);
		mView.setViewName("alert");
		return mView;
	}
	
	@RequestMapping("/board/private/commentDelete")
	public ModelAndView authCommentDelete(HttpServletRequest request, @ModelAttribute BoardCommentDto dto){
		boardCommentService.delete(dto.getNum());
		int textNum=Integer.parseInt(request.getParameter("textnum"));
		ModelAndView mView = new ModelAndView();
		mView.addObject("alertMess", "수고욥");
		mView.addObject("redirectUri", request.getContextPath()+"/board/detail.do?num="+textNum);
		mView.setViewName("alert");
		return mView;
	}
}
