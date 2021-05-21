package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Reply;
import com.ssafy.happyhouse.model.mapper.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
    @Autowired
	private BoardDAO boardDao;

    @Override
	public List<Board> retrieveBoard() {
		return boardDao.selectBoard();
	}
    
  	@Override
	public boolean writeBoard(Board board) {
		return boardDao.insertBoard(board) == 1;
	}

	@Override
	public Board detailBoard(int no) {
		return boardDao.selectBoardByNo(no);
	}

	@Override
	@Transactional
	public boolean updateBoard(Board board) {
		return boardDao.updateBoard(board) == 1;
	}

	@Override
	@Transactional
	public boolean deleteBoard(int no) {
		return boardDao.deleteBoard(no) == 1;
	}
	
	@Override
	@Transactional
	public boolean insertReply(Reply reply) {
		return boardDao.insertReply(reply) == 1;
	}
	
	@Override
	@Transactional
	public boolean updateReply(Reply reply) {
		return boardDao.updateReply(reply) == 1;
	}
	
	@Override
	@Transactional
	public boolean deleteReply(int no) {
		return boardDao.deleteReply(no) == 1;
	}
}