package com.yedam.control.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.main.ItemService;
import com.yedam.service.main.ItemServiceImpl;
import com.yedam.vo.RankVo;

public class PopularControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		String page = req.getParameter("page");
		page = (page == null || page == "") ? "1" : page;
		
		ItemService svc = new ItemServiceImpl();
		List<RankVo> list = svc.ranking((Integer.parseInt(page)));
		
		
		/*
		List<RankVo> list1 = svc.ranking((Integer.parseInt(page)*2) -1);
		List<RankVo> list2 = svc.ranking((Integer.parseInt(page)*2));
		req.setAttribute("page", page);
		req.setAttribute("rankList1", list1);
		req.setAttribute("rankList2", list2);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
		 */
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(list);	//자바객체 -> json문자열로 변경
		
		resp.getWriter().print(json);
	}

}
