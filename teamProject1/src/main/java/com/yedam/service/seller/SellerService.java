package com.yedam.service.seller;

import java.util.List;

import com.yedam.vo.ItemVO;

public interface SellerService {

	List<ItemVO> select();
	
	boolean addItem(ItemVO item);
	
}
