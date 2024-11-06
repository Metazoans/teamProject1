<%@page import="java.util.List"%>
<%@page import="com.yedam.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
	padding-top: 50px;
	margin: 0 auto;
	width: 80%;	
	padding-bottom: 50px;
}
</style>
</head>
<body>
	<div id="container">
	
	<%
		List<ItemVO> list = (List<ItemVO>)  request.getAttribute("ItemList");
	%>
	<%
		for(ItemVO ivo : list){
	%>
	
	<div class="progress-table">
		<div class="table-head">
			<div class="serial">서버종류</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">판매금액</div>
			<div class="serial">등록시간</div>
		</div>
		<div class="table-row">
			<div class="serial"><%=ivo.getServers() %></div>
			<div class="serial"><%=ivo.getItemName() %></div>
			<div class="serial"><%=ivo.getPrice() %></div>
			<div class="serial"><%=ivo.getUpDate() %></div>
						
		</div>
	</div>
	
	
	<% } %>
	</div>
</body>
</html>