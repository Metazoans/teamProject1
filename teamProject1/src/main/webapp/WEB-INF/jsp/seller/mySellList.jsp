<%@page import="com.yedam.vo.ItemVO"%>
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
	<script>
		<%
			String msg = (String)request.getAttribute("msg");
			if(msg != null){	
		%>
			alert(msg);
		<% } %>
	</script>

	<%
	List<ItemVO> list = (List<ItemVO>) request.getAttribute("mySellList");
	%>

	<%
	for (ItemVO ivo : list) {
	%>
<div class="main">
<div class="section-top-border">
	<div class="progress-table">
		<div class="table-head">
			<div class="serial">이미지</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">상품수량</div>
			<div class="serial">판매금액(수량1개당가격)</div>
			<div class="serial">등록시간</div>
		</div>
		<form method="post" id="myListModify">
			<div class="table-row">
				<div class="serial"><img src="images/<%=ivo.getImage() %>" width="100px"></div>
				<div class="serial"><%=ivo.getItemName()%></div>
				<div class="serial"><%=ivo.getCount()%></div>
				<div class="serial"><%=ivo.getPrice()%></div>
				<div class="serial"><%=ivo.getUpDate()%></div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" value="<%=ivo.getItemNumber()%>" id="inlineCheckbox2" name="itemNum"
					onclick="Modal('<%=ivo.getItemNumber()%>','<%=ivo.getItemName()%>', '<%=ivo.getItemInfo()%>', '<%=ivo.getCount()%>', '<%=ivo.getPrice()%>', '<%=ivo.getImage()%>');" >
					<label class="form-check-label" for="inlineCheckbox2"></label>
				</div>
			</div>
	<%
	}
	%>
		</div>
	</div>
</div>

	<button type="button" class="btn btn head-btn2" id="updateBtn" data-bs-whatever="@fat" onClick="return check(1);">수정</button>
	<button type="button" class="btn btn head-btn1" id="deleteBtn" onClick="return check(2);">삭제</button>
	</form>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">변경할 항목을
						입력하세요</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="myItemUpdate.do" method="post" enctype="multipart/form-data" id="test">
						<input type="hidden" id="modalItemNumber" name="itemNum" value="">
						<div class="mb-3">
							<label for="modalItemName" class="col-form-label">아이템이름</label> <input
								type="text" class="form-control" id="modalItemName"
								name="itemName" placeholder="">
						</div>
						<div class="mb-3">
							<label for="modalItemInfo" class="col-form-label">아이템상세정보</label>
							<input type="text" class="form-control" id="modalItemInfo"
								name="itemInfo" placeholder="">
						</div>
						<div class="mb-3">
							<label for="modalCount" class="col-form-label">상품수량</label> <input
								type="text" class="form-control" id="modalCount" name="count"
								placeholder="">
						</div>
						<div class="mb-3">
							<label for="modalPrice" class="col-form-label">판매금액(수량당1개가격)</label>
							<input type="text" class="form-control" id="modalPrice"
								name="price" placeholder="">
						</div>
						<div class="mb-3">
							<label for="modalImage" class="col-form-label">이미지</label>
							<input type="file" name="image" class="form-control" id="modalImage"> 
						</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn head-btn2">저장</button>
					<button type="button" class="btn btn head-btn1"
						data-bs-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	


	<script>
	
		function Modal(itemNumber, itemName, itemInfo, count, price, image) {
			document.getElementById("modalItemNumber").value = itemNumber;
			document.getElementById("modalItemName").value = itemName;
			document.getElementById("modalItemInfo").value = itemInfo;
			document.getElementById("modalCount").value = count;
			document.getElementById("modalPrice").value = price;
			document.getElementById("modalImage").value = image;
		}
		
		
		function check(a){
			var arrSelect = document.getElementsByName("itemNum");
			var ck;
			var count = 0;
			for(var i = 0; i < arrSelect.length; i++){
				if(arrSelect[i].checked){
					ck = arrSelect[i].checked;
					count++;
				}
			}
			if(count > 1){
				alert("하나의 항목만 선택하세요");
				return null;
			}
			
			if(a==1 && ck==true){
				 const model = new bootstrap.Modal("#exampleModal");
				 model.show();
				}else if(a==2 && ck==true){
					var test = document.getElementById("myListModify");
					test.action ="myItemDelete.do";
					test.submit();
				}else{
				 alert("하나의 항목을 선택하세요");
				}
		}
		
	</script>

</body>
</html>