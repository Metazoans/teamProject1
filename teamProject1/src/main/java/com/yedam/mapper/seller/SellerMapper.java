package com.yedam.mapper.seller;

import java.util.List;

import com.yedam.vo.ItemVO;

public interface SellerMapper {

	List<ItemVO> select();
	
	int insertItem(ItemVO item);
	
}
