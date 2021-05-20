package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.BaseAddress;
import com.ssafy.happyhouse.model.dto.HouseDealDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseDealService{
	List<HouseDealDto> searchApt(String aptName, String pageNo);
	List<HouseDealDto> searchHouse(String dong, String pageNo);
	List<BaseAddress> searchGu(String city);
	List<BaseAddress> searchDong(String dongcode);
	PageNavigation makePageNavigation(Map<String, String> map);
}
