<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<link rel="stylesheet" href="css/buyer.css">


<h1>sellHistory.jsp 1</h1>
<p>logId = ${logId }</p>
<p></p>

<!-- 이미지 / 상품명 / 거래 수량 / 결제 금액 / 거래 상태(거래 요청 / 거래 확인) / 결제 확인 버튼(pay_step 체크 후 클릭 가능하게) / 구매 취소 버튼 -->

<input type="hidden" id="logId" value="${logId }">



<!-- 템플릿 적용 -->
<div class="job-listing-area">
	<div class="container">
		<div class="row">
			<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
			<div class="progress-table-wrap center-location">
				<div class="progress-table itemList">
					<h3>받은 구매 신청(판매)</h3>
					<div class="table-head">
						<div class="buyTitle">제목</div>
						<div class="buyCount">갯수</div>
						<div class="buyPrice">결제액</div>
						<div class="buyPayStep">거래상태</div>
						<div class="buyBtnDiv">버튼</div>
					</div>

					<!-- 목록 출력 -->
					<div id="buyList">
					
					</div>
					
				</div>
				
				<br>
				<br>
				
				<div class="progress-table itemList">
					<h3>받은 판매 신청(구매)</h3>
					<div class="table-head">
						<div class="buyTitle">제목</div>
						<div class="buyCount">갯수</div>
						<div class="buyPrice">결제액</div>
						<div class="buyPayStep">거래상태</div>
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


<script src="js/sellList.js"></script>