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

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("logId");
		String pwd = req.getParameter("logPw");

		if (req.getMethod().equals("GET")) {
			req.getRequestDispatcher("account/loginForm.tiles").forward(req, resp);
		} else if (req.getMethod().equals("POST")) {

			MemberService svc = new MemberServiceImpl();
			MemberVO member = svc.loginCheck(id, pwd);
			// 로그인 실패
			if (member == null) {
				req.setAttribute("msg", "아이디와 비밀번호 확인");
				req.getRequestDispatcher("account/loginForm.tiles").forward(req, resp);
				return;

			}
			HttpSession session = req.getSession();
			session.setAttribute("logId",id);
			if(member.getPermission().equals("User"))
				resp.sendRedirect("index.jsp");
//				else if(member.getPermission().equals("Admin"))
//					resp.sendRedirect("");
			

		}
	}
}
