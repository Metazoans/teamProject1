<%@page import="com.yedam.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("memberList");
	System.out.println(list);
	%>
	<%
	for (MemberVO mvo : list) {
	%>
	<div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm">
				<div class="card-header py-3">
					<h4 class="my-0 fw-normal">등급</h4>
				</div>
				<div class="card-body">
					<ul class="list-unstyled mt-3 mb-4">
						<li><%=mvo.getMemberId()%>님</li>
					</ul>
					<h2 class="card-title pricing-card-title"><%=mvo.getGrade()%>등급
					</h2>

				</div>
			</div>
		</div>
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm">
				<div class="card-header py-3">
					<h4 class="my-0 fw-normal">인증상태</h4>
				</div>
				<div class="card-body">
					<h3 class="card-title pricing-card-title">인증완료</h3>

				</div>
			</div>
		</div>
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm border-primary">
				<div class="card-header py-3 text-bg-primary border-primary">
					<h4 class="my-0 fw-normal">마일리지</h4>
				</div>
				<div class="card-body">
					<h3 class="card-title pricing-card-title"><%=mvo.getMileage()%></h3>
					<ul class="list-unstyled mt-3 mb-4">
						<li>30 users included</li>
						<li>15 GB of storage</li>
						<li>Phone and email support</li>
						<li>Help center access</li>
					</ul>
					<button type="button" class="w-100 btn btn-lg btn-primary"
						data-bs-toggle="modal" data-bs-target="#mileageModal">충전
					</button>

				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>


	<%
	for (MemberVO mvo : list) {
	%>
	<div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm">
				<div class="card-header py-3">
					<a href="job_listing.html" style="color: black">구매내역</a>

				</div>
				<div class="card-body">
					<ul class="list-unstyled mt-3 mb-4">
						<li></li>
					</ul>


				</div>
			</div>
		</div>
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm">
				<div class="card-header py-3">
					<a href="job_listing.html" style="color: black">판매내역</a>

				</div>
				<div class="card-body">
				</div>
			</div>
		</div>


	</div>

	<%
	}
	%>




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
						<button type="submit" class="btn btn-primary" src="loginForm.do">Save
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
						<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h1>
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
										class="id" placeholder=<%=mvo.getMemberId()%>>
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
										class="pwd" placeholder=<%=mvo.getPassword()%>>
										<p></td>
								</tr>
								<tr>
									<td>
										<p>생년월일
										<p>
									</td>
									<td>
										<p><%=mvo.getBirth()%>
										<p>
									</td>
								</tr>
								<tr>
									<td>
										<p>휴대폰번호
										<p>
									</td>
									<td>
										<p><%=mvo.getPhone()%>
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
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" src="logOut.do">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<form action="myPage.do" class="joinForm" method="get">
		<%
		for (MemberVO mvo : list) {
		%>

		<h3 class="mb-30">회원정보</h3>
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
					<%=mvo.getBirth()%></div>

			</div>
			<div class="table-row">
				<div class="serial">휴대폰번호</div>
				<div class="country">
					<%=mvo.getPhone()%></div>

			</div>

		</div>


		<%
		}
		%>
		<div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">수정</button>
	</form>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#deleteModal">회원탈퇴</button>
	<form action="memberDelete.do" class="joinForm" method="get">
		<%
		for (MemberVO mvo : list) {
		%>
		</div>
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
						<button type="submit" class="btn btn-primary" src="loginForm.do">회원탈퇴</button>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</form>




</body>
</html>

