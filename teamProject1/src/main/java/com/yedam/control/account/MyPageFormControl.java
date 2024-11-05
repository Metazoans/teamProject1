package com.yedam.control.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.BillsVO;
import com.yedam.vo.MemberVO;

public class MyPageFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
	       
		String logId = (String) session.getAttribute("logId");
		String name = (String) session.getAttribute("name");
		System.out.println(logId);
		System.out.println(name);
		MemberService svc = new MemberServiceImpl();
		List<MemberVO> list = svc.memberList(logId);
		
		
		req.setAttribute("memberList", list);
		
		List<BillsVO> sellList = svc.sellList(logId);
		req.setAttribute("sellList", sellList);
		
		List<BillsVO> purchaseList = svc.purchaseList(logId);
		req.setAttribute("purchaseList", purchaseList);
		
		req.getRequestDispatcher("account/myPage.tiles").forward(req, resp);
	}

}
