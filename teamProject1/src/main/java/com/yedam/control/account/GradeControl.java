package com.yedam.control.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class GradeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String logId = (String) session.getAttribute("logId");
		
		//String id = req.getParameter("member_id");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(logId);
		System.out.println(logId);
		if(svc.grade(mvo)>5) {
			svc.updateGrade("C", logId);
		}else if(svc.grade(mvo)>10) {
			svc.updateGrade("B", logId);
		}else if(svc.grade(mvo)>15) {
			svc.updateGrade("A", logId);
		}else if(svc.grade(mvo)>=20) {
			svc.updateGrade("S", logId);
		}

	}

}
