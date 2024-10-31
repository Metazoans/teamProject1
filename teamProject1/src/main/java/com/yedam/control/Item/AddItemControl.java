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
		String trade = req.getParameter("trade");
		
		
		ivo.setGame(game);
		ivo.setCategories(categories);
		ivo.setServers(servers);
		ivo.setItemName(itemName);
		ivo.setItemInfo(itemInfo);
		ivo.setPrice(Integer.parseInt(price));
		ivo.setCount(Integer.parseInt(count));
		ivo.setSeller(seller);
		ivo.setImage(image);
		ivo.setTrade(trade);
		
		
		try {	
			if(svc.addItem(ivo)) {				
				req.setAttribute("msg", "상품등록을 완료하였습니다");
				req.getRequestDispatcher("seller/addItemForm.tiles").forward(req, resp);
			}else {
				req.setAttribute("msg", "상품등록에 실패하였습니다");
				req.getRequestDispatcher("seller/addItemForm.tiles").forward(req, resp);
			}
		}catch(Exception e){		
			req.getRequestDispatcher("seller/addItemForm.tiles").forward(req, resp);
		}
		
		
	}

}
