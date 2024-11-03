package com.yedam.mapper.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> select();
	
	List<ItemVO> mySellList(@Param("mid")String id, @Param("sell") String sell);
	
	List<ItemVO> sellerHistory(@Param("logId")String logId, @Param("payStep")String payStep);
	
	List<ItemVO> ItemNumSelect(String itemNum);

	int insertItem(ItemVO item);
	
	int itemUpdate(ItemVO item);
	
	int itemDelete(ItemVO item);
	
	
}
