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

public class SearchPwdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String id = req.getParameter("member_id");
		String name = req.getParameter("member_name");
		String birth = req.getParameter("birth");
		String phone = req.getParameter("phone");

		MemberVO mvo = new MemberVO();
		mvo.setMemberId(id);
		mvo.setMemberName(name);
		mvo.setBirth(birth);
		mvo.setPhone(phone);

		MemberService svc = new MemberServiceImpl();
		MemberVO list = svc.searchPwd(mvo);

		if (list != null) {
			String mPwd = list.getPassword();
			System.out.println(mPwd);
			out.println("<script>alert('비밀번호는 " + mPwd + " 입니다.'); location.href='loginForm.do';</script>");
		} else {
			out.println("<script>alert('정보가 일치하는 회원이 없습니다.'); history.back();</script>");

		}

	}
}
