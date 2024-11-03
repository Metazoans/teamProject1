package com.yedam.mapper.buyer;

import java.util.List;

import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemListVO;
import com.yedam.vo.ItemVO;

public interface buyerMapper {
	//상품 전체 목록
	List<ItemVO> selectItemList();
	//상품 디테일
	ItemVO selectItem(int itemNumber);
	
	//검색&정렬 상품 목록 출력
	List<ItemVO> sortItemList(ItemListVO itemList);
	//검색&정렬 상품 목록 숫자
	int sortItemListCnt(ItemListVO itemList);
	
	//구매목록
	List<BillsVO> selectBuyList(String buyer);
	
}
