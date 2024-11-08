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



document.querySelector('.table-name2').addEventListener('click', function() {
	randomList();
})
function randomList() {
	// jQuery 방식의 Ajax 호출
	$.ajax('randomList.do')
		.done(function(result) {
			$('div#randomList div.progress-table div.table-row').remove()
			result.forEach((item) => {
				let link = $('<a />').attr('href', 'itemDetail.do?itemNumber=' + item.itemNumber).text(item.itemName).css('color', '#415094');
				let img = item.image
				let update = new Date(item.upDate);
				let year = String(update.getFullYear());
				let month = String(update.getMonth() + 1).padStart(2, "0");
				let day = String(update.getDate()).padStart(2, "0");
				let hh = String(update.getHours()).padStart(2, "0");
				let mm = String(update.getMinutes()).padStart(2, "0");
				let ss = String(update.getSeconds()).padStart(2, "0");
				let dateFormat = `${year}-${month}-${day} ${hh}:${mm}:${ss}`;
				if (img == null) {
					img = "noImage.png"
				}
				$('<div/>').addClass('table-row').append(
					$('<div/>').addClass('listImage').append($('<img>').attr("src", "images/" + img)),
					$('<div/>').addClass('listGame').text(item.game),
					$('<div/>').addClass('listServer').text(item.servers),
					$('<div/>').addClass('listTitle').append(link),
					$('<div/>').addClass('listPrice').text(item.price),
					$('<div/>').addClass('listSeller').text(item.seller),
					$('<div/>').addClass('listDate').text(dateFormat)
				).appendTo($('div#randomList div.progress-table'))
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}




