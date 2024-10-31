package com.yedam.vo;

import lombok.Data;

@Data
public class ItemListVO {
	private String categories; //카테고리
	private String searchType; //검색 조건
	private String searchData; //검색 내용
	private String sort; //정렬 타입
	private String order; //역순 정렬
}
