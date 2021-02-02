package com.parking.parking.service;

public interface ParkingService {
    
   public int getCapacityByParkID(int park_id);

   public String getParknameByParkid(int park_id);
}