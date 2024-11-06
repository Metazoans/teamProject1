<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<link rel="stylesheet" href="css/buyer.css">


<h1>buyList.jsp</h1>
<p>logId = ${logId }</p>
<p></p>

<!-- 이미지 / 상품명 / 거래 수량 / 결제 금액 / 거래 상태(거래 요청 / 거래 확인) / 결제 확인 버튼(pay_step 체크 후 클릭 가능하게) / 구매 취소 버튼 -->

<input type="hidden" id="buyer" value="${logId }">


<!-- 템플릿 적용 -->
<div class="job-listing-area">
	<div class="container">
		<div class="row">
			<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
			<div class="progress-table-wrap center-location">
				<div class="progress-table itemList">
					<h3>보낸 구매 신청</h3>
					<div class="table-head">
						<div class="buyTitle">제목</div>
						<div class="buyCount">갯수</div>
						<div class="buyPrice">결제액</div>
						<div class="buyPayStep">구매상태</div>
						<div class="buyBtnDiv">버튼</div>
					</div>

					<!-- 목록 출력 -->
					<div id="buyList">
					
					</div>
					
				</div>
				
				<br>
				<br>
				
				<div class="progress-table itemList">
					<h3>보낸 판매 신청</h3>
					<div class="table-head">
						<div class="buyTitle">제목</div>
						<div class="buyCount">갯수</div>
						<div class="buyPrice">결제액</div>
						<div class="buyPayStep">구매상태</div>
						<div class="buyBtnDiv">버튼</div>
					</div>

					<!-- 목록 출력 -->
					<div id="sellList">
					
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 임시 div -->
<div id='buyList'>
	<c:forEach var="list" items="${buyList }">
		<div id="buyItem">
			<input type="hidden" value="${list.billsNumber }">
			<input type="hidden" class="seller" value="${list.seller }">
			<div>${list.image }image</div>
			<div>${list.itemName }item_name</div>
			<div>${list.count }count</div>
			<div>${list.total }total</div>
			<div>${list.payStep }pay_step</div>
			<div id="buyBtnDiv">
				<button class="genric-btn primary-border" id="confirmBtn">거래확정</button>
				<button class="genric-btn danger-border" id="cancelBtn">거래취소</button>
				<button class="genric-btn warning-border" id="chatBtn">채팅</button>
			</div>
			<div>
			</div>
			<div >
			</div>
		</div>
	</c:forEach>
</div>

<script src="js/buyList.js"></script>
