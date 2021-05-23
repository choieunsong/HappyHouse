package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.BaseAddress;
import com.ssafy.happyhouse.model.dto.HouseDealDto;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.util.PageNavigation;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/deal" )
@CrossOrigin("*")
public class HouseController{
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@Autowired
	private HouseDealService houseDealService;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("/error");
		mav.addObject("msg", e.getMessage());
		e.printStackTrace();
		return mav;
	}

	@ApiOperation("아파트로 찾기")
	@GetMapping("/searchApt/{aptName}/{pageNo}")
	public ResponseEntity<Map<String, Object>> searchApt(@PathVariable("aptName") String aptName, @PathVariable("pageNo") String pageNo ,Model model){
		System.out.println(">>>>>>>>>>>>>>> 아파트 이름: "+aptName);
		System.out.println(">>>>>>>>>>>>>>> pageNo: "+pageNo);
		List<HouseDealDto> list = houseDealService.searchApt(aptName, pageNo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("key","aptName");
		map.put("word", aptName);
		map.put("pageNo", pageNo);
		PageNavigation pageNavigation = houseDealService.makePageNavigation(map);
		if(list != null && !list.isEmpty()) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("result", list);
			result.put("navi", pageNavigation.getNavigator());
			model.addAttribute("aptList", list);
			return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation("동네로 찾기")
	@GetMapping("/searchHouse/{dong}/{pageNo}")
	public ResponseEntity<Map<String, Object>> searchHouse(@PathVariable("dong") String dong, @PathVariable("pageNo") String pageNo, Model model){
		System.out.println(">>>>>>>>>>>>>>> 동네 이름: "+dong);
		System.out.println(">>>>>>>>>>>>>>> pageNo: "+pageNo);
		List<HouseDealDto> list = houseDealService.searchHouse(dong, pageNo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("key","dong");
		map.put("word", dong);
		map.put("pageNo", pageNo);
		PageNavigation pageNavigation = houseDealService.makePageNavigation(map);
		
		if(list != null && !list.isEmpty()) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("result", list);
			result.put("navi", pageNavigation.getNavigator());
			model.addAttribute("aptList", list);
			return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	@ApiOperation("구 찾기")
	@GetMapping("/searchGu/{city}")
	public ResponseEntity<List<BaseAddress>> searchGu(@PathVariable("city") String city){
		System.out.println(">>>>>>>>>>>>>>> 도시 이름: "+city);
		List<BaseAddress> list = houseDealService.searchGu(city);
//		for(BaseAddress ba : list) {
//			System.out.println(ba);
//		}
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<BaseAddress>>(list, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation("동 찾기")
	@GetMapping("/searchDong/{dongcode}")
	public ResponseEntity<List<BaseAddress>> searchDong(@PathVariable("dongcode") String dongcode, Model model){
		System.out.println(">>>>>>>>>>>>>>> 동코드: "+dongcode);
		List<BaseAddress> list = houseDealService.searchDong(dongcode);
//		for(BaseAddress ba : list) {
//			System.out.println(ba);
//		}
		if(list != null && !list.isEmpty()) {
			model.addAttribute("mainAttent", list.get(0));
			return new ResponseEntity<List<BaseAddress>>(list, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
}
