package com.ssafy.happyhouse.model.dao;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.BaseAddress;
import com.ssafy.happyhouse.model.dto.CoronaDto;
import com.ssafy.happyhouse.model.dto.HouseDealDto;
import com.ssafy.happyhouse.model.dto.PageBean;

@Mapper
public interface HouseDealDao{
	int totalCount();
	List<HouseDealDto> searchApt(Map<String, Object> map);
	List<HouseDealDto> searchHouse(Map<String, Object> map);
	List<CoronaDto> searchCorona(Map<String, Object> map);
	List<BaseAddress> searchGu(String city);
	List<BaseAddress> searchDong(String dongcode);
	int getTotalCount(Map<String, String> map);
}
