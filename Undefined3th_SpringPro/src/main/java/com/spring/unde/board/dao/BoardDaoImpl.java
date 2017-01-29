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
		session.update("board.increaseViewCount", num);
		
	}

	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert", dto);
	}

	@Override
	public void update(BoardDto dto) {
		session.update("board.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("board.delete", num);
	}

	@Override
	public BoardDto getData(int num) {
		BoardDto dto = session.selectOne("board.getData", num);
		return dto;
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
