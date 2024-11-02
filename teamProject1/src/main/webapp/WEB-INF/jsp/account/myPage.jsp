<%@page import="com.yedam.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div {
	margin-bottom: 5px;
}
</style>

<div>
	<h3>회원목록</h3>




	<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("memberList");
	System.out.println(list);
	%>
	<%
	for (MemberVO mvo : list) {
	%>
	
	<div class="row">
	<div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-report"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">등급</a></h5>
                                <span><%=mvo.getMemberId()%>님<br>
						<%=mvo.getGrade()%>등급입니다.</span>
                            </div>
                        </div>
	
		<div class="col-lg-4 col-md-6">
			<div class="single-process text-center mb-30">
				<div class="process-ion">
					<span class="flaticon-search"></span>
				</div>
				<div class="process-cap">
					<h5>등급</h5>
					<p><%=mvo.getMemberId()%>님<br>
						<%=mvo.getGrade()%>등급입니다.
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="single-process text-center mb-30">
				<div class="process-ion">
					<span class="flaticon-curriculum-vitae"></span>
				</div>
				<div class="process-cap">
					<h5>인증상태</h5>
					<p>
						<%
						if (mvo.getPhone() == null) {
						%>
					
					<p>비인증상태</p>
					<%
					} else {
					%>
					<p>인증완료</p>
					<%
					}
					%>
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-6">
			<div class="single-process text-center mb-30">
				<div class="process-ion">
					<span class="flaticon-tour"></span>
				</div>
				<div class="process-cap">
					<h5>마일리지</h5>
					<p>
						현재마일리지
						<%=mvo.getMileage()%>
					</p>
				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>


<!-- Modal -->
       	<form action="myPageForm.do" class="joinForm" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
					<td><p>
					<%=mvo.getMemberName()%>
						<p></td>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
		</form>
	

	
	<form action="myPageForm.do" class="joinForm" method="post">
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
					<td>
						<p><%=mvo.getMemberId()%>
						<p></td>
				</tr>
				<tr>
					<td>
						<p>이름
						<p>
					</td>
					<td>
						<p><%=mvo.getMemberName()%>
						<p></td>
				</tr>
				<tr>
					<td>
						<p>비밀번호
						<p>
					</td>
					<td>
						<p><%=mvo.getPassword()%>
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
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  수정
</button>
	</form>


<div></div>

<script>
	
</script>

