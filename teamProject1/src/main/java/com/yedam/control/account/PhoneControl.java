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

public class PhoneControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String phone = req.getParameter("phone");
		String id = req.getParameter("member_id");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = new MemberVO();
		mvo.setPhone(phone);
		mvo.setMemberId(id);
		
		System.out.println(phone);
		if(svc.modifyPhone(mvo)) {
			out.println("<script>alert('인증완료');  location.href='myPageForm.do'; </script>");
		}else {
			out.println("<script>alert('인증실패');  location.href='myPageForm.do'; </script>");
		}

	}

}
