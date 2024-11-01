package com.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.control.TestPageControl;
import com.yedam.control.account.LogOutControl;
import com.yedam.control.account.LoginControl;
import com.yedam.control.account.MemberAddControl;
import com.yedam.control.account.MemberAddFormControl;
import com.yedam.control.account.MyPageControl;
import com.yedam.control.account.MyPageFormControl;
import com.yedam.control.account.SearchIdControl;
import com.yedam.control.account.SearchIdFormControl;
import com.yedam.control.account.SearchPwdControl;
import com.yedam.control.account.SearchPwdFormControl;

//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	Map<String, Control> map;
	
	public FrontController() {
		//System.out.println("객체생성");
		map = new HashMap<>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//System.out.println("init호출");
		map.put("/testBuyer.do", new TestPageControl());
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		map.put("/loginForm.do", new LoginControl());
		map.put("/memberAddForm.do", new MemberAddFormControl()); //등록화면
		map.put("/memberAdd.do", new MemberAddControl()); //등록처리
		
		map.put("/searchIdForm.do", new SearchIdFormControl());
		map.put("/searchId.do", new SearchIdControl());
		
		map.put("/logOut.do", new LogOutControl());
		
		map.put("/searchPwdForm.do", new SearchPwdFormControl());
		map.put("/searchPwd.do", new SearchPwdControl());
		
		map.put("/myPageForm.do", new MyPageFormControl());
		map.put("/myPage.do", new MyPageControl());//마이페이지 
		
	
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("service호출");
		// 요청페이지?
		// http://localhost/FreeBoard/add.do (전체 : url)
		String uri = req.getRequestURI(); // /FreeBoard/add.do (부분 : uri)
		String context = req.getContextPath(); // /FreeBoard
		String page = uri.substring(context.length()); // /add.do
		
		Control control = map.get(page);
		control.exec(req, resp);
		
	}
	
}
