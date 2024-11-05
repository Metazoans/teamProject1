package com.yedam.control.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;


public class ChatControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String buyer = req.getParameter("buyer");
		String seller = req.getParameter("seller");

		req.setAttribute("seller", seller);
		req.setAttribute("buyer", buyer);
		req.getRequestDispatcher("main/chat.tiles").forward(req, resp);
	}

}
