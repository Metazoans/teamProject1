<%@page import="com.yedam.vo.ItemVO"%>
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
		List<ItemVO> list = (List<ItemVO>) request.getAttribute("mySellList");
	%>

	<%
	for (ItemVO ivo : list) {
	%>

	<div class="progress-table">
		<div class="table-head">
			<div class="serial">이미지</div>
			<div class="serial">아이템 이름</div>
			<div class="serial">상품수량</div>
			<div class="serial">판매금액(수량1개당가격)</div>
			<div class="serial">등록시간</div>
		</div>
		<form method="post">
			<div class="table-row">
				<div class="serial"><%=ivo.getImage()%></div>
				<div class="serial"><%=ivo.getItemName()%></div>
				<div class="serial"><%=ivo.getCount()%></div>
				<div class="serial"><%=ivo.getPrice()%></div>
				<div class="serial"><%=ivo.getUpDate()%></div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="<%=ivo.getItemNumber() %>" id="flexCheckDefault" name="itemNum">
					<label class="form-check-label" for="flexCheckDefault"> Default checkbox </label>
				</div>
			</div>
	</div>
	
	<%
	}
	%>
	<button type="button" class="btn btn head-btn2" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@fat">수정</button>
	<button type="submit" class="btn btn head-btn1" formaction="myItemDelete.do">삭제</button>
	</form>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">변경할 항목을 입력하세요</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="myItemUpdate.do" method="post">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">아이템이름</label>
            <input type="text" class="form-control" id="recipient-name" name="itemName" >
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">아이템상세정보</label>
            <input type="text" class="form-control" id="recipient-name" name="itemInfo">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">상품수량</label>
            <input type="text" class="form-control" id="recipient-name" name="count" >
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">판매금액(수량당1개가격)</label>
            <input type="text" class="form-control" id="recipient-name" name="price" >
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn head-btn2">저장</button>
        <button type="button" class="btn btn head-btn1" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>