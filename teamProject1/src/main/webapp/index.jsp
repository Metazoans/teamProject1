<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>test main page</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
<link rel="manifest" href="site.webmanifest">
 -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/price_rangs.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/mainPage.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>
	</header>
	<!-- content -->
	<!-- 인기순위(데이터 등록순) -->
	<h3 class="table-name1">인기순위</h3>
	<div id="rankingList" class="col-lg-12">
		<div class="page-float">
			<div class="section-top-border">
				<div class="progress-table-wrap">
					<div class="progress-table">
						<!-- 내용 들어갈부분 -->
					</div>
				</div>
			</div>
		</div>
		<div class="page-float">
			<div class="section-top-border">
				<div class="progress-table-wrap">
					<div class="progress-table">
						<!-- 내용 들어갈부분 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 랜덤으로 리스트 출력 -->
	<h3 class="table-name2">추천목록</h3>
	<div id="randomList">
		<div class="section-top-border">
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="percentage">Percentages</div>
						<div class="serial">#</div>
						<div class="country">Countries</div>
						<div class="visit">Visits</div>
					</div>
					<div class="table-row">
						<div class="percentage">
							<div class="progress">
								<div class="progress-bar color-1" role="progressbar"
									style="width: 80%" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>
						<div class="serial">01</div>
						<div class="country">
							<img src="assets/img/elements/f1.jpg" alt="flag">Canada
						</div>
						<div class="visit">645032</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer>
		<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		let page = "1";
	</script>
	<script src="js/menuStyle.js"></script>
	<script src="js/mainPage.js"></script>
</body>
</html>