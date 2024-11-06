<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/chat.css">
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">채팅</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modal-chat">
					<!-- 내용들어갈부분 -->
				</div>
				<div class="modal-input">
					<textarea name="chat-content" cols="40" rows="4"
						style="resize: none;" class="float-reft" id="message"></textarea>
					<button type="button" class="btn btn-primary float-reft btnSize"
						onclick="chatUp()">전송</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script src="js/sellList.js"></script>
<script type="text/javascript">
	let fromId = "${logId}";
	let toId = "";
</script>
<script src="js/chat-buyer.js"></script>