<%@page import="com.yedam.common.PageDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.yedam.vo.ItemVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/buyer.css">
<style>
#container{
	padding-top: 50px;
	margin: 0 auto;
	width: 80%;	
	padding-bottom: 50px;
}
.table th{
	padding: 0.5rem;
}
.table td{
	vertical-align: middle;
}
.table{
	text-align: center;
}
.table-name1 {
    display: block;
    width: 100%;
    text-align: center;
    margin: 0 auto;
    font-size: 20px;
    font-weight: bold;
    background: #fb246a;
    color: #fff;
    text-transform: capitalize;
    letter-spacing: 1px;
    line-height: 0;
    padding: 27px 44px;
    border-radius: 0px;
    position: relative;
    z-index: -1;
    border: 0;
    overflow: hidden;
}
.pagination {
    display: flex;
    justify-content: center;
    padding-top: 20px;
}
.pagination li {
    display: inline-block;
    margin: 0 5px;
}
.pagination li a {
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #ddd;
    color: #000;
}
.pagination li a:hover {
    background-color: #ddd;
}
.pagination li.active a {
    background-color: #fb246a;
    color: white;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		PageDTO pdto = (PageDTO)request.getAttribute("page");
		PageDTO bdto = (PageDTO)request.getAttribute("bpage");
		List<ItemVO> SellListPage = (List<ItemVO>)request.getAttribute("SellListPage");
		List<ItemVO> BuyListPage = (List<ItemVO>)request.getAttribute("BuyListPage");
	%>


<div id="container">
<h3 class="table-name1">판매리스트</h3>
<div class="progress-table">
<table class="table">
  <thead>
    <tr>
      <th scope="col">이미지</th>
      <th scope="col">아이템이름</th>
      <th scope="col">상품수량</th>
      <th scope="col">판매금액</th>
      <th scope="col">판매/구매</th>
      <th scope="col">등록시간</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <%
  	for(ItemVO vo : SellListPage){
  %>
  <tbody>
    <tr>
      <td class="image">
      <%if(vo.getImage() == null){ %>
      	<img src="images/KakaoTalk_20241107_123234216.png" width="100px">
      <%}else{ %>
      	<img src="images/<%=vo.getImage() %>" width="100px">
	  <%} %>
      </td>
      <td><%=vo.getItemName() %></td>
      <td><%=vo.getCount() %></td>
      <td><%=vo.getPrice() %></td>
      <td class="trade"><%=vo.getTrade() %></td>
      <td><%=sdf.format(vo.getUpDate()) %></td>
      <form method="post" id="myListModify">
		<td><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn head-btn2" id="updateBtn" 
		data-bs-whatever="@fat" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=vo.getItemNumber()%>','<%=vo.getItemName()%>', 
		'<%=vo.getItemInfo()%>', '<%=vo.getCount()%>', '<%=vo.getPrice()%>', '<%=vo.getImage()%>'); info('<%=vo.getItemInfo()%>');">수정</button></td>
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
<div class="pagination-area pb-115 text-center">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    
    <!-- 이전 페이지 여부 -->
    <c:choose>
      <c:when test="${page.prev}">
        <li class="page-item">
          <a class="page-link" href="mySellList.do?page=${page.startPage - 1}">&lt;</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled">
          <a class="page-link" href="#">&lt;</a>
        </li>
      </c:otherwise>
    </c:choose>

    <!-- 페이지 번호 출력 -->
    <c:forEach var="p" begin="${page.startPage}" end="${page.endPage}" step="1">
      <c:choose>
        <c:when test="${page.page == p}">
          <li class="page-item active" aria-current="page">
            <span class="page-link">${p}</span>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="mySellList.do?page=${p}">${p}</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- 다음 페이지 여부 -->
    <c:choose>
      <c:when test="${page.next}">
        <li class="page-item">
          <a class="page-link" href="mySellList.do?page=${page.endPage + 1}">&gt;</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled">
          <a class="page-link" href="#">&gt;</a>
        </li>
      </c:otherwise>
    </c:choose>

  </ul>
</nav>

</div>

<hr>

<h3 class="table-name1">구매리스트</h3>
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
      <th></th>
      <th></th>
    </tr>
  </thead>
  <%
  	for(ItemVO bvo : BuyListPage){
  %>
  <tbody>
    <tr>
      <td class="image">
      <%if(bvo.getImage() == null){ %>
      	<img src="images/KakaoTalk_20241107_123234216.png" width="100px">
      <%}else{ %>
      	<img src="images/<%=bvo.getImage() %>" width="100px">
	  <%} %>
      </td>
      <td><%=bvo.getItemName() %></td>
      <td><%=bvo.getCount() %></td>
      <td><%=bvo.getPrice() %></td>
      <td class="trade"><%=bvo.getTrade() %></td>
      <td><%=sdf.format(bvo.getUpDate()) %></td>
      <form method="post" id="myListModify">
		<td><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn head-btn2" id="updateBtn" 
		data-bs-whatever="@fat" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="Modal('<%=bvo.getItemNumber()%>','<%=bvo.getItemName()%>', 
		'<%=bvo.getItemInfo()%>', '<%=bvo.getCount()%>', '<%=bvo.getPrice()%>', '<%=bvo.getImage()%>'); info('<%=bvo.getItemInfo()%>');">수정</button></td>
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
	
<div class="pagination-area pb-115 text-center">
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <!-- 이전 페이지 여부 -->
      <c:choose>
        <c:when test="${bpage.prev}">
          <li class="page-item">
            <a class="page-link" href="mySellList.do?bpage=${bpage.startPage - 1}">&lt;</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item disabled">
            <a class="page-link" href="#">&lt;</a>
          </li>
        </c:otherwise>
      </c:choose>

      <!-- 페이지 번호 출력 -->
      <c:forEach var="p" begin="${bpage.startPage}" end="${bpage.endPage}" step="1">
        <c:choose>
          <c:when test="${bpage.page == p}">
            <li class="page-item active" aria-current="page">
              <span class="page-link">${p}</span>
            </li>
          </c:when>
          <c:otherwise>
            <li class="page-item">
              <a class="page-link" href="mySellList.do?bpage=${p}">${p}</a>
            </li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <!-- 다음 페이지 여부 -->
      <c:choose>
        <c:when test="${bpage.next}">
          <li class="page-item">
            <a class="page-link" href="mySellList.do?bpage=${bpage.endPage + 1}">&gt;</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item disabled">
            <a class="page-link" href="#">&gt;</a>
          </li>
        </c:otherwise>
      </c:choose>

    </ul>
  </nav>
  </div>


</div>



	
<!-- modal -->
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
						<input type="hidden" id="modalItemNumber" name="itemNum" value="" >
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
		
		
	
		function Modal(itemNumber, itemName, itemInfo, count, price) {
			if(itemInfo == null){
				document.getElementById("modalItemInfo").value = itemInfo;
			}else{
				document.getElementById("modalItemInfo").value = "";
				document.getElementById("modalItemInfo").placeholder = "상세내용없음";
			}
			document.getElementById("modalItemNumber").value = itemNumber;
			document.getElementById("modalItemName").value = itemName;
			document.getElementById("modalCount").value = count;
			document.getElementById("modalPrice").value = price;
		}
		
		window.onload=function(){
			var traeSell = document.querySelectorAll(".trade");
			traeSell.forEach((td) => {
		         if(td.innerText == 'sell'){
		        	 td.innerText = '판매';
		         }else{
		        	 td.innerText = '구매';
		         }
		      })
		 }
		
		
		 
	
		
	</script>

</body>
</html>