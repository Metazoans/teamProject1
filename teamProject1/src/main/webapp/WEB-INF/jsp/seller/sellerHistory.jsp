<%@page import="com.yedam.vo.BillsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List<BillsVO> list = (List<BillsVO>)request.getAttribute("sellerHistory");
	%>
	
	<%
		for(BillsVO bvo : list){
	%>
	<form action="post">
	<div class="progress-table">
		<div class="table-head">
			<div class="serial">이미지</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">상품수량</div>
			<div class="serial">총금액</div>
		</div>
		<div class="table-row">
			<div class="serial"><img src="images/<%=bvo.getImage() %>"></div>
			<div class="serial"><%=bvo.getItemName() %></div>
			<div class="serial"><%=bvo.getCount() %></div>
			<div class="serial"><%=bvo.getTotal() %></div>
			<div class="form-check form-check-inline">
  			<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
  			<label class="form-check-label" for="inlineCheckbox2"></label>
			</div>			
		</div>
	</div>
	
	<% } %>

	<button type="submit" class="btn btn head-btn2" formaction="payStepUpdate.do">아이템전송확인</button>
	<button type="submit" class="btn btn head-btn1">취소</button>
	</form>
	
	
</body>
</html>