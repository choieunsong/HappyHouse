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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.dto.Reply;
import com.ssafy.happyhouse.model.service.NoticeService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/notice/board")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private NoticeService noticeService;
	
	 @ApiOperation(value = "모든 게시글의 정보를 반환한다.", response = List.class)
		@GetMapping
		public ResponseEntity<List<Board>> retrieveBoard() throws Exception {
			logger.debug("retrieveBoard - 호출");
			return new ResponseEntity<List<Board>>(noticeService.retrieveBoard(), HttpStatus.OK);
	 }
	 
	 @ApiOperation(value = "글번호에 해당하는 게시글의 정보를 반환한다.", response = Board.class)    
		@GetMapping("{no}")
		public ResponseEntity<Board> detailBoard(@PathVariable int no) {
			logger.debug("detailBoard - 호출");
			return new ResponseEntity<Board>(noticeService.detailBoard(no), HttpStatus.OK);
		}
	
	 @ApiOperation(value = "새로운 게시글 정보를 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
		@PostMapping
		public ResponseEntity<String> writeBoard(@RequestBody Board board) {
			logger.debug("writeBoard - 호출");
			if (noticeService.writeBoard(board)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}
	 
	 @ApiOperation(value = "글번호에 해당하는 게시글의 정보를 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
		@PutMapping("{no}")
		public ResponseEntity<String> updateBoard(@RequestBody Board board) {
			logger.debug("updateBoard - 호출");
			logger.debug("" + board);
			
			if (noticeService.updateBoard(board)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}

	    @ApiOperation(value = "글번호에 해당하는 게시글의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
		@DeleteMapping("{no}")
		public ResponseEntity<String> deleteBoard(@PathVariable int no) {
			logger.debug("deleteBoard - 호출");
			if (noticeService.deleteBoard(no)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}
	    
		
		@RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
		public ResponseEntity<MemberDto> getUserInfo(HttpSession session){
			MemberDto member = (MemberDto) session.getAttribute("userinfo");
			return new ResponseEntity<MemberDto>(member, HttpStatus.OK);
		}
		
		@ApiOperation(value = "코멘트 달기")
	    @PostMapping("/reply")
	    public ResponseEntity<String> insertReply(@RequestBody Reply reply){
	    	logger.debug("insertReply - 호출");
	    	if(noticeService.insertReply(reply)) {
	    		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	    	}
	    	return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	    }
		
		@ApiOperation(value = "코멘트 수정")
		@PutMapping("/reply")
		public ResponseEntity<String> updateReply(@RequestBody Reply reply) {
			logger.debug("updateReply - 호출");
			
			if (noticeService.updateReply(reply)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}
		
		@ApiOperation(value = "코멘트 삭제")
		@DeleteMapping("/reply/{no}")
		public ResponseEntity<String> deleteReply(@PathVariable int no) {
			logger.debug("deleteReply- 호출");
			if (noticeService.deleteReply(no)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}
}
