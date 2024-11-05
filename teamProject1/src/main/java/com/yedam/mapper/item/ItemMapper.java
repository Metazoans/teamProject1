package com.yedam.mapper.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(String id);
	
	List<BillsVO> sellerHistory(String logId);
	
	List<ItemVO> ItemNumSelect(String itemNum);

	int insertItem(ItemVO item);
	
	int itemUpdate(ItemVO item);
	
	int itemDelete(ItemVO item);
	
	int payStepUpdate(@Param("payStep")String payStep, @Param("itemNum")String itemNum);
	
	int payStepDelete(String itemNum);
	
	
}
