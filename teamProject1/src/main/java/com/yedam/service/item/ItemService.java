package com.yedam.service.item;

import java.util.List;

import com.yedam.vo.ItemVO;

public interface ItemService {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(String mid, String sell);
	
	List<ItemVO> sellerHistory(String logId, String payStep);
	
//	List<ItemVO> ItemNumSelect(String itemNum);
	
	boolean addItem(ItemVO item);
	
	boolean itemUpdate(ItemVO item);
	
	boolean itemDelete(ItemVO num);
	
}
