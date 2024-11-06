package com.yedam.control.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.BillsVO;

public class SellListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String logId = req.getParameter("logId");
		
		ItemService svc = new ItemServiceImpl();
		

		List<BillsVO> list = (List<BillsVO>)svc.sellerHistory(logId);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // 자바 객체 => json문자열로 변경

		resp.getWriter().print(json);
		

	}

}
