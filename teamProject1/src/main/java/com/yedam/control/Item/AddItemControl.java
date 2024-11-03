package com.yedam.control.Item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1025 * 100;
		
		MultipartRequest mr = new MultipartRequest(
				req
				,savePath
				,maxSize
				,"utf-8"
				,new DefaultFileRenamePolicy()
				);
		
		String game = mr.getParameter("game");
		String categories = mr.getParameter("categories");
		String servers = mr.getParameter("servers");
		String itemName = mr.getParameter("itemName");
		String itemInfo = mr.getParameter("itemInfo");
		String price = mr.getParameter("price");
		String count = mr.getParameter("count");
		String seller = mr.getParameter("logId");
		String image = mr.getFilesystemName("image");
		String trade = mr.getParameter("trade");
		
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
			}
		}catch(Exception e){		
			req.getRequestDispatcher("seller/addItemForm.tiles").forward(req, resp);
		}
		
		
	}

}
