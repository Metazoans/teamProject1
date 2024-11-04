package com.yedam.control.buyer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class buyListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 구매 목록(사용자에 따라 구매내역 검색 후 출력)

		req.getRequestDispatcher("buyer/buyLIst.tiles").forward(req, resp);
	}

}
