package com.yedam.service.account;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.account.MemberMapper;
import com.yedam.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	SqlSession sqlSession = DataSource.getInstance().openSession();
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public MemberVO loginCheck(String id, String pwd) {
		return mapper.loginMember(id, pwd);
	}
	
}
