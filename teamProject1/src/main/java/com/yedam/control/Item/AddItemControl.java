package com.yedam.control.Item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.item.ItemService;
import com.yedam.service.item.ItemServiceImpl;
import com.yedam.vo.ItemVO;

public class AddItemControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		ItemService svc = new ItemServiceImpl();
		ItemVO ivo = new ItemVO();
		
		String game = req.getParameter("game");
		String categories = req.getParameter("categories");
		String servers = req.getParameter("servers");
		String itemName = req.getParameter("itemName");
		String itemInfo = req.getParameter("itemInfo");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String seller = "test1";
		String image = req.getParameter("image");
		
		System.out.println(game);
		
		ivo.setGame(game);
		ivo.setCategories(categories);
		ivo.setServers(servers);
		ivo.setItemName(itemName);
		ivo.setItemInfo(itemInfo);
		ivo.setPrice(Integer.parseInt(price));
		ivo.setCount(Integer.parseInt(count));
		ivo.setSeller(seller);
		ivo.setImage(image);
		
		
		try {	
			if(svc.addItem(ivo)) {				
				System.out.println("성공");
				resp.sendRedirect("itemList.do");
			}
		}catch(Exception e){		
			System.out.println("실패");
			req.getRequestDispatcher("seller/itemList.tiles").forward(req, resp);
		}
		
		
	}

}
