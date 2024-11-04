<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
												<li><a href="#">게임머니 구매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
												<li><a href="#">게임머니 판매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
											</ul></li>
										<li><a href="#">아이템</a>
											<ul class="submenu">
												<li><a href="#">아이템 구매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
												<li><a href="#">아이템 판매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
											</ul></li>
										<li><a href="#">계정</a>
											<ul class="submenu">
												<li><a href="#">계정 구매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
												<li><a href="#">계정 판매</a>
													<div class="gamemenu">
														<ul>
															<!-- 게임리스트 -->
														</ul>
													</div></li>
											</ul></li>
									</ul>
								</nav>
							</div>
							<!-- Header-btn -->
							<div class="header-btn d-none f-right d-lg-block">
								<%String logId = (String) session.getAttribute("logId");
								if(logId == null){%> 
								<a href="memberAddForm.do" class="btn head-btn1">Register</a>
								 <a href="loginForm.do" class="btn head-btn2">Login</a>
								<%} else { %>
								 <ul id="hiddenBtn">
								 <li class="float-left"><div id="myPage">
									<a href="#" class="btn head-btn1" id="hiddenPage">MyPage</a>
									<ul id="hiddenList" style="display:none;" >
										<li><a href="#" class="btn head-btn2">상품등록</a></li>
										<li><a href="#" class="btn head-btn2">나의 상점</a></li>
										<li><a href="myPageForm.do" class="btn head-btn2">내 정보</a></li>
									</ul>
								 </div> </li>
									<li class="float-left"><a href="logOut.do" class="btn head-btn2">Logout</a><li>
								 </ul>
								<%} %>
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

<!-- Header End -->

