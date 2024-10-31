package com.yedam.mapper.item;

import java.util.List;

import com.yedam.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> select();
	
	int insertItem(ItemVO item);
	
}
