<%@page import="com.yedam.vo.BillsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#container{
	padding-top: 50px;
	margin: 0 auto;
	width: 80%;	
	padding-bottom: 50px;
}

</style>

</head>
<body>
	<div id="container">
	<%
		List<BillsVO> list = (List<BillsVO>)request.getAttribute("sellerHistory");
	%>
	
	<%
		for(BillsVO bvo : list){
	%>
	<div class="progress-table">
		<div class="table-head">
			<div class="serial">이미지</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">상품수량</div>
			<div class="serial">총금액</div>
			<div class="serial">처리상태</div>
		</div>
		<div class="table-row">
			<div class="serial"><img src="images/<%=bvo.getImage() %>"></div>
			<div class="serial"><%=bvo.getItemName() %></div>
			<div class="serial"><%=bvo.getCount() %></div>
			<div class="serial"><%=bvo.getTotal() %></div>
			<div class="serial" id="PayStep"><%=bvo.getPayStep() %></div>
			<div class="serial">
  			<form method="post" action="payStepUpdate.do">
  				<input type="hidden" name="itemNum" value="<%=bvo.getItemNumber()%>">
  				<button type="submit" class="btn head-btn1" onclick="return confirm('아이템을 전송하시겠습니까?')">아이템전송확인</button>
			</form>
			</div>
			<div class="serial">
			<form method="post" action="payStepDelete.do">
				<input type="hidden" name="itemNum" value="<%=bvo.getItemNumber()%>">
	  			<button type="submit" class="btn head-btn1" onclick="return confirm('거래를 취소하시겠습니까?')">거래취소</button>
			</form>
			</div>
			<div class="serial">
  			<button type="button" class="btn head-btn1" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=bvo.getBuyer()%>');">채팅창가기</button>
			</div>
			</div>			
		</div>
	
	
	<% } %>
 </div><!-- main div -->

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">거래처리</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      	<input type="hidden" id="modalBuyer" name="buyer" value="">
	        <span>거래처리를 완료하시겠습니까??</span>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" formaction="payStepUpdate.do">완료</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	</form>
	
<script>
	function Modal(buyer) {
		console.log(buyer);
		document.getElementById("modalBuyer").value = buyer;
	}
	
	window.onload = function() {
	    let pSteps = document.querySelectorAll(".serial");

	    pSteps.forEach(function(pStep) {
	        if (pStep.innerText === "processing") {
	            pStep.innerText = '처리중';
	        }
	  })
	}
	
</script>
	
</body>
</html>