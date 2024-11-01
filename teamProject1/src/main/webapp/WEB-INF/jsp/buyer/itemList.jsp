<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.progress-table-wrap {
	overflow-x: hidden;
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
	width: 60%;
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

<h1>itemList.jsp test222</h1>

<!-- 정렬 메뉴 시작 -->
<!-- Job List Area Start -->
<form action="itemList.do" method="get">

<div class="job-listing-area">
	<div class="container">
		<div class="row">

			<!-- Right content -->
			<section class="featured-job-area">
				<div class="container">

					<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
					<div class="progress-table-wrap">
						<div class="progress-table itemList">

							<div class="table-head">
								<div class="listTitle" data-value="item_name">제목</div>
								<div class="listPrice" data-value="price">가격</div>
								<div class="listSeller" data-value="seller">판매자</div>
								<div class="listDate" data-value="up_date">작성일</div>
							</div>

							<c:forEach var="item" items="${itemList }">
								<div class="table-row">
									<div class="listTitle">
										<img src="assets/img/elements/f1.jpg" alt="flag">${item.itemName }
									</div>
									<div class="listPrice">${item.price }</div>
									<div class="listSeller">${item.seller }</div>
									<div class="listDate">${item.upDate }</div>
								</div>
							</c:forEach>


						</div>
					</div>


				</div>
			</section>

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
						<ul class="pagination justify-content-start">
							<li class="page-item active"><a class="page-link" href="#">01</a></li>
							<li class="page-item"><a class="page-link" href="#">02</a></li>
							<li class="page-item"><a class="page-link" href="#">03</a></li>
							<li class="page-item"><a class="page-link" href="#"><span
									class="ti-angle-right"></span></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Pagination End  -->

</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/itemListChange.js"></script>
