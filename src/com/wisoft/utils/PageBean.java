package com.wisoft.utils;

public class PageBean {
	private int pageNo=1;
	private int pageSize=5;//后面的
	private int totalCount=0;
	private int pageOne=0;//分页前面的那个

	private int pageCount=0;
	private int pagePrev=0;
	private int pageNext=0;
	
	
	public int getPageOne() {
		return (this.getPageNo()-1)*this.getPageSize();
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCount() {
		return (getTotalCount()+getPageSize()-1)/getPageSize();
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPagePrev() {
		if(getPageNo()>1){
			return getPageNo()-1;
		}else{
			return getPageNo();
		}
	}
	public void setPagePrev(int pagePrev) {
		this.pagePrev = pagePrev;
	}
	public int getPageNext() {
		if(getPageNo()<getPageCount()){
			return getPageNo()+1;
		}else{
			return getPageNo();
		}
	}
	public void setPageNext(int pageNext) {
		this.pageNext = pageNext;
	}

}
