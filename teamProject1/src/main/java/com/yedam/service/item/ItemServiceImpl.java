package com.yedam.service.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.item.ItemMapper;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public class ItemServiceImpl implements ItemService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
	
	@Override
	public List<ItemVO> select() {
		return mapper.select();
	}
	
	@Override
	public boolean addItem(ItemVO item) {
		return mapper.insertItem(item) == 1;
	}
	
	@Override
	public List<ItemVO> mySellList(String mid) {
		return mapper.mySellList(mid);
	}
	
	@Override
	public List<ItemVO> mySellListBuy(String mid) {
		return mapper.mySellListBuy(mid);
	}
	
	
	@Override
	public List<BillsVO> sellerHistory(String logId) {
		return mapper.sellerHistory(logId);
	}
	
	@Override
	public boolean itemUpdate(ItemVO item) {
		return mapper.itemUpdate(item) == 1;
	}
	
	@Override
	public boolean itemDelete(ItemVO item) {
		return mapper.itemDelete(item) == 1;
	}
	
	@Override
	public boolean payStepUpdate(String payStep, String itemNum) {
		return mapper.payStepUpdate(payStep, itemNum) == 1;
	}
	
	@Override
	public boolean payStepDelete(String itemNum) {
		return mapper.payStepDelete(itemNum) == 1;
	}
	
}
