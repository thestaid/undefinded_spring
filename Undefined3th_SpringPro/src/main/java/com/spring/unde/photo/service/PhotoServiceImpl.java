package com.spring.unde.photo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.unde.photo.dao.PhotoDao;
import com.spring.unde.photo.dto.PhotoDto;

@Component
public class PhotoServiceImpl implements PhotoService {

	// 한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT = 5;
	// 하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT = 5;

	@Autowired
	private PhotoDao photoDao;

	@Override
	public ModelAndView getList(HttpServletRequest request, int pageNum) {
		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");

		// PhotoDto 객체를 생성해서
		PhotoDto dto = new PhotoDto();
		if (keyword != null) { // 검색어가 전달된 경우
			if (condition.equals("orgFileName")) { // 파일 검색
				dto.setOrgFileName(keyword);
			} else if (condition.equals("title")) {// 제목 검색
				dto.setTitle(keyword);
			} else if (condition.equals("writer")) {// 작성자 검색
				dto.setWriter(keyword);
			}
			// list.jsp 뷰페이지에서 필요한 내용을 request 에 담는다.
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		// 보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		// 전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = photoDao.getCount();
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		// 끝 페이지 번호가 잘못된 값이라면
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}

		// 시작 row 번호와 끝 row 번호를 PhotoDto 에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		// Dao 객체를 이용해서 글목록을 얻어온다.
		List<PhotoDto> list = photoDao.getList(dto);
		// ModelAndView 객체를 생성해서 글목록을 담는다.
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);

		// 리턴해주기
		return mView;
	}

	@Override
	public void upload(PhotoDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public ModelAndView getData(PhotoDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(PhotoDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub

	}

	@Override
	public ModelAndView updateForm(int num) {
		// TODO Auto-generated method stub
		return null;
	}

}
