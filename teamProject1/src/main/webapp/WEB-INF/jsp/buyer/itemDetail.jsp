<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- itemDetail.do -->
<!-- 
	화면 css 적용
	구매 버튼 클릭시 buyCount 초기화 및 재출력
 -->

<style>
#buyCount::-webkit-inner-spin-button {
  -webkit-appearance:none;
  margin: 0;
}

</style>

<p>login : ${logId }</p>

<div id="itemDetailData">
	<input type="hidden" id="logId" value="${logId }">
	<input type="hidden" id="itemNumber" value="${item.itemNumber }">
</div>

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
				<p class="form-control w-100">${item.itemInfo }</p>
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
				<input class="form-control" type="number" id="buyCount" max="${item.count }" placeholder="최대 : ${item.count }">
			</div>
		</div>
		<div class="form-group">
			<c:if test="${logId != null }">
				<a id="buyBtn" href="#" class="genric-btn danger-border circle" >구입</a>
			</c:if>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
<script src="js/itemDetail.js"></script>


