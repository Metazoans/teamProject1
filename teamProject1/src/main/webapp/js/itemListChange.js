/**
 *
 */

/*
<!-- 리스트 내용 (제목/가격/판매자/작성일) -->
<div class="progress-table-wrap">
	<div class="progress-table itemList">

		<div class="table-head">
			<div class="listTitle" data-value="item_name">제목</div>
			<div class="listPrice" data-value="price">가격</div>
			<div class="listSeller" data-value="seller">판매자</div>
			<div class="listDate" data-value="up_date">작성일</div>
		</div>

		<c:forEach var="item" items="${itemList }">
			<div class="table-row">
				<div class="listTitle">
					<img src="assets/img/elements/f1.jpg" alt="flag">${item.itemName }
				</div>
				<div class="listPrice">${item.price }</div>
				<div class="listSeller">${item.seller }</div>
				<div class="listDate">${item.upDate }</div>
			</div>
		</c:forEach>


	</div>
</div>
*/

console.log('itemList.js start');

//목록 정렬
document.querySelectorAll('.table-head div').forEach(div => {
	div.addEventListener('click', function(e) {
		console.log('test1');
		let listData = { sort: e.target.dataset.value };
		itemListPrt(listData);
	});
})

/*
data: { categories: categories,
		searchType: searchType,
		searchData: searchData,
		sort: sort,
		order: order
},
*/
//목록 출력
function itemListPrt(listData) {
	$('.itemList .table-row').remove();
	$.ajax({
		url: 'itemListChange.do',
		data: listData,
		method: 'GET',
		dataType: 'json'
	})
	.done(function(result) {
		result.forEach(item => {
			$('<div />').addClass('table-row').append(
				$('<div />').addClass('listTitle').text(item.itemName),
				$('<div />').addClass('listPrice').text(item.price),
				$('<div />').addClass('listSeller').text(item.seller),
				$('<div />').addClass('listDate').text(item.upDate),
			)
			.appendTo($('.itemList'));
		});
	})
	.fail(function(err) {
		console.log('itemListPrt err');
		console.log(err);
	})
}

//검색
























