package com.parking.parking.service;

import com.parking.parking.vo.ParkingVO;

public interface ParkingService {
    
   public int getCapacityByParkID(int park_id);

   public String getParknameByParkid(int park_id);
   
   public void getInsertParking(ParkingVO vo);
}