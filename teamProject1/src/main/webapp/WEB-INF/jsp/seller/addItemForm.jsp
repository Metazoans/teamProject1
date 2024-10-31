<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
        alert("<%=msg %>");
        location.href = "itemList.do";
<% } %>
</script>
<form action="addItem.do" method="get" name="inputForm" onsubmit="return checkField();">
<%-- <input class="form-control" type="text" name="writer" value="${logId }"> --%>
<table class="table">
		<tr>
			<td colspan="3"><p>제목</p>
			<input class="form-control" type="text" name="itemName" placeholder="제목"></td>
		</tr>
		<tr>
			<td><p>게임명</p>
			<input class="form-control" type="text" name="game" placeholder="게임명"></td>
			<td><p>서버</p>
			<input class="form-control" type="text" name="servers" placeholder="서버"></td>
			<td><p>카테고리</p>
			<input class="form-control" type="text" name="categories" placeholder="카테고리"></td>
		</tr>
		<tr>
			<td colspan="3">
			<p>상품설명</p>
			<textarea class="form-control" id="exampleFormControlTextarea1" name="itemInfo" rows="3" cols="30" ></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3"><p>이미지</p>
			<input type="file" name="image" class="form-control"></td>
		</tr>
		<tr>
			<td><p>상품금액</p>
			<input class="form-control" type="text" name="price" placeholder="상품금액"></td>
			<td><p>상품수량</p>
			<input class="form-control" type="text" name="count" placeholder="상품수량(상품금액단위)"></td>
			<td><p>판매/구매</p>
			<input class="form-control" type="text" name="trade" placeholder="판매/구매"></td>
			<td colspan="2" align="center">
				<input  class="btn btn-success" type="submit" value="상품등록" >
				<input class="btn btn-warning" type="button" value="취소" onclick="location.href='itemList.do'">
			</td>
		</tr>
	</table>
</form>

<script>


	function checkField(){
		let inputs = document.inputForm;
		if(!inputs.itemName.value){	
			alert("제목을 입력하세요.");
			return false;
		}
		if(!inputs.game.value){	
			alert("게임을 입력하세요.");
			return false;
		}
		if(!inputs.categories.value){
			alert("카테고리를 입력하세요.");
			return false;
		}
		if(!inputs.price.value){
			alert("상품금액을 입력하세요");
			return false;
		}
		if(!inputs.count.value){
			alert("상품수량을 입력하세요");
			return false;
		}
		if(!inputs.trade.value){
			alert("상품수량을 입력하세요");
		}
	}
	
	
</script>


<!-- <div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="게임명" aria-label="Username">
  <select class="form-select" aria-label="Default select example">
  <option selected>서버</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
  <select class="form-select" aria-label="Default select example">
  <option selected>카테고리</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
</div>

  <span class="input-group-text">상품설명</span>
<div class="input-group">
  <textarea class="form-control" aria-label="With textarea"></textarea>
</div>

<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
  <input type="text" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
  <input type="button" class="form-control" placeholder="제목" aria-label="Username" aria-describedby="basic-addon1">
</div>



<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Username" aria-label="Username">
  <span class="input-group-text">@</span>
  <input type="text" class="form-control" placeholder="Server" aria-label="Server">
</div> -->

	

</body>
</html>