package com.yedam.control.Item;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1025 * 100;
		
		MultipartRequest mr = new MultipartRequest(
				req
				,savePath
				,maxSize
				,"utf-8"
				,new DefaultFileRenamePolicy()
				);
		
		String itemNum = mr.getParameter("itemNum");
		String itemName = mr.getParameter("itemName");
		String itemInfo = mr.getParameter("itemInfo");
		String count = mr.getParameter("count");
		String price = mr.getParameter("price");
		String image = mr.getParameter("image");
		
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
