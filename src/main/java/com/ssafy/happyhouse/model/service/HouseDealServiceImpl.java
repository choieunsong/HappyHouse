package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseDealDao;
import com.ssafy.happyhouse.model.dto.BaseAddress;
import com.ssafy.happyhouse.model.dto.HouseDealDto;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	@Autowired
	HouseDealDao houseDealDao;
	
	@Override
	public List<HouseDealDto> searchHouse(String dong, String pageNo){
		System.out.println("service: dong " + dong+", pageNo: " + pageNo);
		Map<String, Object> param = new HashMap<String, Object>();
		
		int spp = 5;
		int pg = Integer.parseInt(pageNo);
		param.put("dong", dong);
		param.put("start", (pg - 1) * spp);
		param.put("spp", 5);
		return houseDealDao.searchHouse(param);
	}

	@Override
	public List<BaseAddress> searchGu(String city){
		return houseDealDao.searchGu(city);
	}
	
	@Override
	public List<BaseAddress> searchDong(String dongcode){
		return houseDealDao.searchDong(dongcode);
	}
	
	@Override
	public List<HouseDealDto> searchApt(String aptName, String pageNo){
		System.out.println("service: aptName " + aptName +", pageNo: " + pageNo);
		Map<String, Object> param = new HashMap<String, Object>();
		
		int spp = 5;
		int pg = Integer.parseInt(pageNo);
		param.put("aptName", aptName);
		param.put("start", (pg - 1) * spp);
		param.put("spp", 5);
		System.out.println("aptName: " + param.get("aptName") + "start: " + param.get("start") + "spp: " + param.get("spp"));
		return houseDealDao.searchApt(param);
	}
	
	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		int navSize = 10;
		int currentPage = Integer.parseInt(map.get("pageNo"));
		int sizePerPage = 5;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(navSize);
		
		int totalCount = houseDealDao.getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		
		boolean startRange = currentPage <= navSize;
		pageNavigation.setStartRange(startRange);
		
		boolean endRange = (totalPageCount-1) / navSize * navSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
