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
	
	//상품 검색 및 정렬
	List<ItemVO> getSortItemList(ItemListVO itemList);
	
	//구매 목록
	List<BillsVO> getBuyList(String buyer);
}
