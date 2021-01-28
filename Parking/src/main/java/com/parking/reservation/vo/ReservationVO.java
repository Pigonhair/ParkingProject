package com.parking.reservation.vo;

public class ReservationVO {
	private int reser_id; // 예약번호
	private int park_id; // 주차장번호
	private int mem_num; // 사용자 번호
	private String start_time; // 예약 시작시간
	private String end_time; // 예약 종료 시간
	private int totalPrice;
//   private String date; // 예약 날자

	public int getReser_id() {
		return reser_id;
	}

	public void setReser_id(int reser_id) {
		this.reser_id = reser_id;
	}

	public int getPark_id() {
		return park_id;
	}

	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

//   public String getDate() {
//      return date;
//   }
//
//   public void setDate(String date) {
//      this.date = date;
//   }

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}