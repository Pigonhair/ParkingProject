package com.parking.parking.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.parking.parking.dao.ParkingMapper;
import com.parking.parking.vo.ParkingVO;

@Service("parkingService")
public class ParkingServiceImpl implements ParkingService {
   
   @Resource
   private ParkingMapper parkingMapper;

   @Override
   public int getCapacityByParkID(int park_id) {
      int n = parkingMapper.getCapacityByParkID(park_id);
      return n;
      
   }
   
	@Override
	public String getParknameByParkid(int park_id) {
		String park_name = parkingMapper.getParknameByParkid(park_id);
		return park_name;
	}
	@Override
	   public void getInsertParking(ParkingVO vo) {
	      System.out.println("**********impl 들어옴********");
	      int park_id = parkingMapper.selectPark_id();
	      System.out.println("park_id : " + park_id);
	      vo.setPark_id(park_id);
	      parkingMapper.insertParking(vo); // member테이블 저장
	      
	   }

}