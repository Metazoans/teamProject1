<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<h1>buyList.jsp</h1>

<!-- 이미지 / 상품명 / 거래 수량 / 결제 금액 / 거래 상태(거래 요청 / 거래 확인) / 결제 확인 버튼(pay_step 체크 후 클릭 가능하게) / 구매 취소 버튼 -->

<!-- 템플릿 적용 -->


<!-- 임시 div -->
<div id='buyList'>
	<c:forEach var="list" items="${buyList }">
		<div id="buyItem">
			<input type="hidden" value="${list.billsNumber }">
			<div>${list.image }image</div>
			<div>${list.itemName }item_name</div>
			<div>${list.count }count</div>
			<div>${list.total }total</div>
			<div>${list.payStep }pay_step</div>
			<div>
				<button disabled id="confirmBtn">구매 확정</button>
			</div>
			<div>
				<button id="cancelBtn">구매 취소</button>
			</div>
		</div>
	</c:forEach>
</div>

<script>
	//구매 확정
	$('#confirmBtn').on('click', function(e) {
		let billsNumber = $(e.target).parent().parent().find('input').val();
		console.log(billsNumber);
		$.ajax({
			url : 'buyConfirm.do',
			data : {
				billsNumber : billsNumber
			},
			method : 'GET',
			dataType : 'json'
		}).done(function(result) {
			if (result.retCode == 'OK') {
				console.log('구매 확정 성공');
			} else if (result.retCode == 'FAIL') {
				console.log('구매 확정 실패');
			}
		}).fail(function(err) {
			console.log(err);
		})
	})

	//구매 취소
	$('#cancelBtn').on('click', function(e) {
		let billsNumber = $(e.target).parent().parent().find('input').val();
		$.ajax({
			url : 'buyCancel.do',
			data : {
				billsNumber : billsNumber
			},
			method : 'GET',
			dataType : 'json'
		}).done(function(result) {
			if (result.retCode == 'OK') {
				console.log('구매 취소 성공');
			} else if (result.retCode == 'FAIL') {
				console.log('구매 취소 실패');
			}
		}).fail(function(err) {
			console.log(err);
		})
	})
</script>
