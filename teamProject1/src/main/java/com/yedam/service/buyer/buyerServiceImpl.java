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

	@Override
	public List<ItemVO> getSortItemList(ItemListVO itemList) {
		return buyMapper.sortItemList(itemList);
	}
	
	//구매 목록
	@Override
	public List<BillsVO> getBuyList(String buyer) {
		return buyMapper.selectBuyList(buyer);
	}

}
