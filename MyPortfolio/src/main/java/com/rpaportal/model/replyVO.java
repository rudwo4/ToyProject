package com.rpaportal.model;

import java.util.Date;

public class replyVO {
	private int bno;
	private String writer;
	private String content;
	private Date reg_date;
	private int replybno;
	
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReplybno() {
		return replybno;
	}
	public void setReplybno(int replybno) {
		this.replybno = replybno;
	}
}
