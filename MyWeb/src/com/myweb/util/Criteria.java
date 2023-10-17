package com.myweb.util;

public class Criteria {
	
	// select * from board order by num desc limit ?(index), ?(개수);
	
	private int pageNum; // 페이지 번호
	private int count; // 페이지당 게시물 수 
	
	public Criteria() {
		// 최소 게시판에 진입할 때 기본값 1번 페이지, 10개를 데이터로 세팅
		this.pageNum = 1;
		this.count = 10;
	}

	public Criteria(int pageNum, int count) {
		// 매개 변수를 전달 받아 페이지 출력 값을 계산 처리하게 함.
		this.pageNum = pageNum;
		this.count = count;
	}
	
	//getter/setter
	public int getPageStart() {
		return (pageNum -1) * count;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

	
	
	
}
