package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.MemberDto;

@Mapper
public interface MemberMapper{
	public MemberDto login(Map<String, String> map);
	public List<MemberDto> userList();
	public MemberDto getMember(String userid);
	public int registMember(MemberDto member);
	public int modifyMember(MemberDto member);
	public int deleteMember(String userid);
	public MemberDto findPassword(Map<String, String> map);
}
