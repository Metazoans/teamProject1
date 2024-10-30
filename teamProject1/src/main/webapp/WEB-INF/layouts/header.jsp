<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header Start -->
<div class="header-area header-transparrent">
	<div class="headder-top header-sticky">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-2">
					<!-- Logo -->
					<div class="logo">
						<a href="index.html"><img src="assets/img/logo/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="menu-wrapper">
						<!-- Main-menu -->
						<div class="main-menu">
							<nav class="d-none d-lg-block">
								<ul id="navigation">
									<li><a href="index.html">한글 테스트</a></li>
									<li><a href="job_listing.html">Find a Jobs </a></li>
									<li><a href="about.html">About</a></li>
									<li><a href="#">Page</a>
										<ul class="submenu">
											<li><a href="blog.html">Blog</a></li>
											<li><a href="single-blog.html">Blog Details</a></li>
											<li><a href="elements.html">Elements</a></li>
											<li><a href="job_details.html">job Details</a></li>
										</ul></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>
							</nav>
							<div class="single-element-widget mt-30">
								<div class="default-select" id="default-select""="">
									<select style="display: none;">
										<option value=" 1">English</option>
										<option value="2">Spanish</option>
										<option value="3">Arabic</option>
										<option value="4">Portuguise</option>
										<option value="5">Bengali</option>
									</select>
									
									<div class="nice-select" tabindex="0">
										<span class="current">Spanish</span>
										<ul class="list">
											<li data-value=" 1" class="option focus">English</li>
											<li data-value="1" class="option">Spanish</li>
											<li data-value="1" class="option">Arabic</li>
											<li data-value="1" class="option">Portuguise</li>
											<li data-value="1" class="option">Bengali</li>
										</ul>
									</div>
									 
								</div>
							</div>
							<input type="text" name="first_name" placeholder="검색어를 입력해주세요."
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '검색어를 입력해주세요.'" required=""
								class="single-input">
						</div>
						<!-- Header-btn -->
						<div class="header-btn d-none f-right d-lg-block">
							<a href="#" class="btn head-btn1">Register</a> <a href="#"
								class="btn head-btn2">Login</a>
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