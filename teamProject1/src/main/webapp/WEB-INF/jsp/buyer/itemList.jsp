<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#searchDiv {
	width: 100%;
}
.searchHeight {
	height: 100% !important;
	display: flex;
	justify-content: center;
	align-items: center;;
}

.default-select {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}


.borderCont {
	border: 1px solid rgba(0, 0, 0, .1);
	margin-right: 2px;
}

.progress-table-wrap {
	overflow-x: hidden;
	width: 100%;
}

.itemList {
	min-width: 100%;
}

.itemList .table-head, .table-row {
	width: 100%;
	color: #415094;
	line-height: 40px;
	text-transform: uppercase;
	font-weight: 500;
	color: #415094
}

.itemList .table-head div, .table-row div {
	overflow-x: hidden;
	overflow-y: hidden;
	padding: 0 5px;
}

.table-head {
	height: 41px;
}

.table-row {
	height: 71px;
}

.listTitle {
	width: 65%;
}

.listPrice {
	width: 10%;
}

.listSeller {
	width: 10%;
}

.listDate {
	width: 15%;
}
</style>

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
				<div class="progress-table itemList" data-value="${ilvo.categories }">
					
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
<div class="pagination-area pb-115 text-center" data-value="${ilvo.page }">
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
