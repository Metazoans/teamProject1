package com.yedam.control.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.account.MemberService;
import com.yedam.service.account.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class SearchIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
		req.setAttribute("mId", mId);
	
	}

}
