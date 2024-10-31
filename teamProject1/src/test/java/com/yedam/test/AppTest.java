package com.yedam.test;

import java.util.List;

import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class AppTest {

	public static void main(String[] args) {
		
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		ivo.setGame("서든어택");
		ivo.setCategories("게임머니");
		ivo.setItemName("sp팜");
		ivo.setItemInfo("사기아님");
		ivo.setPrice(1000);
		ivo.setCount(1);
		ivo.setSeller("test1");
		ivo.setTrade("sell");
		
		if(svc.addItem(ivo)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		
		
	}
	
}
