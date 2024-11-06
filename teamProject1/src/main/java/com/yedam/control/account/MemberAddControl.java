package com.yedam.control.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class MemberAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		

		String id = req.getParameter("member_id");
		String pwd = req.getParameter("password");
		String name = req.getParameter("member_name");		
		String phone = req.getParameter("phone");
		String birth = req.getParameter("birth");
		

		MemberVO mvo = new MemberVO();
		mvo.setMemberId(id);
		mvo.setMemberName(name);
		mvo.setPassword(pwd);
		mvo.setBirth(birth);
		mvo.setPhone(phone);
		
		MemberService svc = new MemberServiceImpl();
		try {
			svc.addMember(mvo);
			req.getRequestDispatcher("account/loginForm.tiles").forward(req, resp);
			//resp.sendRedirect("testBuyer.do");
		} catch(Exception e) {
			out.println("<script>alert('아이디가 중복입니다.'); history.back(); </script>");
			//resp.sendRedirect("memberAddForm.do");
		}
	}

}
