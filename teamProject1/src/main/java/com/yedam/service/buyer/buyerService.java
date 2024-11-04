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
	
	//상품 구매 - item count 변경
	boolean modifyItemCount(BillsVO buyItem);
	//상품 구매 - bills 추가
	boolean registerBillsItem(BillsVO buyItem);
	
	//구매 목록
	List<BillsVO> getBuyList(String buyer);
	//구매 목록 단건 조회
	BillsVO getBills(int billsNumber);
	
	//구매 확인 - 구매자 마일리지 감소, 판매자 마일리지 증가, bills 거래 요청으로 변경
	boolean modifyBuyConfirm(BillsVO buyItem); //member에서 buyItem.buyer로 검색 후 마일리지 감소
	boolean modifySellConfirm(BillsVO buyItem); //member에서 buyItem.seller로 검색 후 마일리지 증가
	boolean modifyBillsConfirm(BillsVO buyItem); //bills에서 buyItem의 billsNumber 검색 후 pay_step를 completed로 변경
	//구매 취소 - bills 삭제, 아이템 카운트 추가
	boolean resetItemCount(BillsVO buyItem); //item에서 아이템 넘버 검색 후 count 증가
	boolean removeBills(BillsVO buyItem); //bills 삭제

}
