<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- itemDetail.do -->
<!-- 
	화면 css 적용
	구매 버튼 클릭시 buyCount 초기화 및 재출력
 -->

<!-- 템플릿 -->
<div class="col-lg-12">
	<div class="row">

		<div class="col-12">
			<div class="form-group">
				<p class="form-control">${item.itemName }</p>
			</div>
		</div>

		<!-- 게임4 / 서버4 / 카테고리4 -->
		<div class="col-sm-4">
			<div class="form-group">
				<p class="form-control valid">${item.game }</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<p class="form-control valid">${item.servers }</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<p class="form-control valid">${item.categories }</p>
			</div>
		</div>

		<!-- 내용 -->
		<div class="col-sm-12">
			<div class="form-group">
				<textarea class="form-control w-100" cols="30" rows="15">${item.itemInfo }</textarea>
			</div>
		</div>

		<div class="col-sm-12">
			<div class="form-group">
				<p class="form-control valid">image : ${item.image }</p>
			</div>
		</div>
		
		
		<div class="col-sm-3">
			<div class="form-group">
				<p class="form-control valid">${item.seller }</p>
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<p class="form-control valid">${item.price }</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<p class="form-control valid">${item.count }</p>
			</div>
		</div>
		
		<div class="col-sm-2">
			<a href="#" class="genric-btn danger circle">Danger</a>
		</div>

</div>


<!-- 임시 -->
<!-- <div id="itemDetail"> -->
<%-- 	<h3 class="single-input">test ${item.itemName }</h3> --%>

<!-- 	<div> -->
<%-- 		<span>${item.game }</span> <span>${item.servers }</span> <span>${item.categories }</span> --%>
<!-- 	</div> -->

<!-- 	<div> -->
<%-- 		<span class="single-textarea">${item.itemInfo }</span> <span>img</span> --%>
<!-- 	</div> -->

<!-- 	<div id="buyDiv"> -->
<%-- 		<span>${item.seller }</span> <span>${item.price }</span> <span><input --%>
<%-- 			id="buyCount">${item.count }</span> --%>
<!-- 		<button id="buyBtn">구매</button> -->
<!-- 	</div> -->
<!-- </div> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
//buyBtn 동작 -> OK=count 변경, CFAIL=구매 갯수 오류, RFAIL=bills 추가 실패
$('#buyBtn').on('click', function(e) {
	console.log('buyBtn click');
	console.log(${item.itemNumber});
	console.log($('#buyCount').val());
	$.ajax({
		url: 'buyItem.do',
		data: {
			itemNumber: ${item.itemNumber},
			buyCount: $('#buyCount').val(),
			loginId: '1111' //세션으로 변경 예정
		},
		method: 'GET',
		dataType: 'json'
	}) 
		.done(function(result) {
			if(result.retCode == 'OK') {
				//count tag change
				console.log('성공');
			}
			else if(result.retCode == 'CFAIL') {
				console.log('구매 갯수 오류');
			}
			else if(result.retCode == 'RFAIL') {
				console.log('bills 추가 실패');
			}
		})
		.fail(function(err) {
			console.log('err 발생');
			console.log(err);
		})
})


</script>


