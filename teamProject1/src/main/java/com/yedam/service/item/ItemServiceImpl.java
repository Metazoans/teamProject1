package com.yedam.service.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.item.ItemMapper;
import com.yedam.vo.ItemVO;

public class ItemServiceImpl implements ItemService{

	SqlSession sqlSession = DataSource.getInstance().openSession();
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
	public List<ItemVO> mySellList(String mid, String sell) {
		return mapper.mySellList(mid,sell);
	}
	
	
	@Override
	public List<ItemVO> sellerHistory(String logId, String payStep) {
		return mapper.sellerHistory(logId, payStep);
	}
	
	@Override
	public boolean itemUpdate(ItemVO item) {
		return mapper.itemUpdate(item) == 1;
	}
	
	@Override
	public boolean itemDelete(ItemVO item) {
		return mapper.itemDelete(item) == 1;
	}
	
}
