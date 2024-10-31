package com.yedam.control.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class SearchIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("member_name");
		String birth = req.getParameter("birth");
		String phone = req.getParameter("phone");

		MemberVO mvo = new MemberVO();
		mvo.setMemberName(name);
		mvo.setBirth(birth);
		mvo.setPhone(phone);

		MemberService svc = new MemberServiceImpl();

		svc.searchId(mvo);
		MemberVO list = svc.searchId(mvo);

		System.out.println(list);
		String mId = list.getMemberId();		
		HttpSession session = req.getSession();
		if(mId!=null) {
			session.setAttribute("mId",mId);
		req.getRequestDispatcher("buyer/buyer.tiles").forward(req, resp);
		}
	
	}

}
