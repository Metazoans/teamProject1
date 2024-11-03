package com.yedam.vo;

import lombok.Data;

@Data
public class ItemListVO {
	private int page; //페이지
	private String categories; //카테고리
	private String searchType; //검색 조건(서버 / 제목 / 내용 / 판매자) 서버 : ㅁㄴㅇㄹ     x -> x버튼 클릭시 조건 삭제
	private String searchData; //검색 내용
	private String sort; //정렬 타입
	private String order; //역순 정렬
}
