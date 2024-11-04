<%@page import="com.yedam.vo.ItemVO"%>
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
		List<ItemVO> list = (List<ItemVO>)request.getAttribute("sellerHistory");
	%>
	
	<%
		for(ItemVO ivo : list){
	%>
	<form action="post">
	<div class="progress-table">
		<div class="table-head">
			<div class="serial">이미지</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">상품수량</div>
			<div class="serial">판매금액(수량1개당가격)</div>
		</div>
		<div class="table-row">
			<div class="serial"><%=ivo.getImage() %></div>
			<div class="serial"><%=ivo.getItemName() %></div>
			<div class="serial"><%=ivo.getCount() %></div>
			<div class="serial"><%=ivo.getPrice() %></div>
						
		</div>
	</div>
	
	<% } %>

	<button type="submit" class="btn btn head-btn2" formaction="payStepUpdate.do">아이템전송확인</button>
	<button type="submit" class="btn btn head-btn1">취소</button>
	</form>
	
	
</body>
</html>