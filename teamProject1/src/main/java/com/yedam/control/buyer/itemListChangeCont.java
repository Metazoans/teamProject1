package com.yedam.control.buyer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.buyer.buyerService;
import com.yedam.service.buyer.buyerServiceImpl;
import com.yedam.vo.ItemListVO;
import com.yedam.vo.ItemVO;

public class itemListChangeCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		// 상품 목록 페이지(item List 객체, 페이지, 정렬방식, )
		String page = req.getParameter("page");
		String categories = req.getParameter("categories");
		String searchType = req.getParameter("searchType");
		String searchData = req.getParameter("searchData");
		String sort = req.getParameter("sort");
		String order = req.getParameter("order");
		
		ItemListVO ilvo = new ItemListVO();
		ilvo.setPage(Integer.parseInt(page));
		ilvo.setCategories(categories);
		ilvo.setSearchType(searchType);
		ilvo.setSearchData(searchData);
		ilvo.setSort(sort);
		ilvo.setOrder(order);
		
		buyerService svc = new buyerServiceImpl();
		List<ItemVO> list = svc.getSortItemList(ilvo);
		
		req.setAttribute("itemList", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // 자바 객체 => json문자열로 변경

		resp.getWriter().print(json);
	}

}
