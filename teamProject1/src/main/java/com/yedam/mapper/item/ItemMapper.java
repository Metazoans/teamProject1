package com.yedam.mapper.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(@Param("mid")String id, @Param("sell") String sell);
	
	List<BillsVO> sellerHistory(@Param("logId")String logId);
	
	List<ItemVO> ItemNumSelect(String itemNum);

	int insertItem(ItemVO item);
	
	int itemUpdate(ItemVO item);
	
	int itemDelete(ItemVO item);
	
	int payStepUpdate();
	
	
}
