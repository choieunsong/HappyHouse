package com.ssafy.happyhouse.model.dto;

import java.util.Date;

public class Reply {
	private int no;
	private int bno;
	private String writer;
	private String content;
	private Date writetime;
	
	public Reply() {
		
	}
	
	public Reply(int no, int bno, String writer, String content, Date writetime) {
		super();
		this.no = no;
		this.bno = bno;
		this.writer = writer;
		this.content = content;
		this.writetime = writetime;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	
	
}
