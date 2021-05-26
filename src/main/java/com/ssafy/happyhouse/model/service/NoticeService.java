package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Reply;

public interface NoticeService {
	public List<Board> retrieveBoard();
	public Board detailBoard(int no);
	public boolean writeBoard(Board board);
	public boolean updateBoard(Board board);
	public boolean deleteBoard(int no);
	public boolean insertReply(Reply reply);
	public boolean updateReply(Reply reply);
	public boolean deleteReply(int no);
}
