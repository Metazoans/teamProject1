package com.yedam.control.Item;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.BuyerService;
import com.yedam.service.buyer.BuyerServiceImpl;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.BillsVO;

public class PayStepUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String billsNumber = req.getParameter("billsNumber");
		String logId = req.getParameter("logId");
		
		
		ItemService svc = new ItemServiceImpl();

		BuyerService bsvc = new BuyerServiceImpl();
		BillsVO bills = bsvc.getBills(Integer.parseInt(billsNumber));

		int mileage = bsvc.mileageCheck(logId);

		if(bills.getTrade().equals("buy") && mileage < bills.getTotal()) {
			resp.getWriter().print("{\"retCode\": \"LACK\"}");
			return;
		}
		
		if(svc.changePayStep(bills.getBillsNumber())) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"FAIL\"}");
		}

	}

}
