package com.spring.TaesanHotelWeb.biz.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {
	private int c_seq;
	private int b_seq;
	private String c_content;
	private String c_writer;
	private String c_regdate;
	private int c_cnt;
	private String cm; //댓글, 대댓글 구분자
	
	public String getCm() {
		return cm;
	}
	public void setCm(String cm) {
		this.cm = cm;
	}
	//계층형 게시판
	private int originNo; //원글번호
	private int groupOrd; //원글에 대한 순서
	private int groupLayer; //답글 계층
	
	public int getOriginNo() {
		return originNo;
	}
	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}
	public int getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}
	public int getGroupLayer() {
		return groupLayer;
	}
	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}
	public int getC_cnt() {
		return c_cnt;
	}
	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		
		this.c_writer = c_writer;
	}
	public String getC_regdate() {
		
		return c_regdate;
	}
	public void setC_regdate(String c_regdate) {
		//SimpleDateFormat test = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		this.c_regdate = c_regdate;
	}
	
}
