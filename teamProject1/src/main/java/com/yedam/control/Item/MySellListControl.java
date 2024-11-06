package com.yedam.control.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.common.SearchDTO;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class MySellListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		ItemService svc = new ItemServiceImpl();
		
		HttpSession session = req.getSession();
		String logId = (String) session.getAttribute("logId");
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO pdto = new PageDTO(Integer.parseInt(page), svc.totalSell(logId));
		SearchDTO sdto = new SearchDTO();
		sdto.setKeyword(logId);
		sdto.setPage(pdto.getPage());
		
		req.setAttribute("page", pdto);
		
		List<ItemVO> Pagelist = svc.sellListPage(sdto);
		req.setAttribute("SellListPage", Pagelist);
		
		
		String bpage = req.getParameter("bpage");
        bpage = bpage == null ? "1" : bpage;
		
		PageDTO bdto = new PageDTO(Integer.parseInt(bpage), svc.totalBuy(logId));
		sdto.setKeyword(logId);
		sdto.setPage(bdto.getPage());
		
		req.setAttribute("bpage", bdto);
		
		List<ItemVO> PagelistBuy = svc.buyListPage(sdto);
		req.setAttribute("BuyListPage", PagelistBuy);

		
		req.getRequestDispatcher("seller/mySellList.tiles").forward(req, resp);
		
	}

}
