package com.spring.unde.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.users.dao.UsersDao;
import com.spring.unde.users.dto.UsersDto;

@Component
public class UsersServiceImpl implements UsersService{
	//비밀번호 인코터 객체
	private PasswordEncoder pEncoder=new BCryptPasswordEncoder();

	// 한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT = 10;	
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public boolean insert(UsersDto dto) {
		//암포화된 비밀번호를 얻어낸다.
		String encodePwd=pEncoder.encode(dto.getPwd());
		//Dto  객체에 다시 넣어준다.
		dto.setPwd(encodePwd);
		boolean isSuccess=usersDao.insert(dto);
		return isSuccess;
	}

	@Override
	public boolean isValid(UsersDto dto) {
		//아이디가 유효한지 여부
		boolean isValid=false;
		//아이디에 해당되는 DB에 저장된 암호화된 비밀번호를 읽어온다.
		String password=usersDao.getPassword(dto.getId());
		if(password!=null){//아이디가 존재하는 경우
			//.matches(사용자가 입력한 비밀번호, DB에 저장된 암호화 비밀번호를 
			//이용해서 비밀번호가 맞는지 여부를 boolean type으로 리턴받기)
			isValid=pEncoder.matches(dto.getPwd(), password);
		}
		return isValid;
	}

	@Override
	public boolean update(UsersDto dto) {
		//암포화된 비밀번호를 얻어낸다.
		String encodePwd=pEncoder.encode(dto.getPwd());
		//Dto  객체에 다시 넣어준다.
		dto.setPwd(encodePwd);		
		boolean isSuccess=usersDao.update(dto);
		return isSuccess;
	}

	@Override
	public boolean delete(String id) {
		boolean isSuccess=usersDao.delete(id);
		return isSuccess;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		//아이디 사용가능 여부를 리턴받는다.
		boolean canUse=usersDao.canUseId(id);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("canUse", canUse);
		//Map 리턴해주기
		return map;
	}

	@Override
	public ModelAndView getData(String id) {
		//Dao 를 이용해서 회원정보를 얻어온다.
		UsersDto dto=usersDao.getData(id);
		//ModelAndView 객체를 생성해서
		ModelAndView mView=new ModelAndView();
		//회원 정보를  "dto"라는 키값으로 담는다.
		mView.addObject("dto", dto);
		//ModelAndView 객체를 리턴해준다.
		return mView;
	}

	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//BoardDto 객체를 생성해서
		UsersDto dto=new UsersDto();
		if(keyword != null){ //검색어가 전달된 경우
			if(condition.equals("Id")){ //아이디
				dto.setId(keyword);
			}else if(condition.equals("Email")){//이메일
				dto.setEmail(keyword);
			}
			// list.jsp 뷰페이지에서 필요한 내용을 request 에 담는다.
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		
		
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow=usersDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		// 회원목록을 얻어온다
		List<UsersDto> list = usersDao.getList(dto);

		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		//리턴해주기
		return mView;		
	}

}
