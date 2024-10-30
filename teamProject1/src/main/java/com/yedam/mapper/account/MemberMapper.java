package com.yedam.mapper.account;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO member);
	//아이디 비번 조회
	public MemberVO loginMember(@Param("id") String id, @Param("pwd") String pwd);
}
