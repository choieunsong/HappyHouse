package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberDao{
	public MemberDto login(String userid, String userpwd) throws SQLException;
	void registMember(MemberDto member) throws SQLException;
	void modifyMember(MemberDto member) throws SQLException;
	MemberDto getMember(String userid) throws SQLException;
	String findPassword(String userid, String email) throws SQLException;
}
