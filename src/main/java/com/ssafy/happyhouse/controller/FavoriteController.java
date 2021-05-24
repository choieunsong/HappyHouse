package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Favorite;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.FavoriteService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/favorite" )
@CrossOrigin("*")
public class FavoriteController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private FavoriteService favoriteService;
	
	@ApiOperation(value="관심지역을 추가")
	@PostMapping
	public void addFavorite(@RequestBody Favorite fav, HttpSession session) {
		logger.debug("addFavorite 호출");
		MemberDto member = (MemberDto) session.getAttribute("userinfo");
		fav.setUserno(member.getUserno());
		logger.debug(">>>>>>>>>>>fav: "+fav.toString());
		favoriteService.addFavorite(fav);
	}
	
	@ApiOperation(value="관심지역 삭제")
	@DeleteMapping("{no}")
	public void removeFavorite(@PathVariable int no) {
		
	}
}
