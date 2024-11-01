package com.yedam.control.Item;

import java.io.IOException;

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
		
		ItemVO ivo = new ItemVO();
		ItemService svc = new ItemServiceImpl();
		String itemNum = req.getParameter("itemNum");
		
		ivo.setItemNumber(Integer.parseInt(itemNum));
		
		try {
			if(svc.itemDelete(ivo)) {				
				req.setAttribute("msg", "삭제를 완료하였습니다.");
				resp.sendRedirect("mySellList.do");
				System.out.println("성공");
			}
		}catch (Exception e) {
			req.getRequestDispatcher("seller/mySellList.tiles").forward(req, resp);
		}
		
	}

}
