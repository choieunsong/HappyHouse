package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Reply;

@Mapper
public interface NoticeDAO {
	public List<Board> selectBoard();
	public Board selectBoardByNo(int no);
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int no);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(int no);
}
