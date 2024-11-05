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

public class MemberDeleteControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		String logId = (String) session.getAttribute("logId");
		
		
		MemberService svc = new MemberServiceImpl();
//		MemberVO mvo = new MemberVO();
//		mvo.setMemberName(logId);
		
		if(svc.removeMember(logId)) {
			out.println("<script>alert('삭제완료');  location.href='logOut.do'; </script>");
		}else {
			out.println("<script>alert('삭제 실패'); history.back();</script>");
		}
	}

}
