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

public class myItemUpdateList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 * ItemService svc = new ItemServiceImpl();
		 * 
		 * String itemNum = req.getParameter("itemNum");
		 * 
		 * 
		 * List<ItemVO> list = (List<ItemVO>)svc.ItemNumSelect(itemNum);
		 * 
		 * req.setAttribute("itemNumList", list);
		 * 
		 * req.getRequestDispatcher("seller/mySellList").forward(req, resp);
		 */
		
	}

}
