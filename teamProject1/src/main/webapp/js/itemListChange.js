/**
 *
 */

let page, categories, trade, game, servers;
let searchType, searchData, sort, order;

page = $('#page').val();
categories = $('#categories').val();
trade = $('#trade').val();
game = $('#game').val();
servers = $('#servers').val();
servers = servers == '' ? undefined : servers;


let listCnt = document.querySelector('.pagination').dataset.value

let endPage = Math.ceil(page / 10.0) * 5;
let startPage = endPage - 4;
let realEnd = Math.ceil(listCnt / 10.0);
endPage = endPage > realEnd ? realEnd : endPage;

let prev = startPage > 1;
let next = endPage < realEnd;


let listData = {
	page: page,
	categories: categories,
	trade: trade,
	game: game,
	servers: servers,
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

		if (e.target.dataset.value != 'item_image') {
			listData.sort = e.target.dataset.value;
		}

		itemListPrt(listData);
	});
})

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

			listCnt = result.itemCnt;

			result.list.forEach(item => {
				let update = new Date(item.upDate);
				let year = update.getFullYear();

				let month = String(update.getMonth() + 1).padStart(2, "0");
				let day = String(update.getDate()).padStart(2, "0");

				let hh = String(update.getHours()).padStart(2, "0");
				let mm = String(update.getMinutes()).padStart(2, "0");
				let ss = String(update.getSeconds()).padStart(2, "0");

				console.log(hh, mm, ss);
				
				let dateFormat = `${year}-${month}-${day} ${hh}:${mm}:${ss}`;

				let img;
				if (item.image != undefined) {
					img = $('<img alt="이미지">').attr('src', 'images/' + item.image);
				}
				else {
					img = $('<img alt="이미지">').attr('src', 'images/noImage.png');
				}

				let link = $('<a />').attr('href', 'itemDetail.do?itemNumber=' + item.itemNumber).text(item.itemName).css('color', '#415094');
				$('<div />').addClass('table-row').append(
					$('<div />').addClass('listImage').append(img),
					$('<div />').addClass('listTitle').append(link),
					$('<div />').addClass('listPrice').text(item.price),
					$('<div />').addClass('listSeller').text(item.seller),
					$('<div />').addClass('listDate').text(dateFormat)
					//desc 생성 제거 --> 추가
				).appendTo($('.itemList'));
			});
			if(searchCheck == 1) pageReset();
			pageBtnPrt();
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

	listData.page = 1;
	
	searchCheck = 1;
	
	itemListPrt(listData);
})

let searchCheck = 0;
function pageReset() {
	page = 1;
	endPage = Math.ceil(page / 10.0) * 5;
	startPage = endPage - 4;
	realEnd = Math.ceil(listCnt / 10.0);
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd;
	
	searchCheck = 0;
}



//페이지 버튼 출력
pageBtnPrt();
function pageBtnPrt() {
	console.log('paging : ', startPage , endPage);
	$('.page-item').remove();
	let pageUl = $('.pagination');
	let pageLi = $('<li />').addClass('page-item');
	let pageA = $('<a />').addClass('page-link').css('z-index', 0);
	pageUl.append(pageLi.append(pageA.text('<')));

	for (let i = startPage; i <= endPage; i++) {
		pageLi = $('<li />').addClass('page-item');
		pageA = $('<a />').addClass('page-link').css('z-index', 0).text(i);

		pageLi = (i == page) ? pageLi.addClass('active') : pageLi;
		pageUl.append(pageLi.append(pageA));
	}

	pageLi = $('<li />').addClass('page-item');
	pageA = $('<a />').addClass('page-link').css('z-index', 0);
	pageUl.append(pageLi.append(pageA.text('>')));

	pageBtnFnc();
}

//페이지 버튼 이벤트
function pageBtnFnc() {
	document.querySelectorAll('.page-item').forEach(item => {
		item.addEventListener('click', function(e) {
			switch (e.target.text) {
				case '<':
					if (prev) {
						startPage = startPage - 5;
						startPage = startPage < 1 ? 1 : startPage;
						endPage = startPage + 4;
						endPage = endPage > realEnd ? realEnd : endPage;
						page = (page * 1) - 5;
						prev = startPage > 1;
						next = endPage < realEnd;
					}
					else {
						page = startPage;
					}
					break;
				case '>':
					if (next) {
						endPage = endPage + 5;
						startPage = endPage - 4;
						endPage = endPage > realEnd ? realEnd : endPage;
						startPage = startPage < 1 ? 1 : startPage;
						page = (page * 1) + 5;
						page = page > endPage ? endPage : page;
						prev = startPage > 1;
						next = endPage < realEnd;
					}
					else {
						page = endPage;
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



















