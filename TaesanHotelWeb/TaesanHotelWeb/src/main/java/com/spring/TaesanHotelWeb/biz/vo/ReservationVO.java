package com.spring.TaesanHotelWeb.biz.vo;

public class ReservationVO {
	private int r_seq;
	private String id;
	private String r_date;
	private String r_name;
	private String r_people;
	private int r_price;
	
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_people() {
		return r_people;
	}
	public void setR_people(String r_people) {
		this.r_people = r_people;
	}
	
	
}
