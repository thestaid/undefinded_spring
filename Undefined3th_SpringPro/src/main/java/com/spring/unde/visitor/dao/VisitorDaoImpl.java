package com.spring.unde.visitor.dao;

import java.util.List;	

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.unde.visitor.dto.VisitorDto;

@Repository
public class VisitorDaoImpl implements VisitorDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(VisitorDto dto) {
		session.insert("visitor.insert", dto);
	}

	@Override
	public List<VisitorDto> getList(VisitorDto dto) {
		List<VisitorDto> list = session.selectList("visitor.getList", dto);
		return list;
	}

	@Override
	public VisitorDto getData(int num) {
		VisitorDto resultdto = session.selectOne("visitor.getData");
		return resultdto;
	}

	@Override
	public VisitorDto getDataform(int num) {
		VisitorDto resultdto = session.selectOne("visitor.getDataform");
		return resultdto;
	}

	@Override
	public void update(VisitorDto dto) {
		session.update("visitor.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("visitor.delete", num);
	}

	@Override
	public int getCount(VisitorDto dto) {
		int count=session.selectOne("visitor.getCount", dto);
		return count;
	}



}
