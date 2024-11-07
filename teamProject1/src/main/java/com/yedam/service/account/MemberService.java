package com.yedam.service.account;

import java.util.List;

import com.yedam.vo.BillsVO;
import com.yedam.vo.MemberVO;

public interface MemberService {
	// 로그인
	MemberVO loginCheck(String id, String pwd);

	boolean addMember(MemberVO member);

	MemberVO searchId(MemberVO member);

	MemberVO searchPwd(MemberVO member);

	List<MemberVO> memberList(String logId);

	boolean modifyMember(MemberVO member);

	boolean modifyMileage(MemberVO member);

	boolean removeMember(String logId);

	int grade(MemberVO member);

	boolean updateGrade(String grade, String name);

	List<BillsVO> sellList(String logId);

	List<BillsVO> purchaseList(String logId);
	
	boolean modifyPhone(MemberVO member);
	
	boolean searchDupId(String memberId);
}
