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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>
	</header>

	<h1>index.jsp</h1>
	<p>한글 테스트111</p>
	<div class="default-select" id="default-select"">
		<!--  style="display: none;" -->
		<select>

			<option value="1">English</option>
			<option value="2">Spanish</option>
			<option value="3">Arabic</option>
			<option value="4">Portuguise</option>
			<option value="5">Bengali</option>
		</select>
		<div class="nice-select" tabindex="0">
			<span class="current">Spanish</span>
			<ul class="list">
				<li data-value="1" class="option focus">English</li>
				<li data-value="2" class="option">Spanish</li>
				<li data-value="3" class="option">Arabic</li>
				<li data-value="4" class="option">Portuguise</li>
				<li data-value="5" class="option">Bengali</li>
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
let selectFlag;
let selectBox = document.querySelector("div.nice-select");
let ulList = document.querySelector("ul.list");
let outText = document.querySelector("span.current");
selectBox.addEventListener('click', function(e){
	console.log(e.target.tagName)
	selectBox.classList.toggle('open');
	if(e.target.tagName == "LI"){
		let lists = ulList.querySelectorAll("li").forEach((li) =>{
			li.classList.remove('selected')
			li.addEventListener('click', function(e){
				li.classList.add('selected');
				outText.innerText = li.innerText;
			
		})
	})
	}	
	
})
	
	
	


</script>
</html>