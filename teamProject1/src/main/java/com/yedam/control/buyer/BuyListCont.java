package com.yedam.control.buyer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.BuyerService;
import com.yedam.service.buyer.BuyerServiceImpl;
import com.yedam.vo.BillsVO;

public class BuyListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 구매 목록(사용자에 따라 구매내역 검색 후 출력)
		String buyer = req.getParameter("buyer"); //세션에서 로그인 계정 가져오기로 변경 예정
		
		BuyerService svc = new BuyerServiceImpl();
		List<BillsVO> buyList = svc.getBuyList(buyer);
		
		req.setAttribute("buyList", buyList);

		req.getRequestDispatcher("buyer/buyList.tiles").forward(req, resp);
	}

}
