package com.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ItemVO {
	private int itemNumber;		//상품번호
	private String game;		//게임명
	private String categories;	//상품종류
	private String servers;		//서버
	private String itemName;	//상품명
	private String itemInfo;	//상품정보
	private int price;			//가격
	private int count;			//수량
	private Date upDate;		//등록일자
	private String seller;		//판매자
	private String image;		//이미지
	private String trade;		//거래종류
}
