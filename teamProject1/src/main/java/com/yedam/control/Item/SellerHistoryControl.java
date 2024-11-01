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

public class SellerHistoryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		List<ItemVO> list = (List<ItemVO>)svc.sellerHistory("test1","processing");
		
		req.setAttribute("sellerHistory", list);
		
		req.getRequestDispatcher("seller/sellerHistory.tiles").forward(req, resp);
		
	}

}
