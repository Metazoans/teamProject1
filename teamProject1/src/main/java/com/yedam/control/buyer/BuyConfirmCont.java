package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.BuyerService;
import com.yedam.service.buyer.BuyerServiceImpl;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public class BuyConfirmCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 구매 확정 동작
		
		String billsNumber = req.getParameter("billsNumber");
		String logId = req.getParameter("logId");
		
		BuyerService svc = new BuyerServiceImpl();
		BillsVO bills = svc.getBills(Integer.parseInt(billsNumber));

		int mileage = svc.mileageCheck(logId);

		if(bills.getTrade().equals("sell") && mileage < bills.getTotal()) {
			resp.getWriter().print("{\"retCode\": \"LACK\"}");
			return;
		}
		
		boolean check1 = svc.modifyBuyConfirm(bills);
		boolean check2 = svc.modifySellConfirm(bills);
		boolean check3 = svc.modifyBillsConfirm(bills);
		
		
		
		if(check1 && check2 && check3) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}
		else {
			resp.getWriter().print("{\"retCode\": \"FAIL\"}");
		}
		
		
	}

}
