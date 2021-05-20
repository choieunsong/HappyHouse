package com.ssafy.happyhouse.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@RestController
@RequestMapping("/admin")
@CrossOrigin("*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "/user")
	public ResponseEntity<List<MemberDto>> userList() {
		List<MemberDto> list = memberService.userList();
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	// 회원정보 검색
	@GetMapping(value = "/user/{userid}")
	public ResponseEntity<MemberDto> userInfo(@PathVariable("userid") @ApiParam(value="검색할 회원 id") String userid) {
		logger.debug("파라미터 : {}", userid);
		MemberDto memberDto = memberService.getMember(userid);
		if(memberDto != null)
			return new ResponseEntity<MemberDto>(memberDto, HttpStatus.OK);
		else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value="회원정보 수정)", notes="회원의 정보를 수정합니다.")
	@PutMapping(value = "/user")
	public ResponseEntity<List<MemberDto>> userModify(@RequestBody @ApiParam(value="수정할 회원정보", required=true) MemberDto memberDto) {
		memberService.modifyMember(memberDto);
		List<MemberDto> list = memberService.userList();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	
	@ApiOperation(value="회원정보 삭제)", notes="회원의 정보를 삭제합니다.")
	@DeleteMapping(value = "/user/{userid}")
	public ResponseEntity<List<MemberDto>> userDelete(@PathVariable("userid")  @ApiParam(value="삭제할회원아이디") String userid) {
		memberService.deleteMember(userid);
		List<MemberDto> list = memberService.userList();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	
}
