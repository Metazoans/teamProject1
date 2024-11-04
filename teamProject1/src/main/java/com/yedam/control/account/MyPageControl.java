package com.yedam.control.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("member_id");
		String name = req.getParameter("member_name");
		String pwd = req.getParameter("password");

		
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(id);
		mvo.setMemberName(name);
		mvo.setPassword(pwd);
		
		if(id==null||pwd==null) {
			out.println("<script>alert('모든 필드를 입력해 주세요.'); history.back();</script>");
			return;
		}
		
		if(svc.modifyMember(mvo)) {
			out.println("<script>alert('변경성공'); location.href='loginForm.do';</script> ");		
		
		}else {
			out.println("<script>alert('변경 실패'); history.back();</script>");
			
		}
		
		
		
		
		
//		try {
//			//memberList.do 요청 페이지에서 memberList.jsp 요청재지정 보여지는것은 memberlist.do 이지만 요청하는거승 memberlist.jsp
//			req.getRequestDispatcher("account/myPage.tiles").forward(req, resp);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
	}
	
}
