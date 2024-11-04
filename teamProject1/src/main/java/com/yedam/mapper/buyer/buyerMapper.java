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
	
	//상품 구매 - item count 변경
	int updateItemCount(BillsVO buyItem);
	//상품 구매 - bills 추가
	int insertBillsItem(BillsVO buyItem);
	
	//구매목록
	List<BillsVO> selectBuyList(String buyer);
	//구매내역 단건 조회
	BillsVO selectBills(int billsNumber);
	
	//구매 확인 - 구매자 마일리지 감소, 판매자 마일리지 증가, bills 거래 요청으로 변경
	int updateBuyConfirm(BillsVO buyItem); //member에서 buyItem.buyer로 검색 후 마일리지 감소
	int updateSellConfirm(BillsVO buyItem); //member에서 buyItem.seller로 검색 후 마일리지 증가
	int updateBillsConfirm(BillsVO buyItem); //bills에서 buyItem의 billsNumber 검색 후 pay_step를 completed로 변경
	//구매 취소 - bills 삭제, 아이템 카운트 추가
	int cancelItemCount(BillsVO buyItem); //item에서 아이템 넘버 검색 후 count 증가
	int deleteBills(BillsVO buyItem); //bills 삭제
	
}
