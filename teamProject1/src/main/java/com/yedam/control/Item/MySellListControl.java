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

public class MySellListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		ItemService svc = new ItemServiceImpl();
		
		List<ItemVO> list = (List<ItemVO>)svc.mySellList("test1","sell");
		
		req.setAttribute("mySellList", list);
		
		req.getRequestDispatcher("seller/mySellList.tiles").forward(req, resp);
		
	}

}
