package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.ItemListVO;

public class itemListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 목록 페이지(item List 객체, 페이지, 정렬방식, )
		String categories = req.getParameter("categories");
		String page = req.getParameter("page");
		
		ItemListVO ilvo = new ItemListVO();
		ilvo.setCategories(categories);
		
		if(page == null) {
			ilvo.setPage(1);
		} else {
			ilvo.setPage(Integer.parseInt(page));
		}
		
		buyerService svc = new buyerServiceImpl();
		int listCnt = svc.getSortItemListCnt(ilvo);
		
		req.setAttribute("ilvo", ilvo);
		req.setAttribute("listCnt", listCnt);
		
		req.getRequestDispatcher("buyer/itemList.tiles").forward(req, resp);
	}

}
