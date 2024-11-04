package com.yedam.service.buyer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.buyer.buyerMapper;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemListVO;
import com.yedam.vo.ItemVO;

public class buyerServiceImpl implements buyerService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	buyerMapper buyMapper = sqlSession.getMapper(buyerMapper.class);
	
	//상품 목록
	@Override
	public List<ItemVO> getItemList() {
		return buyMapper.selectItemList();
	}
	//상품 디테일
	@Override
	public ItemVO getItem(int itemNumber) {
		return buyMapper.selectItem(itemNumber);
	}
	
	//검색*정렬 상품 목록 출력
	@Override
	public List<ItemVO> getSortItemList(ItemListVO itemList) {
		return buyMapper.sortItemList(itemList);
	}
	//검색*정렬 상품 목록 숫자
	@Override
	public int getSortItemListCnt(ItemListVO itemList) {
		return buyMapper.sortItemListCnt(itemList);
	}
	
	//상품 구매 - item count 변경
	@Override
	public boolean modifyItemCount(BillsVO buyItem) {
		return buyMapper.updateItemCount(buyItem) == 1;
	}
	//상품 구매 - bills 추가
	@Override
	public boolean registerBillsItem(BillsVO buyItem) {
		return buyMapper.insertBillsItem(buyItem) == 1;
	}
	
	//구매 목록
	@Override
	public List<BillsVO> getBuyList(String buyer) {
		return buyMapper.selectBuyList(buyer);
	}
	//구매 목록 단건 조회
	@Override
	public BillsVO getBills(int billsNumber) {
		return buyMapper.selectBills(billsNumber);
	}
	
	//구매 확인 - 구매자 마일리지 감소, 판매자 마일리지 증가, bills 거래 요청으로 변경
	@Override
	public boolean modifyBuyConfirm(BillsVO buyItem) {
		return buyMapper.updateBuyConfirm(buyItem) == 1;
	}
	@Override
	public boolean modifySellConfirm(BillsVO buyItem) {
		return buyMapper.updateSellConfirm(buyItem) == 1;
	}
	@Override
	public boolean modifyBillsConfirm(BillsVO buyItem) {
		return buyMapper.updateBillsConfirm(buyItem) == 1;
	}
	//구매 취소 - 아이템 카운트 추가, bills 삭제
	@Override
	public boolean resetItemCount(BillsVO buyItem) {
		return buyMapper.cancelItemCount(buyItem) == 1;
	}
	@Override
	public boolean removeBills(BillsVO buyItem) {
		return buyMapper.deleteBills(buyItem) == 1;
	}
	
}
