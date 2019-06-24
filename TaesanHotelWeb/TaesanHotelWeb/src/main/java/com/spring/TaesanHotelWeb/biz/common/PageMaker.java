package com.spring.TaesanHotelWeb.biz.common;

public class PageMaker {
	private int totalcount;//전체 게시물 개수
	private int pagenum;//현재 페이지 번호
	private int contentnum=10;//한 페이지에 몇개 표시할지
	private int startPage=1;//현재 페이지 블록의 시작 페이지
	private int endPage=10;//현재 페이지 블록의 마지막 페이지
	private boolean prev=false;//이전 페이지로 가는 화살표
	private boolean next;//다음 페이지로 가는 화살표
	private int currentblock;//현재 페이지 블록
	private int lastblock;//마지막 페이지 블록
	
	//prev & next 버튼 활성화
	public void prevnext(int pagenum) {
		if(pagenum>0 && pagenum<11) {
			setPrev(false);
			setNext(true);
		}else if(getLastblock() == getCurrentblock()) {
			setPrev(true);
			setNext(false);
		}else {
			setPrev(true);
			setNext(true);
		}
	}
	
	
	//전체 페이지 수를 계산하는 메소드
	public int calcpage(int totalcount, int contentnum) {
		
		//125 / 10 = 12.5
		//13페이지
		
		//50 / 10 = 5
		//5페이지
		
		int totalpage = totalcount / contentnum;
		if(totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	
	//한블록의 시작페이지
	public void setStartPage(int currentblock) {
		this.startPage = (currentblock*10)-9;
		//1 2 3 4 5
		//6 7 8 9 10
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	//한블록의 마지막페이지
	public void setEndPage(int getlastblock, int getcurrentblock) {
		//마지막블록 일때
		if(getlastblock == getcurrentblock) {
			this.endPage = calcpage(getTotalcount(), getContentnum()); //마지막 페이지
		}else {
			this.endPage = getStartPage()+9;
		}
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentblock() {
		return currentblock;
	}
	
	//현재 페이지 블록
	public void setCurrentblock(int pagenum) {
		//페이지 번호를 통해서 구한다.
		this.currentblock = pagenum/10; //11페이지/10 = 1.05
		if(pagenum%10>0) {//11%10>0 => 즉. 나머지가있으면
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	
	//마지막페이지 블록
	public void setLastblock(int lastblock) {
		//10개, 10페이지 => 100개
		
		//301개의 게시글 / 100 = 3.xx블록 => +1 해줘서 4블록 만들어줘야함
		this.lastblock = totalcount / (10*this.contentnum);
		if(totalcount % (10*this.contentnum)>0) {
			this.lastblock++;
		}
	}
}
