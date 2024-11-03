/**
 *
 */

let page, categories, searchType, searchData, sort, order;

categories = document.querySelector('.itemList').dataset.value;
if(categories == '') categories = undefined;
page = document.querySelector('.pagination-area').dataset.value;

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
		if (listData.sort == e.target.dataset.value) {
			if (listData.order == null) listData.order = 'desc';
			else listData.order = null;
		}
		else listData.order = null;

		listData.sort = e.target.dataset.value;

		itemListPrt(listData);
	});
})

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
				).appendTo($('.itemList'));
			});
		})
		.fail(function(err) {
			console.log('itemListPrt err');
			console.log(err);
		})
}

//제목 클릭시 상품 상세로 이동

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


//페이지 버튼 출력
let listCnt = document.querySelector('.pagination').dataset.value

let endPage = Math.ceil(page / 5.0) * 5;
let startPage = endPage - 4;
let realEnd = Math.ceil(listCnt / 10.0);
endPage = endPage > realEnd ? realEnd : endPage;

let prev = startPage > 1;
let next = endPage < realEnd;

pageBtnPrt();
function pageBtnPrt() {
	
	console.log(listCnt, startPage, endPage);
	
	$('.page-item').remove();
	let pageUl = $('.pagination');
	let pageLi = $('<li />').addClass('page-item');
	let pageA = $('<a />').addClass('page-link');
	pageUl.append(pageLi.append(pageA.text('<')));
	
	for(let i = startPage; i <= endPage; i++) {
		pageLi = $('<li />').addClass('page-item');
		pageA = $('<a />').addClass('page-link').text(i);
		
		pageLi = (i == page) ? pageLi.addClass('active') : pageLi;
		pageUl.append(pageLi.append(pageA));
	}
	
	pageLi = $('<li />').addClass('page-item');
	pageA = $('<a />').addClass('page-link');
	pageUl.append(pageLi.append(pageA.text('>')));
	
	pageBtnFnc();
}

//페이지 버튼 이벤트
function pageBtnFnc() {
	document.querySelectorAll('.page-item').forEach(item => {
		item.addEventListener('click', function(e) {
			
			switch(e.target.text) {
				case '<':
					if(prev) {
						startPage = startPage - 5;
						startPage = startPage < 1 ? 1 : startPage;
						page = startPage;
						endPage = startPage + 4;
						endPage = endPage > realEnd ? realEnd : endPage;
						prev = startPage > 1;
						next = endPage < realEnd;
					}
					break;
				case '>':
					if(next) {
						endPage = endPage + 5;
						endPage = endPage > realEnd ? realEnd : endPage;
						startPage = endPage - 4;
						startPage = startPage < 1 ? 1 : startPage;
						page = startPage;
						prev = startPage > 1;
						next = endPage < realEnd;
					}
					break;
				default:
					page = e.target.text;
			}
			listData.page = page;
			itemListPrt(listData);
			pageBtnPrt();
		});
	});
}



















