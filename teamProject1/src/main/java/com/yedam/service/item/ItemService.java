package com.yedam.service.item;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public interface ItemService {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(String mid);
	
	List<ItemVO> mySellListBuy(String mid);
	
	List<BillsVO> sellerHistory(String logId);
	
	boolean addItem(ItemVO item);
	
	boolean itemUpdate(ItemVO item);
	
	boolean itemDelete(ItemVO num);
	
	boolean payStepUpdate(String payStep, String itemNum);
	
	boolean payStepDelete(String itemNum);

	//추가
	boolean changePayStep(int billsNumber);
	
	int totalSell(String logId);
	
	int totalBuy(String logId);
	
	List<ItemVO> sellListPage(SearchDTO dto);
	
	List<ItemVO> buyListPage(SearchDTO dto);

	
}
