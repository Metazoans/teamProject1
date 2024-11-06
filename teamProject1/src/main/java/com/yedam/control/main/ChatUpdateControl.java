package com.yedam.control.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.main.ChatService;
import com.yedam.service.main.ChatServiceImpl;
import com.yedam.vo.ChatVO;

public class ChatUpdateControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String fromId = req.getParameter("fromId");
		String toId = req.getParameter("toId");
		String message = req.getParameter("message");
		
		ChatVO chat = new ChatVO();
		chat.setFromId(fromId);
		chat.setToId(toId);
		chat.setMessage(message);
		
		ChatService svc = new ChatServiceImpl();
		
		Map<String, Object> result = new HashMap<>();
		try {
			// {retCode:OK, retVal:chat}
			svc.chatUpdate(chat);
			result.put("retCode", "OK");
			result.put("retVal", chat);
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("retCode", "FAIL");
			result.put("retVal", chat);
		}
		

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(result); // 자바객체 -> json문자열로 변경

		resp.getWriter().print(json);
	}

}
