package com.yedam.control.buyer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.buyer.BuyerService;
import com.yedam.service.buyer.BuyerServiceImpl;
import com.yedam.vo.BillsVO;
import com.yedam.vo.ItemVO;

public class DealItemCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String itemNumber = req.getParameter("itemNumber");
		String dealCount = req.getParameter("dealCount");
		String logId = req.getParameter("logId");
		
		BuyerService svc = new BuyerServiceImpl();

		ItemVO item = new ItemVO();
		item = svc.getItem(Integer.parseInt(itemNumber));

		BillsVO bills = new BillsVO();
		bills.setSeller(item.getSeller());
		bills.setBuyer(logId);
		bills.setItemNumber(item.getItemNumber());
		bills.setItemName(item.getItemName());
		bills.setCount(Integer.parseInt(dealCount));
		bills.setTotal((item.getPrice() * Integer.parseInt(dealCount)));
		bills.setImage(item.getImage());
		bills.setTrade(item.getTrade());

		Map<String, Object> result = new HashMap();

		Gson gson = new GsonBuilder().create();
		
		if()
		
		// 아이템 카운트 확인
		if (svc.modifyItemCount(bills)) {
			if (svc.registerBillsItem(bills)) {
				result.put("retCode", "OK");
			} else {
				result.put("retCode", "RFAIL");
			}
		} else {
			result.put("retCode", "CFAIL");
		}

		int newItemCnt = svc.getItem(Integer.parseInt(itemNumber)).getCount();
		result.put("newCnt", newItemCnt);
		
		resp.getWriter().print(gson.toJson(result));

	}

}
