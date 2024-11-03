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

public class MileageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String mileage = req.getParameter("mileage");
		String name =req.getParameter("member_name");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = new MemberVO();
		mvo.setMileage(Integer.parseInt(mileage));
		mvo.setMemberName(name);
		
		if(svc.modifyMileage(mvo)) {
			out.println("<script>alert('충전완료');  location.href='myPageForm.do'; </script>");

			System.out.println("성공");

		}else {
			out.println("<script>alert('충전 실패'); history.back();</script>");
			System.out.println("실패");
		}

	}

}
