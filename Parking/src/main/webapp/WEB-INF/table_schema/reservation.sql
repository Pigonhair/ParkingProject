

--reservation 테이블 만들기
create table reservation(			-- 예약정보
  reser_id number not null, 		-- 예약번호
  park_id number,		 			-- 주차장번호
  mem_num number,  					-- 사용자번호
  start_time VARCHAR2(100),			 		-- 예약시작시간
  end_time VARCHAR2(100),					-- 예약종료시간	
--  rdate	DATE,						-- 예약날짜
  totalPrice number,
  constraint reser_id_pk primary key (reser_id), 
  constraint reser_mem_num foreign key (mem_num) references member (mem_num)
);

create sequence reser_id_reservation nocache nocycle;

SELECT* FROM RESERVATION;
DROP TABLE RESERVATION;
DROP SEQUENCE reser_id_reservation;
