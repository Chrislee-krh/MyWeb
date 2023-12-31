package com.myweb.util;

public class PageVO {
	//페이징 계산 처리  클래스 
	   // 1. total :게시판 글 전체 개수
	   // 2. endPage : 게시판을 화면에 보여질 마지막 페이지 번호
	   //            - 1~10 이면 ,  endPage는 10
	   //            - 11~20 이면 , endPage는 20
	   //            - 21~30 이면 , endPage는 30
	   // 3. startPage : 게시판 화면에 보여질 첫 번째 페이지 번호
	   //         -endPage가 10이면, startPage는 1 
	   //         -endPage가 20이면, startPage는 11
	   //         -endPage가 30이면, startPage는 21
	   // 4. realEnd: 게시판의 실제 마지막 페이지 번호 
	   //         -게시물이 30이면 3 , 게시물이 45이면 5
	   // 5. prev : 이전 페이지 버튼 활성화 여부
	   //      -startPage 1이면 비활성화
	   //      -startPage 11보다  크면 활성화
	   // 6. next : 다음 페이지 버튼 활성화 여부 
	   //      -realEnd가 endPage보다 크면 활성화
	
	//화면에 그려질 버튼들의 개수 계산 클래스
	private int startPage; 	// 시작 번호
	private int endPage;	// 끝 번호
	private int total;		// 전체 게시글 수
	
	private int pageNum;	// 현재 조회하는 페이지
	
	private boolean next; 	// 다음 버튼 활성화 여부
	private boolean prev;	// 이전 버튼 활성화 여부
	
	private Criteria cri;	// 페이징 기준
	
	//기본 생성자로 생성 안함, total과 Criteria를 받아서 계산하도록 처리
	public PageVO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		this.pageNum = cri.getPageNum();
		
		//끝 페이지 계산 - endPage
		// 1~10 -> 10, 11~20 -> 20
		// Math.ceil 올림 메서드
		// (int)Math.ceil(조회 페이지 번호/(double)10)* 10
		// 페이지 수(cri.getCount()랑 다름)
		this.endPage = (int)Math.ceil(cri.getPageNum()/(double)10)* 10; 
		
		// startPage
		// endPage - 9(표시할 페이지 수 -1);
		this.startPage = endPage - 9;
				
		// realEndPage
		// 페이지 당 게시글 수(10=cri.getCount())
		int realEnd = (int)Math.ceil(this.total/(double)cri.getCount()); 
		
		// 마지막 페이지 세팅에서 보여줘야 하는 번호
		if(this.endPage>realEnd) {
			this.endPage = realEnd;
		}
		
		// 이전 페이지 버튼
		// startPage => 1, 11, 21, ...
		this.prev = startPage >1;
		
		// 다음 페이지 버튼
		this.next = realEnd > this.endPage;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
}
