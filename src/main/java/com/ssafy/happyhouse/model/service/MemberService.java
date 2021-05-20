package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberService {
	public MemberDto login(Map<String, String> map);
	public List<MemberDto> userList();
	public MemberDto getMember(String userid);
	public int registMember(MemberDto member);
	public int modifyMember(MemberDto member);
	public int deleteMember(String userid);
	public MemberDto findPassword(Map<String, String> map);
}
