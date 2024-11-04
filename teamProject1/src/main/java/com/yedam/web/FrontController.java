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
import com.yedam.control.buyer.buyCancelCont;
import com.yedam.control.buyer.buyConfirmCont;
import com.yedam.control.buyer.buyItemCont;
import com.yedam.control.buyer.buyListCont;
import com.yedam.control.buyer.itemDetailCont;
import com.yedam.control.buyer.itemListChangeCont;
import com.yedam.control.buyer.itemListCont;

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
		
		//ksy - 상품 목록, 상품 상세, 상품 구매, 구매 내역
		map.put("/itemList.do", new itemListCont()); //상품 목록
		map.put("/itemListChange.do", new itemListChangeCont()); //상품 목록 출력 변화
		
		map.put("/itemDetail.do", new itemDetailCont()); //상품 상세
		map.put("/buyItem.do", new buyItemCont()); //상품 구매
		
		map.put("/buyList.do", new buyListCont()); //구매 내역
		map.put("/buyConfirm.do", new buyConfirmCont()); //구매 확정
		map.put("/buyCancel.do", new buyCancelCont()); //구매 취소
		
		
		
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
