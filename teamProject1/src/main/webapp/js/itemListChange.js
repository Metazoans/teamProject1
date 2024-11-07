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

console.log('list data : ');
console.log(listData);
itemListPrt(listData);

//목록 정렬
document.querySelectorAll('.table-head div').forEach(div => {
	div.addEventListener('click', function(e) {
		if (listData.sort == e.target.dataset.value) {
			if (listData.order == null) listData.order = 'desc';
			else listData.order = null;
		}
		else listData.order = null;

		if(e.target.dataset.value != 'item_image') {
			listData.sort = e.target.dataset.value;
		}

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
				let update = new Date(item.upDate);
				let year = update.getFullYear();
				let month = update.getMonth();
				let day = update.getDate();
				let hh = update.getHours();
				let mm = update.getMinutes();
				let ss = update.getSeconds();
				let dateFormat = `${year}-${month}-${day} ${hh}:${mm}:${ss}`; 
				
				let img;
				console.log(item.image);
				if(item.image != undefined) {
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

let endPage = Math.ceil(page / 10.0) * 5;
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
						endPage = startPage + 4;
						endPage = endPage > realEnd ? realEnd : endPage;
						page = endPage;
						prev = startPage > 1;
						next = endPage < realEnd;
					}
					else {
						page = startPage;
					}
					break;
				case '>':
					if(next) {
						endPage = endPage + 5;
						startPage = endPage - 4;
						endPage = endPage > realEnd ? realEnd : endPage;
						startPage = startPage < 1 ? 1 : startPage;
						page = startPage;
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



















