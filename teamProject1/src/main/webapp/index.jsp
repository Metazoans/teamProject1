<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>test main page</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
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
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>
	</header>

	<h1>index.jsp</h1>
	<p>한글 테스트111</p>
	<div class="default-select" id="default-select" ">
		<select style="display: none;">
			<option value=" 1">English</option>
			<option value="1">Spanish</option>
			<option value="1">Arabic</option>
			<option value="1">Portuguise</option>
			<option value="1">Bengali</option>
		</select>
		<div class="nice-select" tabindex="0" onclick="clickSelect()">
			<span class="current">Spanish</span>
			<ul class="list">
				<li data-value="1" class="option focus">English</li>
				<li data-value="1" class="option selected">Spanish</li>
				<li data-value="1" class="option">Arabic</li>
				<li data-value="1" class="option">Portuguise</li>
				<li data-value="1" class="option">Bengali</li>
			</ul>
	<input type="text" name="search" placeholder="검색어를 입력하세요."
		onfocus="this.placeholder = ''"
		onblur="this.placeholder = '검색어를 입력하세요.'" required=""
		class="single-input">
		</div>
	</div>

	<footer>
		<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
	</footer>
</body>
<script>
function clickSelect(){
	document.querySelector(".nice-selcet").classList.add('open');
	
}
</script>
</html>