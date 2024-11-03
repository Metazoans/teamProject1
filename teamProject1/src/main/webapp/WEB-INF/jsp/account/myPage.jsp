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






	<div class="row d-flex justify-contnet-center">
	<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("memberList");
	System.out.println(list);
	%>
	<%
	for (MemberVO mvo : list) {
	%>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">등급</a></h5>
                                <span><%=mvo.getMemberId()%>님<br>
						<%=mvo.getGrade()%>등급입니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-cms"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">인증상태</a></h5>
                                <span>						<%
						if (mvo.getPhone() == null) {
						%>
					
					<p>비인증상태</p>
					<%
					} else {
					%>
					<p>인증완료</p>
					<%
					}
					%></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-report"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">마일리지</a></h5>
                                <span><%=mvo.getMileage()%></span><br>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mileageModal">
  								충전
								</button>
                            </div>
                        </div>
                    </div>        
                       	<%
	}
	%>          
      </div>
      
   
      
      <div class="row d-flex justify-contnet-center">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="#">구매목록</a></h5>
                                <span>(653)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-cms"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="#">판매목록</a></h5>
                                <span>(658)</span>
                            </div>
                        </div>
                    </div>
               
      </div>
                    

<!-- Modal -->
       	<form action="mileage.do" class="joinForm" method="get">
       	
<div class="modal fade" id="mileageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">충전 금액</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%
	for (MemberVO mvo : list) {
	%>
	<p><%=mvo.getMemberName()%></p>
					<input name="member_name" id="id_input" type="hidden"
						class="id" value=<%=mvo.getMemberName()%>>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" src="myPageForm.do">Save changes</button>
      </div>
    </div>
  </div>
</div>
		</form>
	
<!-- Modal -->
       	<form action="myPage.do" class="joinForm" method="get">
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
					<td>
					<p><%=mvo.getMemberName()%></p>
					<input name="member_name" id="id_input" type="hidden"
						class="id" value=<%=mvo.getMemberName()%>>
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
        <button type="submit" class="btn btn-primary" src="myPageForm.do">Save changes</button>
      </div>
    </div>
  </div>
</div>
		</form>
	
	<form action="myPage.do" class="joinForm" method="get">
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

