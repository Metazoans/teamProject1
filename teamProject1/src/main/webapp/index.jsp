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
	<!-- header -->
	<div class="header-area header-transparrent">
		<div class="headder-top header-sticky">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-2">
						<!-- Logo -->
						<div class="logo">
							<a href="index.jsp"><img src="assets/img/logo/logo.png"
								alt=""></a>
						</div>
					</div>
					<div class="col-lg-9 col-md-9">
						<div class="menu-wrapper">
							<!-- Main-menu -->
							<div class="main-menu">
								<nav class="d-none d-lg-block">
									<ul id="navigation">
										<li><a href="#">게임머니</a>
											<ul class="submenu">
												<li><a href="#">게임머니 구매</a></li>
												<li><a href="#">게임머니 판매</a></li>
											</ul></li>
										<li><a href="#">아이템</a>
											<ul class="submenu">
												<li><a href="#">아이템 구매</a></li>
												<li><a href="#">아이템 판매</a></li>
											</ul></li>
										<li><a href="#">계정</a>
											<ul class="submenu">
												<li><a href="#">계정 구매</a></li>
												<li><a href="#">계정 판매</a></li>
											</ul></li>
									</ul>
								</nav>
							</div>
							<!-- Header-btn -->

							<div class="header-btn d-none f-right d-lg-block">
								<%String logId = (String) session.getAttribute("logId");
								if(logId == null){%> 
								<%} else { %>
								<%} %>
								<!-- 
								<a href="#" class="btn head-btn1">Register</a>
								 <a href="#" class="btn head-btn2">Login</a>
								 -->
								 <ul id="hiddenBtn">
								 <li class="float-left"><div id="myPage">
									<a href="#" class="btn head-btn1" id="hiddenPage">MyPage</a>
									<ul id="hiddenList" style="display:none;" >
										<li><a href="#" class="btn head-btn2">상품등록</a></li>
										<li><a href="#" class="btn head-btn2">나의 상점</a></li>
										<li><a href="#" class="btn head-btn2">내 정보</a></li>
									</ul>
								 </div> </li>
									<li class="float-left"><a href="#" class="btn head-btn2">Logout</a><li>
								 </ul>
							</div>
						</div>
					</div>
					<!-- Mobile Menu -->
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- search -->
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
	<!-- content -->
	
	
	<!-- footer -->
	<footer>
		<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>
	</footer>
</body>
<script>
let selectBox = document.querySelector("div.nice-select");
let ulList = document.querySelector("ul.list");
let divCenter = document.querySelector("div#center-location");
let searchBtn = divCenter.querySelector("button");

let hiddenBtn = document.querySelector("#hiddenBtn");
let hiddenPage = document.querySelector("#hiddenPage");
let hiddenList = document.querySelector("#hiddenList");
let myPage = document.querySelector("#myPage");
let floatLeft = document.querySelectorAll(".float-left");

document.querySelectorAll('a').forEach((a)=>{
	a.style.width = "170px"
	a.style.height = "54px"
	a.style.fontWeight = "bold"
})
divCenter.style.margin = "0 auto"
floatLeft.forEach((fl) => {
	fl.style.cssText = "float: left";
})
hiddenBtn.querySelectorAll("li a").forEach((a) => {
	a.style.cssText = 'width: 170px; height: 54px; font-size: 14px; font-weight: bold; line-height: 27px;';
})
hiddenPage.style.margin = "0 10px 0 0"
myPage.addEventListener('mouseover', function(e){
	hiddenList.style.cssText = "display: block";
	
})
myPage.addEventListener('mouseout', function(e){
	hiddenList.style.cssText = "display: none";
})


selectBox.addEventListener('click', function(e){
	selectBox.classList.toggle('open');
	ulList.querySelectorAll("li").forEach((li) =>{
		li.addEventListener('click', function(e){
			document.querySelector("span.current").innerText = li.innerText;
			document.querySelector('div#default-select select').value = e.target.dataset.value
		})
	})
})
	
searchBtn.addEventListener('click', function(e){
	console.log('화면 옮겨지기');
})	

</script>
</html>