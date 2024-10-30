package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class TestPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("buyer test Page start");
		
		try {
			// memberList.do 로 요청된 페이지에서 memberList.jsp로 요청재지정
			req.getRequestDispatcher("buyer/buyer.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
