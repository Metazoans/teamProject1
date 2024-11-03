/**
 * mainPage.js
 */

function rankLeft() {
	// jQuery 방식의 Ajax 호출
	$.ajax('popular.do?page=' + ((page * 2) - 1))
		.done(function(result) {
			console.log(result);
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
			console.log(result);
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

rankLeft();
rankRight();
imageshow();



function imageshow() {

}




