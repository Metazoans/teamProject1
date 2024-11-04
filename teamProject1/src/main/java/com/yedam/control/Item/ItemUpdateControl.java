package com.yedam.control.Item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class ItemUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		String itemNum = req.getParameter("itemNum");
		String itemName = req.getParameter("itemName");
		String itemInfo = req.getParameter("itemInfo");
		String count = req.getParameter("count");
		String price = req.getParameter("price");
		String image = req.getParameter("image");
		
		System.out.println(itemNum);
		
		
		ivo.setItemName(itemName);
		ivo.setItemInfo(itemInfo);
		ivo.setPrice(Integer.parseInt(price));
		ivo.setCount(Integer.parseInt(count));
		ivo.setItemNumber(Integer.parseInt(itemNum));
		ivo.setImage(image);
		
		try {
			if(svc.itemUpdate(ivo)) {
				System.out.println("update성공");
				out.println("<script>alert('수정이 완료되었습니다'); location.href='mySellList.do';</script>");
			}
		}catch(Exception e){
			
		}
		
	}

}
