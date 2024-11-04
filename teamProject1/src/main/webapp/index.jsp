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
<link rel="stylesheet" href="css/ranking-chart.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>
	</header>
	
	<!-- search -->
	<!--
	<div class="w-75 p-3 row" id="center-location">
		<div class="default-select col-md-2.5" id="default-select"">
			<select style="display: none;">
				<option value="M" focus>게임머니</option>
				<option value="I">아이템</option>
				<option value="A">계정</option>
			</select>
			<div class="nice-select" tabindex="0">
				<span class="current col-md-2.5">게임머니</span>
				<ul class="list">
					<li data-value="M" class="option focus">게임머니</li>
					<li data-value="I" class="option">아이템</li>
					<li data-value="A" class="option">계정</li>
				</ul>
			</div>
		</div>
		<input type="text" name="search" placeholder="게임명 또는 서버를 입력하세요."
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '게임명 또는 서버를 입력하세요.'" required=""
			border="1" class="single-input col-md-7">
		<button type="button" class="btn head-btn1 col-md-2">검색</button>
	</div>
	-->
	<!-- content -->
	<!-- 인기순위(데이터 등록순) -->
	<h3 class="	table-name">인기순위</h3>
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
	<div id="randomList">
	
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