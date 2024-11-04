package com.yedam.control.Item;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class ItemDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		ItemVO ivo = new ItemVO();
		ItemService svc = new ItemServiceImpl();
		String itemNum = req.getParameter("itemNum");
		System.out.println(itemNum);
		ivo.setItemNumber(Integer.parseInt(itemNum));
		
		try {
			if(svc.itemDelete(ivo)) {				
				//req.setAttribute("msg", "삭제를 완료하였습니다.");
				System.out.println("delete성공");
				out.println("<script>alert('삭제가 완료되었습니다'); location.href='mySellList.do';</script>");
			}
		}catch (Exception e) {
			req.getRequestDispatcher("seller/mySellList.tiles").forward(req, resp);
		}
		
	}

}
