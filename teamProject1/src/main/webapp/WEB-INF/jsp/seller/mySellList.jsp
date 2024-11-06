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
/* .progress-table{
	margin-bottom: 20px;
} */
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
	List<ItemVO> listBuy = (List<ItemVO>) request.getAttribute("myBuyList");
	%>

<div id="container">
	
<div class="progress-table">
<table class="table" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">이미지</th>
      <th scope="col">아이템이름</th>
      <th scope="col">상품수량</th>
      <th scope="col">판매금액</th>
      <th scope="col">판매/구매</th>
      <th scope="col">등록시간</th>
    </tr>
  </thead>
  <%
  	for(ItemVO vo : list){
  %>
  <tbody>
    <tr>
      <td>
      	<img src="images/<%=vo.getImage() %>" width="100px">
      </td>
      <td><%=vo.getItemName() %></td>
      <td><%=vo.getCount() %></td>
      <td><%=vo.getPrice() %></td>
      <td><%=vo.getTrade() %></td>
      <td><%=vo.getUpDate() %></td>
      <form method="post" id="myListModify">
		<td><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn head-btn2" id="updateBtn" 
		data-bs-whatever="@fat" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=vo.getItemNumber()%>','<%=vo.getItemName()%>', 
		'<%=vo.getItemInfo()%>', '<%=vo.getCount()%>', '<%=vo.getPrice()%>', '<%=vo.getImage()%>');">수정</button></td>
		</form>
		<td>
		<form method="post" action="myItemDelete.do">
		<input type="hidden" name="itemNum" value="<%=vo.getItemNumber()%>">
		<button type="submit" class="btn btn head-btn1" id="deleteBtn">삭제</button>
		</form>
		</td>
    </tr>
  </tbody>
  <% } %>
</table>
</div>

<hr>

<div class="progress-table" id="kanghyeon">
<table class="table" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">이미지</th>
      <th scope="col">아이템이름</th>
      <th scope="col">상품수량</th>
      <th scope="col">판매금액</th>
      <th scope="col">판매/구매</th>
      <th scope="col">등록시간</th>
    </tr>
  </thead>
  <%
  	for(ItemVO bvo : listBuy){
  %>
  <tbody>
    <tr>
      <td>
      	<img src="images/<%=bvo.getImage() %>" width="100px">
      </td>
      <td><%=bvo.getItemName() %></td>
      <td><%=bvo.getCount() %></td>
      <td><%=bvo.getPrice() %></td>
      <td><%=bvo.getTrade() %></td>
      <td><%=bvo.getUpDate() %></td>
      <form method="post" id="myListModify">
		<td><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn head-btn2" id="updateBtn" 
		data-bs-whatever="@fat" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=bvo.getItemNumber()%>','<%=bvo.getItemName()%>', 
		'<%=bvo.getItemInfo()%>', '<%=bvo.getCount()%>', '<%=bvo.getPrice()%>', '<%=bvo.getImage()%>');">수정</button></td>
		</form>
		<td>
		<form method="post" action="myItemDelete.do">
		<input type="hidden" name="itemNum" value="<%=bvo.getItemNumber()%>">
		<button type="submit" class="btn btn head-btn1" id="deleteBtn">삭제</button>
		</form>
		</td>
    </tr>
  </tbody>
  <% } %>
</table>
</div>
	
	
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
			
			console.log(itemNumber)
		}
		
	</script>

</body>
</html>