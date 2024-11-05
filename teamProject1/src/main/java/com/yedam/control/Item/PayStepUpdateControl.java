package com.yedam.control.Item;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;

public class PayStepUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		ItemService svc = new ItemServiceImpl();
		
		String itemNum = req.getParameter("itemNum");
		System.out.println("itemNum : " + itemNum);

		try {			
			if(svc.payStepUpdate("deal", itemNum)) {
				out.println("<script>alert('거래확인완료'); location.href='sellerHistory.do';</script>");
			}else {
				out.println("<script>alert('거래확인실패'); location.href='sellerHistory.do';</script>");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		

	}

}
