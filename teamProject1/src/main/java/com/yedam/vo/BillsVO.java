package com.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BillsVO {
	private int billsNumber;
	private String seller;	//판매자 -> 작성자
	private String buyer;	//구매자 -> 거래 신청자
	private int itemNumber;	//상품번호
	private Date payDate;	//결제일
	private String payStep;	//결제단계
	private String itemName;//상품명
	private int count;		//수량
	private int total;		//총금액
	private String image;	//이미지
	
	private String trade;	// (판매/구매) 구분
}
