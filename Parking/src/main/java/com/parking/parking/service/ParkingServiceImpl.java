package com.parking.parking.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.parking.dao.ParkingMapper;

@Service("parkingService")
public class ParkingServiceImpl implements ParkingService {
   
   @Resource
   private ParkingMapper parkingMapper;

   @Override
   public int getCapacityByParkID(int park_id) {
      int n = parkingMapper.getCapacityByParkID(park_id);
      return n;
      
   }

}