package com.parking.parking.dao;

import org.apache.ibatis.annotations.Select;

public interface ParkingMapper {
   
   
    @Select("SELECT PARK_CAPACITY FROM PARKING WHERE park_id=#{park_id}")
   public int getCapacityByParkID(int park_id);

}