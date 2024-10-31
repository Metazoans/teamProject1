package com.yedam.web;

import java.io.IOException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.control.TestPageControl;
import com.yedam.control.Item.AddItemForm;
import com.yedam.control.Item.ItemListControl;
import com.yedam.control.Item.AddItemControl;


//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	Map<String, Control> map;
	
	public FrontController() {
		//System.out.println("객체생성");
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//System.out.println("init호출");
		map.put("/testBuyer.do", new TestPageControl());
		
		// item  상품 등록, 수량/가격 변경, 판매 상품 삭제, 거래 완료 버튼 관련
		map.put("/addItem.do", new AddItemControl());
		map.put("/addItemForm.do", new AddItemForm());
		map.put("/itemList.do", new ItemListControl());
		
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("service호출");
		// 요청페이지?
		// http://localhost/FreeBoard/add.do (전체 : url)
		String uri = req.getRequestURI(); // /FreeBoard/add.do (부분 : uri)
		String context = req.getContextPath(); // /FreeBoard
		String page = uri.substring(context.length()); // /add.do
		
		Control control = map.get(page);
		control.exec(req, resp);
		
	}
	
}
