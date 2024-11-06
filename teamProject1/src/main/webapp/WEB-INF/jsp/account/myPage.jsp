<%@page import="com.yedam.vo.BillsVO"%>
<%@page import="com.yedam.vo.MemberVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.card-header py-3 {
	background-color: #fb246a;
}

.content-box {
	position: relative;
	border: 5px solid #4993a0;
}

.content-box:after {
	content: '';
	position: absolute;
	left: 0;
	right: 0;
	margin: 0 auto;
	width: 0;
	height: 0;
	border-top: 15px solid #4993a0;
	border-left: 25px solid transparent;
	border-right: 25px solid transparent;
}

.hovertext {
	position: relative;
	border-bottom: 1px dotted black;
}

.hovertext:before {
	content: attr(data-hover);
	visibility: hidden;
	opacity: 0;
	width: max-content;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 5px;
	padding: 5px 5px;
	transition: opacity 1s ease-in-out;
	position: absolute;
	z-index: 1;
	left: 0;
	top: 110%;
}

.hovertext:hover:before {
	opacity: 1;
	visibility: visible;
}

#container {
	margin: 0 auto !important;
	width: 80% !important;
}

</style>
</head>
<body>
	<div id="container">
		<%
		List<MemberVO> list = (List<MemberVO>) request.getAttribute("memberList");
		List<BillsVO> sellList = (List<BillsVO>) request.getAttribute("sellList");
		List<BillsVO> purchaseList = (List<BillsVO>) request.getAttribute("purchaseList");

		System.out.println(list);
		%>
		<%
		for (MemberVO mvo : list) {
		%>
		<div class="row row-cols-1 row-cols-md-3 mb-3 text-center"
			style="margin-left: 2px; margin-right: 2px;">
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm"
					style="border-color: gray">
					<div class="card-header py-3" style="background: #fb246a;">
						<h4 class="my-0 fw-normal">등급</h4>
					</div>
					<div class="card-body" style="padding: 0;">
						<ul class="list-unstyled mt-3 mb-4">
							<li><%=mvo.getMemberName()%>님의 등급은</li>
						</ul>
						<h2 class="card-title pricing-card-title"><%=mvo.getGrade()%>등급
						</h2>
						<!-- <div onmouseover="$('#credit_condition').show();"
						onmouseout="$('#credit_condition').hide();">승급조건</div> -->
						<span class="hovertext"
							data-hover="
							거래건수 5건 :C등급
							거래건수 10건 :B등급
							거래건수 15건 :A등급
							거래건수 20건 :S등급">승급조건
						</span>
					</div>
				</div>
			</div>


			<div class="content-box" id="credit_condition"
				style="display: none; z-index: 2;">
				<span class="credit_up_silver">거래건수 5건 C등급.<br>거래건수 10건
					B등급<br>거래건수 15건 A급<br>거래건수 20건 S등급 
			</div>


			<form id="phonePrompt">
				<div class="col">
					<div class="card mb-4 rounded-3 shadow-sm"
						style="border-color: gray; width:250px ">
						<div class="card-header py-3 permission">
							<h4 class="my-0 fw-normal">인증상태</h4>
						</div>
						<div class="card-body" style="padding: 0;">
							<h3 class="card-title pricing-card-title" onclick="phonePrompt()">
								<input name="phone" id="phone_input" type="hidden" class="id" />
								<input name="member_id" id="id_input" type="hidden" class="id"
									value=<%=mvo.getMemberId()%>>
								<%
								if (mvo.getPhone() == null) {
								%>미인증
							</h3>
							<%
							} else {
							%>
							<p id="permission" >인증완료</p>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</form>


			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm"
					style="border-color: gray">
					<div class="card-header py-3">
						<h4 class="my-0 fw-normal">마일리지</h4>
					</div>
					<div class="card-body" style="padding: 0;">
						<ul class="list-unstyled mt-3 mb-4">
							<li><%=mvo.getMemberName()%>님의 사용가능 마일리지는</li>
						</ul>
						<h3 class="card-title pricing-card-title"><%=mvo.getMileage()%>원
						</h3>

						<button type="button" class="w-100 btn btn-lg btn-dark"
							data-bs-toggle="modal" data-bs-target="#mileageModal">충전
						</button>

					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>


		<div>
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3" style="background: #fb246a;">
						<a href="mySellList.do" style="color: black">최근구매내역</a>

					</div>
					<div class="card-body" style="padding: 0;">

						<%
						for (BillsVO bvo : purchaseList) {
						%>
						<div class="progress-table">
							<div class="table-head">
								<div class="serial">이미지</div>
								<div class="serial" style="width: 300px;">아이템 이름</div>
								<div class="serial">결제금액</div>
								<div class="serial">처리 경과</div>

							</div>
							<div class="table-row">
								<div class="serial">
								<%if(bvo.getImage()==null) {%>
								<p>이미지 없음</p>
								<%}else{ %>
									<img src="image/<%=bvo.getImage()%>" />
									<%}%>
								</div>
								<div class="serial" style="width: 300px;"><%=bvo.getItemName()%></div>
								<div class="serial"><%=bvo.getTotal()%></div>
								<div class="serial1"
									style="margin-left: 51px; margin-top: 12px;"><%=bvo.getPayStep()%></div>


							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>



			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3">
						<a href="mySellList.do#kanghyeon" style="color: black">판매내역</a>

					</div>
					<div class="card-body" style="padding: 0;">
						<%
						for (BillsVO bvo : sellList) {
						%>
						<div class="progress-table">
							<div class="table-head">
								<div class="serial">이미지</div>
								<div class="serial" style="width: 300px;">아이템 이름</div>
								<div class="serial">결제금액</div>
								<div class="serial">처리경과</div>

							</div>
							<div class="table-row">
								<div class="serial">
								<%if(bvo.getImage()==null) {%>
								<p>이미지 없음</p>
								<%}else{ %>
									<img src="image/<%=bvo.getImage()%>" />
								<%}%>
								</div>
								<div class="serial" style="width: 300px;"><%=bvo.getItemName()%></div>
								<div class="serial"><%=bvo.getTotal()%></div>
								<div class="serial1"
									style="margin-left: 51px; margin-top: 12px;"><%=bvo.getPayStep()%></div>


							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>







		<form action="grade.do" method="get">
			<%
			for (MemberVO mvo : list) {
			%>
			<input name="member_id" id="id_input" type="hidden" class="id"
				value=<%=mvo.getMemberId()%>>
			<%
			}
			%>
		</form>

		<!-- 마일리지 충전 Modal -->
		<form action="mileage.do" class="joinForm" method="get">

			<div class="modal fade" id="mileageModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">충전 금액</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<%
							for (MemberVO mvo : list) {
							%>
							<p><%=mvo.getMemberName()%></p>
							<input name="member_name" id="id_input" type="hidden" class="id"
								value=<%=mvo.getMemberName()%>>
							<p>
							<table class="table">
								<tbody>
									<tr>
										<td>
											<p>마일리지
											<p>
										</td>
										<td><input name="mileage" id="id_input" type="text"
											class="id" placeholder=<%=mvo.getMileage()%>>
											<p></td>
									</tr>

									<%
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-dark" href="loginForm.do">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
		</form>







		<!-- 회원정보 수정 Modal -->
		<form action="myPage.do" class="joinForm" method="get">
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">회원정보 수정</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<%
							for (MemberVO mvo : list) {
							%>
							<table class="table">
								<tbody>
									<tr>
										<td>
											<p>아이디
											<p>
										</td>
										<td><input name="member_id" id="id_input" type="text"
											class="id" value=<%=mvo.getMemberId()%>>
											<p></td>
									</tr>
									<tr>
										<td>
											<p>이름
											<p>
										</td>
										<td>
											<p><%=mvo.getMemberName()%></p> <input name="member_name"
											id="id_input" type="hidden" class="id"
											value=<%=mvo.getMemberName()%>>
											<p>
										</td>
									</tr>
									<tr>
										<td>
											<p>비밀번호
											<p>
										</td>
										<td><input name="password" id="id_input" type="text"
											class="pwd" value=<%=mvo.getPassword()%>>
											<p></td>
									</tr>
									<tr>
										<td>
											<p>생년월일
											<p>
										</td>
										<td>
											<p><%=mvo.getBirth().substring(0, 10)%>
											<p>
										</td>
									</tr>
									<tr>
										<td>
											<p>휴대폰번호
											<p>
										</td>
										<td>
											<p id="phoneNumber"><%=mvo.getPhone()%>
											<p>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-dark" src="logOut.do">수정</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<form action="myPage.do" class="joinForm" method="post">
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3">
						<p style="color: black">회원정보</p>

					</div>
					<div class="card-body" style="padding: 0;">
						<%
						for (MemberVO mvo : list) {
						%>

						<div class="progress-table">

							<div class="table-row">
								<div class="serial">아이디</div>
								<div class="country"><%=mvo.getMemberId()%></div>


							</div>
							<div class="table-row">
								<div class="serial">이름</div>
								<div class="country">
									<%=mvo.getMemberName()%></div>

							</div>
							<div class="table-row">
								<div class="serial">비밀번호</div>
								<div class="country">
									<%=mvo.getPassword()%></div>

							</div>
							<div class="table-row">
								<div class="serial">생년월일</div>
								<div class="country">
									<%=mvo.getBirth().substring(0, 10)%></div>

							</div>
							<div class="table-row">
								<div class="serial">휴대폰번호</div>
								<div class="country">
									<%=mvo.getPhone()%></div>

							</div>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
			<div style="padding-left: 13px;">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-dark" data-bs-toggle="modal"
					data-bs-target="#exampleModal">수정</button>
		</form>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-dark" data-bs-toggle="modal"
			data-bs-target="#deleteModal">회원탈퇴</button>
		<form action="memberDelete.do" class="joinForm" method="get">

			<%
			for (MemberVO mvo : list) {
			%>
			<!-- 회원탈퇴 Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<h3>정말 회원탈퇴 하시겠습니까</h3>
							<input name="member_name" id="id_input" type="hidden" class="id"
								value=<%=mvo.getMemberName()%>>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-dark" src="loginForm.do">회원탈퇴</button>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</form>

		<a href="#" style="position: fixed; bottom: 5px; right: 5px;"
			class="btn btn-dark">맨위로</a>



		<script>
			const paystep = document.querySelectorAll(".serial1")
			function phonePrompt() {
				var permissionText = document.getElementById("permission") ? document
						.getElementById("permission").innerText
						: 'a';

				if (permissionText === '인증완료') {

					alert('이미 인증된 번호입니다.');
					
					return;
				}
				const inputString = prompt('휴대폰 번호를 입력하세요');

				console.log(inputString);
				var phonePrompt = document.getElementById("phonePrompt");
				var phoneInput = document.getElementById("phone_input")
				phoneInput.value = inputString;
				phonePrompt.action = "phone.do";
				phonePrompt.submit();
				//document.addEventListener("DOMContentLoaded", phonePrompt);

			}
		</script>
		<script src="js/mypage.js"></script>

	</div>
</body>
</html>

