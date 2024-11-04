package com.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;	//아이디
	private String password;	//비밀번호
	private String memberName;	//이름
	private String birth;			//생년월일
	private String phone;		//연락처
	private Date create_date;	//생성일
	private String permission;	//권한
	private String grade;		//등급
	private int mileage;		//마일리지
}
