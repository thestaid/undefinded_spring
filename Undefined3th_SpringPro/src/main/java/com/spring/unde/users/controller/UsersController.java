package com.spring.unde.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.users.dto.UsersDto;
import com.spring.unde.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;

	// "users/signin_form.do" 로그인 폼 요청 처리
	@RequestMapping("/users/signin_form")
	public String signin_form(HttpSession session){
		//세션 초기화
		session.invalidate();
		//뷰페이지로 forward 이동
		return "users/signin_form";
	}
	
	// "/users/signin.do" 로그인 요청 처리
	@RequestMapping("/users/signin")
	public ModelAndView signin(HttpSession session, @ModelAttribute UsersDto dto,@RequestParam String uri){
		//아이디 비밀번호가 유효한지 여부를 확인 한다.
		boolean isValid=usersService.isValid(dto);
		ModelAndView mView=new ModelAndView();
		if(isValid){//아이디 비번이 맞으면
			//로그인 처리를 해준다.
			session.setAttribute("id", dto.getId());
			mView.addObject("alertMess", dto.getId()+"님이 로그인 되었습니다.");
			mView.addObject("redirectUri", uri);
		}else{
			//아이디 혹은 비밀번호가 틀리다는 정보를 응답한다.
			mView.addObject("alertMess", "아이디 혹은 비밀번호가 틀려요");
			String location=session.getServletContext().getContextPath()+
					"/users/signin_form.do?uri="+uri;
			mView.addObject("redirectUri", location);
		}
		// alert창으로 보낸다.
		mView.setViewName("alert");
		return mView;
	}
	
	@RequestMapping("/users/signup_form")
	public String signup_form(HttpServletRequest request, @RequestParam String uri){
		request.setAttribute("uri", uri);
		return "users/signup_form";
	}

	// ajax "/users/checkid.do 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=usersService.canUseId(inputId);
		//json 문자열로 응답
		return map;
	}	
	
	//
	@RequestMapping("/users/signup")
	public ModelAndView signup(HttpServletRequest request, @ModelAttribute UsersDto dto, @RequestParam String uri){
		boolean isSuccess=usersService.insert(dto);
		String alertMess="";
		String redirectUri=request.getContextPath()+"/users/signin_form.do?uri="+uri;
		if(isSuccess){
			alertMess="회원가입 성공 했습니다.";
		}else{
			alertMess="회원가입 실패 했습니다.";
			redirectUri=request.getContextPath()+"/users/signup_form.do";
		}
		ModelAndView mView=new ModelAndView();
		
		mView.addObject("alertMess", alertMess);
		mView.addObject("redirectUri", redirectUri);
		mView.setViewName("alert");		
		return mView;		
	}
	
	// "/users/signout.do" 요청 처리
	@RequestMapping("/users/signout")
	public ModelAndView signout(HttpSession session){
		//세션 초기화
		session.invalidate();
		ModelAndView mView=new ModelAndView();
		mView.addObject("alertMess", "로그 아웃 되었습니다.");
		mView.addObject("redirectUri", session.getServletContext().getContextPath());
		mView.setViewName("alert");
		return mView;
	}	

	// "/users/private/info.do" 개인정보 보기 요청 처리
	@RequestMapping("/users/private/info")
	public ModelAndView authinfo(HttpSession session){
		//1. 세션에 저장된 id 정보를 읽어온다.
		String id=(String)session.getAttribute("id");
		//2.UserDto가 담긴 ModelAndView 객체를 리턴 받는다.
		ModelAndView mView=usersService.getData(id);
		//3. forward 경로를 담는다.
		mView.setViewName("users/private/info");
		//4. ModelAndView 객체를 리턴해준다.
		return mView;
	}		
	
	// "/users/private/delete.do" 개인정보 삭제 요청 처리
	@RequestMapping("/users/private/delete")
	public ModelAndView authdelete(HttpServletRequest request){
		String id=request.getParameter("id");
		//서비스를 이용해서 DB에서 회원정보를 삭제하고
		boolean isSuccess=usersService.delete(id);
		String redirectUri="";
		ModelAndView  mView=new ModelAndView();
		if(isSuccess){
			String sessionId=(String)request.getSession().getAttribute("id");
			if(sessionId.equals("admin")){
	            request.setAttribute("alertMess", "탈퇴되엇어요.");
	            redirectUri=request.getContextPath()+"/admin/list.do";
	         }else{
	 			request.getSession().invalidate();
				mView.addObject("alertMess", "탈퇴되었습니다.");
				redirectUri=request.getContextPath();	        	 
	         }
		}else{
			mView.addObject("alertMess", "탈퇴 실패되었습니다.");
			redirectUri=request.getContextPath()+"/users/private/info.do?id="+id;				
		}
		mView.addObject("redirectUri", redirectUri);
		mView.setViewName("alert");
		return mView;
	}
	
	// "/users/private/update.do" 개인정보 수정 요청 처리
	@RequestMapping("/users/private/update")
	public ModelAndView authupdate(HttpServletRequest request,@ModelAttribute UsersDto dto){
		boolean isSuccess=usersService.update(dto);
		ModelAndView mView=new ModelAndView();
		if(isSuccess){
			mView.addObject("alertMess", dto.getId()+"님 회원 정보 수정했습니다.");
		}else{
			mView.addObject("alertMess", "수정실패하였습니다.");
		}
		String path=request.getContextPath()+"/users/private/info.do";
		mView.addObject("redirectUri", path);
		mView.setViewName("alert");
		return mView;
	}
	
	// "/users/private/updateform.do" 개인정보 수정 폼 요청 처리
	@RequestMapping("/users/private/updateform")
	public ModelAndView authupdateForm(HttpSession session){
		//1. 세션에서 아이디 정보를 읽어온다.
		String id=(String)session.getAttribute("id");
		//2. 수정할 회원의 정보를 담고 있는 ModelAndView 객체를 얻어온다.
		ModelAndView mView=usersService.getData(id);
		//3. forward 이동할 정보를 담아서
		mView.setViewName("users/private/updateform");
		//4. 리턴해준다.
		return mView;
	}
	
	@RequestMapping("/admin/list")
	public ModelAndView authAdminList(HttpServletRequest request ,@RequestParam(defaultValue="1") int pageNum){
		
		//글목록이 담겨 있는 ModelAndView 객체를 리턴 받는다
		ModelAndView mView=usersService.getList(request, pageNum);
		//뷰페이지의 정보 설정하고
		mView.setViewName("users/private/list");
		//리턴해준다.
		return mView;
	}
	
	@RequestMapping("/users/pwdSearchForm")
	public String pwdSearchForm(HttpServletRequest request, @RequestParam String uri){
		request.setAttribute("uri", uri);
		return "users/pwdSearch_form";
	}	
	
	@RequestMapping("/users/pwdSearch")
	public ModelAndView pwdSearch(HttpServletRequest request,@ModelAttribute UsersDto dto, @RequestParam String uri){
		boolean isMatching=usersService.pwdSearch(dto);
		ModelAndView mView=new ModelAndView();
		if(isMatching){
			mView.addObject("alertMess", "비밀번호 찾기 정보를 확인했습니다.. 비밀번호 정보를 수정해주세요.");
			String path=request.getContextPath()+"/users/pwdSearchUpdateform.do?uri="+uri+"&id="+dto.getId();
			mView.addObject("redirectUri", path);
		}else{
			mView.addObject("alertMess", "비밀번호 찾기  정보가 일치하지 않습니다. 확인 해주세요.");
			String path=request.getContextPath()+"/users/pwdSearchForm.do?uri="+uri;
			mView.addObject("redirectUri", path);
		}		
		mView.setViewName("alert");
		return mView;
	}
	
	@RequestMapping("/users/pwdSearchUpdateform")
	public String pwdSearchUpdateform(HttpServletRequest request, @RequestParam String uri, @RequestParam String id){
		request.setAttribute("uri", uri);
		request.setAttribute("checkId", id);
		return "users/pwdSearchUpdate_form";
	}	
	
	@RequestMapping("/users/pwdUpdate")
	public ModelAndView pwdSearchUpdate(HttpServletRequest request,@ModelAttribute UsersDto dto, @RequestParam String uri){
		boolean isSuccess=usersService.pwdupdate(dto);
		ModelAndView mView=new ModelAndView();
		if(isSuccess){
			mView.addObject("alertMess", dto.getId()+"님 비밀번호를 변경했습니다.");
		}else{
			mView.addObject("alertMess", "비밀번호 변경을 실패하였습니다.");
		}
		mView.addObject("redirectUri", uri);
		mView.setViewName("alert");
		return mView;
	}
}
