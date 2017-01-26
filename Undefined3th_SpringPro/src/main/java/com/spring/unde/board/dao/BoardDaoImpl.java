package com.spring.unde.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.unde.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void increaseViewCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardDto getDate(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		List<BoardDto> list = session.selectList("board.getList", dto);
		return list;
	}

	@Override
	public int getCount() {
		int count=session.selectOne("board.getCount");
		return count;
	}

}
