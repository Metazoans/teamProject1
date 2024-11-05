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
import com.yedam.control.Item.AddItemControl;
import com.yedam.control.Item.AddItemForm;
import com.yedam.control.Item.ItemDeleteControl;
import com.yedam.control.Item.ItemUpdateControl;
import com.yedam.control.Item.MySellListControl;
import com.yedam.control.Item.PayStepUpdateControl;
import com.yedam.control.Item.SellerHistoryControl;
import com.yedam.control.account.GradeControl;
import com.yedam.control.account.LogOutControl;
import com.yedam.control.account.LoginControl;
import com.yedam.control.account.MemberAddControl;
import com.yedam.control.account.MemberAddFormControl;
import com.yedam.control.account.MemberDeleteControl;
import com.yedam.control.account.MileageControl;
import com.yedam.control.account.MyPageControl;
import com.yedam.control.account.MyPageFormControl;
import com.yedam.control.account.SearchIdControl;
import com.yedam.control.account.SearchIdFormControl;
import com.yedam.control.account.SearchPwdControl;
import com.yedam.control.account.SearchPwdFormControl;
import com.yedam.control.buyer.BuyCancelCont;
import com.yedam.control.buyer.BuyConfirmCont;
import com.yedam.control.buyer.BuyItemCont;
import com.yedam.control.buyer.BuyListCont;
import com.yedam.control.buyer.ItemDetailCont;
import com.yedam.control.buyer.ItemListChangeCont;
import com.yedam.control.buyer.ItemListCont;
import com.yedam.control.main.GameListControl;
import com.yedam.control.main.PopularControl;
import com.yedam.control.main.serverListControl;


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


		//ksy - 상품 목록, 상품 상세, 상품 구매, 구매 내역
		map.put("/itemList.do", new ItemListCont()); //상품 목록
		map.put("/itemListChange.do", new ItemListChangeCont()); //상품 목록 출력 변화
		
		map.put("/itemDetail.do", new ItemDetailCont()); //상품 상세
		map.put("/buyItem.do", new BuyItemCont()); //상품 구매
		
		map.put("/buyList.do", new BuyListCont()); //구매 내역
		map.put("/buyConfirm.do", new BuyConfirmCont()); //구매 확정
		map.put("/buyCancel.do", new BuyCancelCont()); //구매 취소
		
		


		
		
		
		map.put("/popular.do", new PopularControl());
		map.put("/gameList.do", new GameListControl());
		map.put("/serverList.do", new serverListControl());
		
		
		

		
	
		
		
		
		
		// item  상품 등록, 수량/가격 변경, 판매 상품 삭제, 거래 완료 버튼 관련
		map.put("/addItem.do", new AddItemControl());
		map.put("/addItemForm.do", new AddItemForm());
		// 판매상품 목록, 수정, 삭제
		map.put("/mySellList.do", new MySellListControl());
		map.put("/myItemUpdate.do", new ItemUpdateControl());
		map.put("/myItemDelete.do", new ItemDeleteControl());
		// 판매내역
		map.put("/sellerHistory.do", new SellerHistoryControl());
		map.put("/payStepUpdate.do", new PayStepUpdateControl());
		
		
		
		


	
		
		
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
		
		map.put("/mileage.do", new MileageControl());
		
		map.put("/memberDelete.do", new MemberDeleteControl());
		
		map.put("/grade.do", new GradeControl());
		
		
	

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
