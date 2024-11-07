package com.yedam.control.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class DuplicatIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String id = req.getParameter("mId");
		MemberService svc = new MemberServiceImpl();

		Map<String, Object> result = new HashMap<>();

		if (svc.searchDupId(id)) {
			result.put("retCode", "OK");
			result.put("retMsg", "중복된 아이디");
			result.put("retVal", id);
		} else {
			result.put("retCode", "FAIL");
			result.put("retMsg", "사용가능한 아이디");
			result.put("retVal", id);
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		resp.getWriter().print(gson.toJson(result));

	}

}
