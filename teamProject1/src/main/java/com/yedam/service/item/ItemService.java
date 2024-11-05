package com.yedam.service.item;

import java.util.List;

import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public interface ItemService {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(String mid, String sell);
	
	List<BillsVO> sellerHistory(String logId);
	
	
	boolean addItem(ItemVO item);
	
	boolean itemUpdate(ItemVO item);
	
	boolean itemDelete(ItemVO num);
	
	boolean payStepUpdate(String payStep, String itemNum);
	
}
