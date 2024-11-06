package com.yedam.control.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.main.ItemService;
import com.yedam.service.main.ItemServiceImpl;

public class ServerListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String game = req.getParameter("game");

		ItemService svc = new ItemServiceImpl();
		List<String> list = svc.serverList(game);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(list); // 자바객체 -> json문자열로 변경

		resp.getWriter().print(json);
	}

}
