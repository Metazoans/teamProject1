package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.ItemVO;

public class itemDetailCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 상세
		String itemNumber = req.getParameter("itemNumber");
		
		ItemVO item = new ItemVO();
		buyerService svc = new buyerServiceImpl();
		
		item = svc.getItem(Integer.parseInt(itemNumber));
		
		req.setAttribute("item", item);

		req.getRequestDispatcher("buyer/itemDetail.tiles").forward(req, resp);

	}

}
