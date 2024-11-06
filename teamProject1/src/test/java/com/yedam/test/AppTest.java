package com.yedam.test;

import com.yedam.common.PageDTO;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;

public class AppTest {

	public static void main(String[] args) {

		
		ItemService svc = new ItemServiceImpl();
		
		
		PageDTO dto = new PageDTO(1, svc.totalSell("test1"));
		
	}
	
}
