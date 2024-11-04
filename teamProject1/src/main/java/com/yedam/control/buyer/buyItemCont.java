package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public class buyItemCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String itemNumber = req.getParameter("itemNumber");
		String buyCount = req.getParameter("buyCount");
		String buyer = req.getParameter("loginId"); // 세션에서 로그인 아이디 가져오는 것으로 변경 예정

		buyerService svc = new buyerServiceImpl();

		ItemVO item = new ItemVO();
		item = svc.getItem(Integer.parseInt(itemNumber));

		BillsVO bills = new BillsVO();
		bills.setSeller(item.getSeller());
		bills.setBuyer(buyer);
		bills.setItemNumber(item.getItemNumber());
		bills.setItemName(item.getItemName());
		bills.setCount(Integer.parseInt(buyCount));
		bills.setTotal((item.getPrice() * Integer.parseInt(buyCount)));
		bills.setImage(item.getImage());

		// 아이템 카운트 확인
		if (svc.modifyItemCount(bills)) {
			if (svc.registerBillsItem(bills)) {
				resp.getWriter().print("{\"retCode\": \"OK\"}");
			} else {
				resp.getWriter().print("{\"retCode\": \"RFAIL\"}");
			}
		} else {
			resp.getWriter().print("{\"retCode\": \"CFAIL\"}");
		}


	}

}
