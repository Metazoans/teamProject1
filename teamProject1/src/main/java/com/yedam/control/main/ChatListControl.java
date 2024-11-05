package com.yedam.control.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.main.ChatService;
import com.yedam.service.main.ChatServiceImpl;
import com.yedam.vo.ChatVO;

public class ChatListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String fromId = req.getParameter("fromId");
		String toId = req.getParameter("toId");
		

		ChatService svc = new ChatServiceImpl();
		List<ChatVO> list = svc.chatList(fromId, toId);
		
		req.setAttribute(fromId, toId)
		req.getRequestDispatcher(toId).forward(req, resp)

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(list); // 자바객체 -> json문자열로 변경

		resp.getWriter().print(json);

	}

}
