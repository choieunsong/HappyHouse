package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Favorite;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.FavoriteService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/favorite" )
@CrossOrigin(origins = { "*" }, maxAge = 6000)
public class FavoriteController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private FavoriteService favoriteService;
	
	@ApiOperation(value="관심지역을 추가")
	@PostMapping
	public ResponseEntity<String> addFavorite(@RequestBody Favorite fav, HttpSession session) {
		logger.debug("addFavorite 호출");
		MemberDto member = (MemberDto) session.getAttribute("userinfo");
		fav.setUserno(member.getUserno());
		logger.debug(">>>>>>>>>>>fav: "+fav.toString());
		if(favoriteService.addFavorite(fav)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value="관심지역 삭제")
	@DeleteMapping("{no}")
	public ResponseEntity<String> removeFavorite(@PathVariable int no) {
		logger.debug("removeFavorite 호출");
		if(favoriteService.removeFavorite(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value="관심지역 리스트 가져오기")
	@GetMapping
	public ResponseEntity<List<Favorite>> getFavorite(HttpSession session){
		logger.debug("getFavorite 호출");
		MemberDto member = (MemberDto) session.getAttribute("userinfo");
		int userno = member.getUserno();
		return new ResponseEntity<List<Favorite>>(favoriteService.getFavorite(userno), HttpStatus.OK);
	}
	
	@ApiOperation(value="관심지역 리스트 + 아파트 정보 가져오기")
	@GetMapping("{userno}")
	public ResponseEntity<List<Favorite>> getFavoriteAptInfo(@PathVariable int userno){
		logger.debug("getFavorite 호출");
		return new ResponseEntity<List<Favorite>>(favoriteService.getFavoriteAptInfo(userno), HttpStatus.OK);
	}
	
	
	
	@ApiOperation(value="로그인정보 불러오기")
	@GetMapping("/getUserInfo")
	public ResponseEntity<MemberDto> getUserInfo(HttpSession session){
		logger.debug("getUserInfo 호출");
		MemberDto member = (MemberDto) session.getAttribute("userinfo");
		member.setPassword("");
		logger.debug(member.toString());
		return new ResponseEntity<MemberDto>(member, HttpStatus.OK);
	}
}
