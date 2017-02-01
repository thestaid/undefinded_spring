package com.spring.unde.visitor.dto;

public class VisitorDto {
	private int num;
	private String writer;
	private String content;
	private String target_id;
	private String regdate;
	
	private int startRowNum; //시작 row 번호
	private int endRowNum;   //끝 row 번호
	
	
	public VisitorDto(){}
	
	public VisitorDto(int num, String writer, String content, String target_id, String regdate, int startRowNum,
			int endRowNum, int prevNum, int nextNum) {
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
}
