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
	width: 100%; color : #415094;
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

<script>

document.querySelector('.table-head div')

</script>

<h1>itemList.jsp test</h1>

<!-- 정렬 메뉴 시작 -->
<!-- Job List Area Start -->
<div class="job-listing-area pt-120 pb-120">
	<div class="container">
		<div class="row">
			<!-- Left content -->
			<div class="col-xl-3 col-lg-3 col-md-4">
				<div class="row">
					<div class="col-12">
						<div class="small-section-tittle2 mb-45">
							<div class="ion">
								<svg xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="20px"
									height="12px">
                                    <path fill-rule="evenodd"
										fill="rgb(27, 207, 107)"
										d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"></path>
                                    </svg>
							</div>
							<h4>사이드 메뉴</h4>
						</div>
					</div>
				</div>
				<!-- Job Category Listing start -->
				<div class="job-category-listing mb-50">
					<!-- single one -->
					<div class="single-listing">
						<div class="small-section-tittle2">
							<h4>Job Category</h4>
						</div>
						<!-- Select job items start -->
						<div class="select-job-items2">
							<select name="select" style="display: none;">
								<option value="">All Category</option>
								<option value="">Category 1</option>
								<option value="">Category 2</option>
								<option value="">Category 3</option>
								<option value="">Category 4</option>
							</select>
							<div class="nice-select" tabindex="0">
								<span class="current">All Category</span>
								<ul class="list">
									<li data-value="" class="option selected focus">All
										Category</li>
									<li data-value="" class="option">Category 1</li>
									<li data-value="" class="option">Category 2</li>
									<li data-value="" class="option">Category 3</li>
									<li data-value="" class="option">Category 4</li>
								</ul>
							</div>
						</div>
						<!--  Select job items End-->
						<!-- select-Categories start -->
						<div class="select-Categories pt-80 pb-50">
							<div class="small-section-tittle2">
								<h4>Job Type</h4>
							</div>
							<label class="container">Full Time <input type="checkbox">
								<span class="checkmark"></span>
							</label> <label class="container">Part Time <input
								type="checkbox" checked="checked active"> <span
								class="checkmark"></span>
							</label> <label class="container">Remote <input type="checkbox">
								<span class="checkmark"></span>
							</label> <label class="container">Freelance <input
								type="checkbox"> <span class="checkmark"></span>
							</label>
						</div>
						<!-- select-Categories End -->
					</div>
					<!-- single two -->
					<div class="single-listing">
						<div class="small-section-tittle2">
							<h4>Job Location</h4>
						</div>
						<!-- Select job items start -->
						<div class="select-job-items2">
							<select name="select" style="display: none;">
								<option value="">Anywhere</option>
								<option value="">Category 1</option>
								<option value="">Category 2</option>
								<option value="">Category 3</option>
								<option value="">Category 4</option>
							</select>
							<div class="nice-select" tabindex="0">
								<span class="current">Anywhere</span>
								<ul class="list">
									<li data-value="" class="option selected">Anywhere</li>
									<li data-value="" class="option">Category 1</li>
									<li data-value="" class="option">Category 2</li>
									<li data-value="" class="option">Category 3</li>
									<li data-value="" class="option">Category 4</li>
								</ul>
							</div>
						</div>
						<!--  Select job items End-->
						<!-- select-Categories start -->
						<div class="select-Categories pt-80 pb-50">
							<div class="small-section-tittle2">
								<h4>Experience</h4>
							</div>
							<label class="container">1-2 Years <input type="checkbox">
								<span class="checkmark"></span>
							</label> <label class="container">2-3 Years <input
								type="checkbox" checked="checked active"> <span
								class="checkmark"></span>
							</label> <label class="container">3-6 Years <input
								type="checkbox"> <span class="checkmark"></span>
							</label> <label class="container">6-more.. <input type="checkbox">
								<span class="checkmark"></span>
							</label>
						</div>
						<!-- select-Categories End -->
					</div>
					<!-- single three -->
					<div class="single-listing">
						<!-- select-Categories start -->
						<div class="select-Categories pb-50">
							<div class="small-section-tittle2">
								<h4>Posted Within</h4>
							</div>
							<label class="container">Any <input type="checkbox">
								<span class="checkmark"></span>
							</label> <label class="container">Today <input type="checkbox"
								checked="checked active"> <span class="checkmark"></span>
							</label> <label class="container">Last 2 days <input
								type="checkbox"> <span class="checkmark"></span>
							</label> <label class="container">Last 3 days <input
								type="checkbox"> <span class="checkmark"></span>
							</label> <label class="container">Last 5 days <input
								type="checkbox"> <span class="checkmark"></span>
							</label> <label class="container">Last 10 days <input
								type="checkbox"> <span class="checkmark"></span>
							</label>
						</div>
						<!-- select-Categories End -->
					</div>
					<div class="single-listing">
						<!-- Range Slider Start -->
						<aside
							class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
							<div class="small-section-tittle2">
								<h4>Filter Jobs</h4>
							</div>
							<div class="widgets_inner">
								<div class="range_item">
									<!-- <div id="slider-range"></div> -->
									<span class="irs js-irs-0"><span class="irs"><span
											class="irs-line" tabindex="-1"><span
												class="irs-line-left"></span><span class="irs-line-mid"></span><span
												class="irs-line-right"></span></span><span class="irs-min"
											style="visibility: hidden;">tk. 0</span><span class="irs-max"
											style="visibility: visible;">tk. 1.000</span><span
											class="irs-from" style="visibility: visible; left: 0%;">tk.
												0</span><span class="irs-to"
											style="visibility: visible; left: 38.3028%;">tk. 500</span><span
											class="irs-single"
											style="visibility: hidden; left: 8.60092%;">tk. 0 -
												tk. 500</span></span><span class="irs-grid"></span><span class="irs-bar"
										style="left: 3.44037%; width: 46.5596%;"></span><span
										class="irs-shadow shadow-from" style="display: none;"></span><span
										class="irs-shadow shadow-to" style="display: none;"></span><span
										class="irs-slider from" style="left: 0%;"></span><span
										class="irs-slider to type_last" style="left: 46.5596%;"></span></span><input
										type="text" class="js-range-slider irs-hidden-input" value=""
										readonly="">
									<div class="d-flex align-items-center">
										<div class="price_text">
											<p>Price :</p>
										</div>
										<div class="price_value d-flex justify-content-center">
											<input type="text" class="js-input-from" id="amount"
												readonly=""> <span>to</span> <input type="text"
												class="js-input-to" id="amount" readonly="">
										</div>
									</div>
								</div>
							</div>
						</aside>
						<!-- Range Slider End -->
					</div>
				</div>

				<!-- Job Category Listing End -->
			</div>
			
			
			
			<!-- Right content -->
			<div class="col-xl-9 col-lg-9 col-md-8 rightContent">
				<!-- Featured_job_start -->
				<section class="featured-job-area">
					<div class="container">

						<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
						<div class="progress-table-wrap">
							<div class="progress-table itemList">

								<div class="table-head">
									<div class="listTitle">제목</div>
									<div class="listPrice">가격</div>
									<div class="listSeller">판매자</div>
									<div class="listDate">작성일</div>
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
				<!-- Featured_job_end -->
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
