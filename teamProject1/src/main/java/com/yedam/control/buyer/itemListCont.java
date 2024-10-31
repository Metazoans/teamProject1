package com.yedam.control.buyer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.ItemListVO;
import com.yedam.vo.ItemVO;

public class itemListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 목록 페이지(item List 객체, 페이지, 정렬방식, )
		String categories = req.getParameter("categories");
		String searchType = req.getParameter("searchType");
		String searchData = req.getParameter("searchData");
		String sort = req.getParameter("sort");
		String order = req.getParameter("order");
		
		ItemListVO itemList = new ItemListVO();
		itemList.setCategories(categories);
		itemList.setSearchType(searchType);
		itemList.setSearchData(searchData);
		itemList.setSort(sort);
		itemList.setOrder(order);
		
		buyerService svc = new buyerServiceImpl();
		List<ItemVO> list = svc.getSortItemList(itemList);
		
		req.setAttribute("itemList", list);
		
		req.getRequestDispatcher("buyer/itemList.tiles").forward(req, resp);
	}

}
