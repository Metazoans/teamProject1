package com.yedam.service.buyer;

import java.util.List;

import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemListVO;
import com.yedam.vo.ItemVO;

public interface buyerService {
	//상품 목록
	List<ItemVO> getItemList();
	//상품 디테일
	ItemVO getItem(int itemNumber);
	
	//검색*정렬 상품 목록 출력
	List<ItemVO> getSortItemList(ItemListVO itemList);
	//검색*정렬 상품 목록 숫자
	int getSortItemListCnt(ItemListVO itemList);
	
	//구매 목록
	List<BillsVO> getBuyList(String buyer);
}
