package com.parking.reservation.service;

import com.parking.reservation.vo.ReservationVO;


public interface ReservationService {

   // 예약시간 정보 넣기
   public void inseReser(ReservationVO vo);
   
   // 시작시간
   public int selectCheckParkingList(ReservationVO vo);
 
}