package com.rpaportal.model;

public class pageHandler {
	
	int pageSize =5;
	final int NAV_SZIE = 10;
	private int pageNum;
	private int startPage;
	private int endPage;
	private String keyword;
	private String category;
	private String StartDate;
	private String EndDate;
	private String tableName;
	
	public pageHandler() {
		this(1,5);
	}
	
	public pageHandler(int startPage, int endPage) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getNAV_SZIE() {
		return NAV_SZIE;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartDate() {
		return StartDate;
	}

	public void setStartDate(String startDate) {
		StartDate = startDate;
	}

	public String getEndDate() {
		return EndDate;
	}

	public void setEndDate(String endDate) {
		EndDate = endDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
