package com.spring.unde.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.unde.board.dto.BoardCommentDto;

@Repository
public class BoardCommentDaoImpl implements BoardCommentDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BoardCommentDto dto) {
		session.insert("boardComment.insert", dto);
	}

	@Override
	public List<BoardCommentDto> getList(BoardCommentDto dto) {
		List<BoardCommentDto> list = session.selectList("boardComment.getList", dto);
		return list;
	}

	@Override
	public int getSequence() {
		int seq = session.selectOne("boardComment.getSequence");
		return seq;
	}

	@Override
	public int getCount(int num) {
		int count=session.selectOne("boardComment.getCount", num);
		return count;
	}

	@Override
	public void update(BoardCommentDto dto) {
		session.update("boardComment.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("boardComment.delete", num);
	}

	@Override
	public BoardCommentDto getData(int num) {
		BoardCommentDto dto=session.selectOne("boardComment.getData", num);
		return dto;
	}

}
