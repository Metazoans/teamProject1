package com.yedam.control.Item;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.BillsVO;

public class SellerHistoryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ItemService svc = new ItemServiceImpl();
		HttpSession session = req.getSession();
		String logId = (String) session.getAttribute("logId");
		
		List<BillsVO> list = (List<BillsVO>)svc.sellerHistory(logId);
		
		req.setAttribute("sellerHistory", list);
		
		req.getRequestDispatcher("seller/sellerHistory.tiles").forward(req, resp);
		
	}

}
