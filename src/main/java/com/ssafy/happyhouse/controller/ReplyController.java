package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Reply;
import com.ssafy.happyhouse.model.service.BoardService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/qna/board/reply")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private BoardService boardService;
	
	@ApiOperation(value = "코멘트 달기")
    @PostMapping
    public ResponseEntity<String> insertReply(@RequestBody Reply reply){
    	logger.debug("insertReply - 호출");
    	if(boardService.insertReply(reply)) {
    		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
    	}
    	return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
    }
	
	@ApiOperation(value = "코멘트 수정")
	@PutMapping
	public ResponseEntity<String> updateReply(@RequestBody Reply reply) {
		logger.debug("updateReply - 호출");
		
		if (boardService.updateReply(reply)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value = "코멘트 삭제")
	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteReply(@PathVariable int no) {
		logger.debug("deleteReply- 호출");
		if (boardService.deleteReply(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
}
