package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.MemberDao;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto login(Map<String, String> map) {
		if(map.get("userid") == null || map.get("password") == null) {
			
			return null;
		}
		System.out.println("안녕하세요");
		return sqlSession.getMapper(MemberMapper.class).login(map);
	}
	
	@Override
	public List<MemberDto> userList() {
		return sqlSession.getMapper(MemberMapper.class).userList();
	}
	
	@Override
	public MemberDto getMember(String userid) {
		return sqlSession.getMapper(MemberMapper.class).getMember(userid);
	}

	@Override
	public int registMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberMapper.class).registMember(memberDto);
	}

	@Override
	public int modifyMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberMapper.class).modifyMember(memberDto);
	}

	@Override
	public int deleteMember(String userid) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(userid);
	}

	@Override
	public MemberDto findPassword(Map<String, String> map) {
		if(map.get("userid") == null || map.get("email") == null)
			return null;
		return sqlSession.getMapper(MemberMapper.class).findPassword(map);
	}

}
