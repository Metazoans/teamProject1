<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="addItem.do" method="post" enctype="multipart/form-data">
<%-- <input class="form-control" type="text" name="writer" value="${logId }"> --%>
<table class="table">
		<tr>
			<td colspan="3"> 제목
			<input class="form-control" type="text" name="itemName" placeholder="제목"></td>
		</tr>
		<tr>
			<td>게임명
			<input class="form-control" type="text" name="game" placeholder="게임명"></td>
			<td>서버
			<input class="form-control" type="text" name="servers" placeholder="서버"></td>
			<td>카테고리
			<input class="form-control" type="text" name="categories" placeholder="카테고리"></td>
		</tr>
		<tr>
			<td colspan="3">
			상품설명
			<textarea class="form-control" id="exampleFormControlTextarea1" name="itemInfo" rows="3" cols="30" ></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3">이미지
			<input type="file" name="image" class="form-control"></td>
		</tr>
		<tr>
			<td>상품금액
			<input class="form-control" type="text" name="price" placeholder="상품금액"></td>
			<td>상품수량
			<input class="form-control" type="text" name="count" placeholder="상품수량(상품금액단위)"></td>
			<td colspan="2" align="center">
				<input  class="btn btn-success" type="submit" value="상품등록">
				<input class="btn btn-warning" type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

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