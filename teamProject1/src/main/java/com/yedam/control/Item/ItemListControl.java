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

public class ItemListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ItemService svc = new ItemServiceImpl();
		
		List<ItemVO> list = svc.select();
		
		req.setAttribute("ItemList", list);
		
		req.getRequestDispatcher("seller/itemList.tiles").forward(req, resp);
		
	}

}
