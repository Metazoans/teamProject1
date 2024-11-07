package com.yedam.mapper.account;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.BillsVO;
import com.yedam.vo.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO member);
	//아이디 비번 조회
	public MemberVO loginMember(@Param("id") String id, @Param("pwd") String pwd);
	
	public MemberVO selectId(MemberVO member);
	
	public MemberVO selectPwd(MemberVO member);
	
	public List<MemberVO> members(@Param("logId") String id);
	
	public int updateProfile(MemberVO member);
	
	public int updateMileage(MemberVO member);
	
	public int deleteMember(@Param("logId") String id);
	
	public int selectCount(MemberVO member);
	
	public int updateGrade(@Param("grade")String grade, @Param("name")String name);
	
	public List<BillsVO> selectSell(@Param("logId") String id);
	
	public List<BillsVO> selectPurchase(@Param("logId") String id);
	
	public int updatePhone(MemberVO member);
	
	
}
