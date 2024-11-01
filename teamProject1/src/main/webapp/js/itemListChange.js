/**
 *
 */

let page, categories, searchType, searchData, sort, order;

categories = document.querySelector('.itemList').dataset.value;

let listData = {
	page: page,
	categories: categories,
	searchType: searchType,
	searchData: searchData,
	sort: sort,
	order: order
};

itemListPrt(listData);

//목록 정렬
document.querySelectorAll('.table-head div').forEach(div => {
	div.addEventListener('click', function(e) {
		if(listData.sort == e.target.dataset.value){
			if(listData.order == null) listData.order = 'desc';
			else listData.order = null;
		}
		else listData.order = null;
		
		listData.sort = e.target.dataset.value;
		
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
	console.log(listData);
	
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
					$('<div />').addClass('listDate').text(item.upDate)
					//desc 생성 제거 --> 추가
				)
					.appendTo($('.itemList'));
			});
		})
		.fail(function(err) {
			console.log('itemListPrt err');
			console.log(err);
		})
}

//검색 조건 선택
let selectBox = document.querySelector("div.nice-select");
let ulList = document.querySelector("ul.list");
let centerLocation = document.querySelector(".center-location");

centerLocation.style.margin = "0 auto";

selectBox.addEventListener('click', function(e) {
	selectBox.classList.toggle('open');
	ulList.querySelectorAll("li").forEach((li) => {
		li.addEventListener('click', function(e) {
			document.querySelector("span.current").innerText = li.innerText;
			document.querySelector("span.current").dataset.value = e.target.dataset.value;
		})
	})
})

//검색
$('#searchDiv button').on('click', function() {
	listData.searchType = document.querySelector('#searchDiv span').dataset.value;
	listData.searchData = document.querySelector('#searchDiv input').value;
	
	itemListPrt(listData);
})





















