<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="css/buyer.css">

<p>login ID : ${logId }</p>
<div id="dataPrt">
	<p>page : ${ilvo.page }</p>

</div>

<div id="listDataDiv">
	<input type="hidden" id="page" value="${ilvo.page }">
	<input type="hidden" id="categories" value="${ilvo.categories }">
	<input type="hidden" id="trade" value="${ilvo.trade }">
	<input type="hidden" id="game" value="${ilvo.game }">
	<input type="hidden" id="servers" value="${ilvo.servers }">
</div>
<!-- 검색 -->
<div class="job-listing-area">

	<div class="container">
		<div class="row">

			<!-- 검색창 -->
			<div class="p-3 row center-location" id="searchDiv">
			<div class="borderCont">
				<div class="default-select col-md-2.5" id="default-select">
					<div class="nice-select searchHeight" tabindex="0")>
						<span class="current col-md-2.5 searchHeight" data-value="item_name">제목</span>
						<ul class="list">
							<li data-value="item_name" class="option focus">제목</li>
							<li data-value="item_info" class="option">내용</li>
							<li data-value="seller" class="option">판매자</li>
						</ul>
					</div>
				</div>
			</div>
				<input type="text" name="search" autofocus class="single-input col-md-7 borderCont">
				<button type="button" class="btn head-btn1 col-md-2">검색</button>
			</div>


			<!-- Right content -->
			<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
			<div class="progress-table-wrap center-location">
				<div class="progress-table itemList">
					
					<div class="table-head">
						<div class="listTitle" data-value="item_name">제목</div>
						<div class="listPrice" data-value="price">가격</div>
						<div class="listSeller" data-value="seller">판매자</div>
						<div class="listDate" data-value="up_date">작성일</div>
					</div>

					<!-- 목록 출력 -->
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Job List Area End -->

<!--Pagination Start  -->
<div class="pagination-area pb-115 text-center">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="single-wrap d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-start" data-value="${listCnt }">
<!-- 							<li class="page-item"><a class="page-link" href="#"><span class="ti-angle-left"></span></a></li> -->
<!-- 							<li class="page-item active"><a class="page-link" href="#">01</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">02</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">03</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">04</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">05</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li> -->
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Pagination End  -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/itemListChange.js"></script>
