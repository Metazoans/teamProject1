package com.yedam.service.item;

import java.util.List;

import com.yedam.vo.ItemVO;

public interface ItemService {

	List<ItemVO> select();
	
	boolean addItem(ItemVO item);
	
}
