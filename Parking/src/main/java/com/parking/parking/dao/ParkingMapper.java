package com.parking.parking.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.parking.parking.vo.ParkingVO;

public interface ParkingMapper {
   
   
    @Select("SELECT PARK_CAPACITY FROM PARKING WHERE park_id=#{park_id}")
   public int getCapacityByParkID(int park_id);

	@Select("SELECT PARK_NAME FROM PARKING WHERE PARK_Id=#{park_id}")
	public String getParknameByParkid(int park_id);
	
   @Select("SELECT park_id.nextval FROM dual")
    public int selectPark_id();
   
   @Insert("INSERT INTO Parking(park_id, park_name, park_capacity, mem_num, park_type,detailAddr,park_public)"
         + "VALUES (#{park_id},#{park_name},#{park_capacity},#{mem_num}, #{park_type},#{detailAddr},#{park_public})")
   public void insertParking(ParkingVO vo);

}