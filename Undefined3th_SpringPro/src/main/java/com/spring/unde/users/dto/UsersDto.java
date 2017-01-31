package com.spring.unde.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String regdate;
	private String answer;
	private String aw;
	
	private int startRowNum;
	private int endRowNum;
	
	public UsersDto(){};
	
	public UsersDto(String id, String pwd, String email, String regdate, String answer, String aw1, String aw2,
			String aw3, int startRowNum, int endRowNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.regdate = regdate;
		this.answer = answer;
		this.aw = aw;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAw() {
		return aw;
	}

	public void setAw(String aw1) {
		this.aw = aw;
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
