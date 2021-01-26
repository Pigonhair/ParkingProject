package com.parking.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

/*create table member(
        mem_num number not null, -- 멤버 식별 번호
        mem_id varchar2(20) unique not null, -- 아이디
        mem_auth number(1),  -- 0관리자 1사용자 2사장님
        mem_token varchar2(300), --카카오톡에서 받아올 토큰
        constraint member_pk primary key (mem_num) -- mem_num을 참조하여 member_pk라는 프라이머리키를 만듦
      );

      CREATE TABLE member_detail ( --멤버 상세정보
      mem_num number not null, -- member테이블에서 받아옴

      mem_name varchar2(20) not null, -- 이름
      mem_phone varchar2(20) not null, --전화번호
      mem_dis number(1), -- 0일반인 1몸이 불편하신분들(장애인, 임산부, 노약자 등)

      constraint member_detail_pk primary key (mem_num), 
      constraint member_detail_fk foreign key (mem_num) references member (mem_num)
      );*/
      
public class MemberVO {
	//---------------member-----------------------------
		// 멤버 식별 번호 (시퀀스 사용)
		private int mem_num;
		// 멤버 아이디 (이메일 사용)
		@NotEmpty
		private String mem_id;
		// 관리자 사용자 사장님
		private String mem_auth;
		// 카카오톡에서 받아올 토큰
		private String mem_token;

		// ----------------member_detail---------------------
		// 이름 (카카오톡 받아온 이름)
		@NotEmpty
		private String name;
		// 핸드폰 번호
		private String phone;
		// 장애여부
		private String dis;

		// ---------------member_car-------------------------------
		// 차량번호
		private String carid;
		// 차량모델
		private String carmodel;
		// 차량 카테코리(소형,중형,대형)
		private String category;

		public int getMem_num() {
			return mem_num;
		}

		public void setMem_num(int mem_num) {
			this.mem_num = mem_num;
		}

		public String getMem_id() {
			return mem_id;
		}

		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}

		public String getMem_auth() {
			return mem_auth;
		}

		public void setMem_auth(String mem_auth) {
			this.mem_auth = mem_auth;
		}

		public String getMem_token() {
			return mem_token;
		}

		public void setMem_token(String mem_token) {
			this.mem_token = mem_token;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getDis() {
			return dis;
		}

		public void setDis(String dis) {
			this.dis = dis;
		}

		public String getCarid() {
			return carid;
		}

		public void setCarid(String carid) {
			this.carid = carid;
		}

		public String getCarmodel() {
			return carmodel;
		}

		public void setCarmodel(String carmodel) {
			this.carmodel = carmodel;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

	}