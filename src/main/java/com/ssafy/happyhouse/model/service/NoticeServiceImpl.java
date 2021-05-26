package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Reply;
import com.ssafy.happyhouse.model.mapper.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@Override
	public List<Board> retrieveBoard() {
		return noticeDao.selectBoard();
	}

	@Override
	public Board detailBoard(int no) {
		return noticeDao.selectBoardByNo(no);
	}

	@Override
	public boolean writeBoard(Board board) {
		return noticeDao.insertBoard(board) == 1;
	}

	@Override
	public boolean updateBoard(Board board) {
		return noticeDao.updateBoard(board) == 1;
	}

	@Override
	public boolean deleteBoard(int no) {
		return noticeDao.deleteBoard(no) == 1;
	}

	@Override
	public boolean insertReply(Reply reply) {
		return noticeDao.insertReply(reply) == 1;
	}

	@Override
	public boolean updateReply(Reply reply) {
		return noticeDao.updateReply(reply) == 1;
	}

	@Override
	public boolean deleteReply(int no) {
		return noticeDao.deleteReply(no) == 1;
	}

}
