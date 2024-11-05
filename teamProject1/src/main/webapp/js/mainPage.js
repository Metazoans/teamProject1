/**
 * mainPage.js
 */
rankLeft();
rankRight();
randomList();


function rankLeft() {
	// jQuery 방식의 Ajax 호출
	$.ajax('popular.do?page=' + ((page * 2) - 1))
		.done(function(result) {
			//목록지우기
			//$("div.progress-table div.table-row").remove();
			//목록
			result.forEach((item) => {
				$('<div/>').addClass("table-row").append(
					$('<div/>').addClass('serial').text(item.rank),					//랭킹
					$('<div/>').addClass('country').text(item.game)				//게임명
				).appendTo($('div.progress-table:eq(0)'));
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}

function rankRight() {
	// jQuery 방식의 Ajax 호출
	$.ajax('popular.do?page=' + (page * 2))
		.done(function(result) {
			//목록지우기
			//$("div.progress-table div.table-row").remove();
			//목록
			result.forEach((item) => {
				$('<div/>').addClass("table-row").append(
					$('<div/>').addClass('serial').text(item.rank),					//랭킹
					$('<div/>').addClass('country').text(item.game)				//게임명
				).appendTo($('div.progress-table:eq(1)'));
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}





function randomList() {
	// jQuery 방식의 Ajax 호출
	$.ajax('randomList.do')
		.done(function(result) {
			console.log(result);
			//목록지우기
			//$("div.progress-table div.table-row").remove();
			//목록
			result.forEach((item) => {
				console.log(item);
				let link = $('<a />').attr('href', 'itemDetail.do?itemNumber=' + item.itemNumber).text(item.itemName).css('color', '#415094');
				$('<div/>').addClass('table-row').append(
					$('<div/>').addClass('listTitle').append(link),
					$('<div/>').addClass('listPrice').text(item.price),
					$('<div/>').addClass('listSeller').text(item.seller),
					$('<div/>').addClass('listDate').text(item.upDate)
				).appendTo($('div#randomList div.progress-table'))
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}




