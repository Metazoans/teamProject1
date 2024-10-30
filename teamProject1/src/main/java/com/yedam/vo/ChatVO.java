package com.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	private String fromId;	  //보내는 사람
	private String toId;	  //받는 사람
	private String message;	  //메세지 내용
	private Date timeline;	  //메세지 시간
	private String readOrNot; //읽음 여부
}
