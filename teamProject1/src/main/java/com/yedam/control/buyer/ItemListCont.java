package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.BuyerService;
import com.yedam.service.buyer.BuyerServiceImpl;
import com.yedam.vo.ItemListVO;

public class ItemListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 목록 페이지(item List 객체, 페이지, 정렬방식, )
		String page = req.getParameter("page");
		String categories = req.getParameter("categories");
		String trade = req.getParameter("trade");
		String game = req.getParameter("game");
		String servers = req.getParameter("servers");
		
		ItemListVO ilvo = new ItemListVO();
		ilvo.setCategories(categories);
		ilvo.setTrade(trade);
		ilvo.setGame(game);
		ilvo.setServers(servers);
		
		if(page == null) {
			ilvo.setPage(1);
		} else {
			ilvo.setPage(Integer.parseInt(page));
		}
		
		BuyerService svc = new BuyerServiceImpl();
		int listCnt = svc.getSortItemListCnt(ilvo);
		
		req.setAttribute("ilvo", ilvo);
		req.setAttribute("listCnt", listCnt);
		
		req.getRequestDispatcher("buyer/itemList.tiles").forward(req, resp);
	}

}
