package com.yedam.control.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class ItemUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		String itemNum = req.getParameter("itemNum");
		String itemName = req.getParameter("itemName");
		String itemInfo = req.getParameter("itemInfo");
		String count = req.getParameter("count");
		String price = req.getParameter("price");
		
//		List<ItemVO> list = (List<ItemVO>)svc.ItemNumSelect(Integer.parseInt(itemNum));
//		
//		req.setAttribute("ItemNumSelect", list);
		
		ivo.setItemName(itemName);
		ivo.setItemInfo(itemInfo);
		ivo.setPrice(Integer.parseInt(price));
		ivo.setCount(Integer.parseInt(count));
		ivo.setItemNumber(Integer.parseInt(itemNum));
		
		try {
			if(svc.itemUpdate(ivo)) {
				req.setAttribute("msg", "변경성공");
				req.getRequestDispatcher("seller/mySellList.do").forward(req, resp);
			}
		}catch(Exception e){
			
		}
		
	}

}
