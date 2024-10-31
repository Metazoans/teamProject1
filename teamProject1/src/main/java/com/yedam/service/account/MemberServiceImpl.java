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

	@Override
	public boolean addMember(MemberVO member) {
		return mapper.insertMember(member)==1;
	}

	@Override
	public MemberVO searchId(MemberVO member) {
		return mapper.selectId(member);
	}

	@Override
	public MemberVO searchPwd(MemberVO member) {

		return mapper.selectPwd(member);
	}
	
}
