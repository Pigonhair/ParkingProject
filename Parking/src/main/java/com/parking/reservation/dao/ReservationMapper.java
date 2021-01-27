package com.parking.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.parking.reservation.vo.ReservationVO;
import com.parking.search.vo.SearchVO;

public interface ReservationMapper {

   // reservation 테이블 reser_id 시퀀스 적용하기
   @Select("SELECT reser_id_reservation.nextval FROM dual")
   public int selectReser();
   
   // reservation 테이블에 정보 입력
   @Insert("INSERT INTO RESERVATION (reser_id,park_id,mem_num,start_time,end_time)"
         + " values(#{reser_id},#{park_id},#{mem_num},#{start_time},#{end_time})")
   public void inserReser(ReservationVO vo);

   
   
}