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
	String logId = (String) session.getAttribute("logId");
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
        alert("<%=msg %>");
        location.href = "itemList.do";
<% } %>
</script>
<div id="container">
<form action="addItem.do" method="post" onsubmit="return checkField();" enctype="multipart/form-data">
<%-- <input class="form-control" type="text" name="writer" value="${logId }"> --%>
<table class="table">
		<input type="hidden" name="logId" value="${logId}">
		<tr>
			<td colspan="3"><p>제목</p>
			<input class="form-control" type="text" name="itemName" placeholder="제목" id="itemName"></td>
		</tr>
		<tr>
			<td><p>게임명</p>
			<select class="form-select" aria-label="Default select example" onchange="categoryChange(this)" name="game" id="game"> 
  				<option selected>게임선택</option>
  				<option value="메이플스토리">메이플스토리</option>
 				<option value="던전엔파이터">던전엔파이터</option>
  				<option value="서든어택">서든어택</option>
			</select></td>
			<td><p>서버</p>
			<select class="form-select" aria-label="Default select example" id="server" name="servers" id="servers">
				<option>서버선택</option>
			</select></td>
			<td><p>카테고리</p>
			<select class="form-select" aria-label="Default select example" name="categories" id="categories">
				<option value="게임머니">게임머니</option>
				<option value="아이템">아이템</option>
			</select></td>
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
			<input class="form-control" type="text" name="price" placeholder="상품금액" id="price"></td>
			<td><p>상품수량</p>
			<input class="form-control" type="text" name="count" placeholder="상품수량(상품금액단위)" id="count"></td>
			<td><p>판매/구매</p>
			<select class="form-select" aria-label="Default select example" name="trade" id="trade">
				<option value="sell">판매</option>
				<option value="buy">구매</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input  class="btn btn-success" type="submit" value="상품등록" >
				<input class="btn btn-warning" type="button" value="취소" onclick="location.href='itemList.do'">
			</td>
		</tr>
	</table>





</form>
</div>
<script>

	function categoryChange(e){
		var sMstory = ["루나","스카니아","엘리시움","크로아","오로라","베라","레드","유니온","제니스","이노시스","아케인","노바"];
		var sDnf = ["카인","디레지에","시로코","프레이","카시아스","힐더","안톤","바칼"];
		var target = document.getElementById("server");
		
		if(e.value == "메이플스토리") var d = sMstory;
		else if(e.value == "던전엔파이터") var d = sDnf;
		
		target.options.length = 0;

		
		for(x in d){
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
		
	}

	function checkField(){
		let itemName = document.getElementById("itemName");
		let game = document.getElementById("game");
		let price = document.getElementById("price");
		let count = document.getElementById("count");

		if (!itemName.value) { 
	        alert("제목을 입력하세요.");
	        itemName.focus();
	        return false;
	    }
	    if (game.value === "게임선택") { 
	        alert("게임을 선택하세요.");
	        game.focus();
	        return false;
	    }
	    if (!price.value) { 
	        alert("상품금액을 입력하세요.");
	        price.focus();
	        return false;
	    }
	    if (!count.value) { 
	        alert("상품수량을 입력하세요.");
	        count.focus();
	        return false;
	    }
		return true;
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