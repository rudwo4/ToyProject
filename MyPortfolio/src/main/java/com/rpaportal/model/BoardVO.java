package com.rpaportal.model;

import java.util.Date;

public class BoardVO {
	private int rownum;
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String category;
	private int view_cnt;
	private int commnet_cnt;
	private Date reg_date;
	private Date up_date;
	private Date delete_date;
	private char deleteChk;
	private String tableType;
	private String status;
	private String eduStartDate;
	private String eduEndDate;
	private String regStartDate;
	private String regEndDate;
	private int reply_cnt;
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getCommnet_cnt() {
		return commnet_cnt;
	}
	public void setCommnet_cnt(int commnet_cnt) {
		this.commnet_cnt = commnet_cnt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public Date getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}

	public char getDeleteChk() {
		return deleteChk;
	}

	public void setDeleteChk(char deleteChk) {
		this.deleteChk = deleteChk;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	@Override
	public String toString() {
		return "BoardVO [rownum=" + rownum + ", bno=" + bno + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", view_cnt=" + view_cnt + ", commnet_cnt=" + commnet_cnt + ", reg_date=" + reg_date
				+ ", up_date=" + up_date + ", delete_date=" + delete_date + ", deleteChk=" + deleteChk + ", tableType="
				+ tableType + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEduStartDate() {
		return eduStartDate;
	}

	public void setEduStartDate(String eduStartDate) {
		this.eduStartDate = eduStartDate;
	}

	public String getEduEndDate() {
		return eduEndDate;
	}

	public void setEduEndDate(String eduEndDate) {
		this.eduEndDate = eduEndDate;
	}

	public String getRegStartDate() {
		return regStartDate;
	}

	public void setRegStartDate(String regStartDate) {
		this.regStartDate = regStartDate;
	}

	public String getRegEndDate() {
		return regEndDate;
	}

	public void setRegEndDate(String regEndDate) {
		this.regEndDate = regEndDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

}
