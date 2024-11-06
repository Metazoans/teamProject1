<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
<!-- itemDetail.do -->
<!-- 
	화면 css 적용
	구매 버튼 클릭시 buyCount 초기화 및 재출력
 -->

<style>
#dealCount::-webkit-inner-spin-button {
  -webkit-appearance:none;
  margin: 0;
}

</style>

<p>login : ${logId }</p>
<p>itemNum : ${item.itemNumber }</p>

<div id="itemDetailData">
	<input type="hidden" id="logId" value="${logId }">
	<input type="hidden" id="itemNumber" value="${item.itemNumber }">
	<input type="hidden" id="trade" value="${item.trade }">
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
				<textarea readonly class="form-control w-100" rows="15" style="background-color: white">${item.itemInfo }</textarea>
			</div>
		</div>
		
		<c:if test="${item.image != null }">
			<div class="col-sm-12">
				<div class="form-group">
					<p class="form-control valid">image : ${item.image }</p>
				</div>
			</div>
		</c:if>
		
		<div class="col-sm-3">
			<div class="form-group">
				<p id="seller" class="form-control valid">${item.seller }</p>
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<p class="form-control valid">${item.price }</p>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<input type="hidden" id="maxCount" value="${item.count }">
				<input class="form-control" type="number" id="dealCount" placeholder="최대 : ${item.count }">
			</div>
		</div>
		<div class="form-group">
			<c:if test="${logId != null }">
				<c:if test="${item.trade == 'sell' }">
					<a id="dealBtn" href="#" class="genric-btn danger-border circle" >구입</a>
				</c:if>
				<c:if test="${item.trade == 'buy' }">
					<a id="dealBtn" href="#" class="genric-btn danger-border circle" >판매</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>

<script src="js/itemDetail.js"></script>


