package com.yedam.service.account;

import com.yedam.vo.MemberVO;

public interface MemberService {
	//로그인
	MemberVO loginCheck(String id, String pwd);
}
