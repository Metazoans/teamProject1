<%@page import="com.yedam.vo.BillsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List<BillsVO> list = (List<BillsVO>)request.getAttribute("sellerHistory");
	%>
	
	<%
		for(BillsVO bvo : list){
	%>
	<form action="post">
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
			<div class="serial1" id="PayStep"><%=bvo.getPayStep() %></div>
  			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=bvo.getItemNumber()%>');">아이템전송확인</button>
  			<button type="button" class="btn btn-primary" formaction="payStepDelete.do");">거래취소</button>
  			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal2('<%=bvo.getBuyer()%>');">아이템전송확인</button>
			</div>			
		</div>
	</div>
	
	<% } %>


	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">거래처리</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      	<input type="hidden" id="modalItemNumber" name="itemNum" value="">
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
	function Modal(itemNumber) {
		document.getElementById("modalItemNumber").value = itemNumber;
	}
	
</script>
	
</body>
</html>