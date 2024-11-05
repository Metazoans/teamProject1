/**
 * buyList.js
 */

//목록 출력
function buyListPrt(listData) {
	console.log(listData);

	$('.itemList .table-row').remove();
	$.ajax({
		url: 'buyListChange.do',
		data: {},
		method: 'GET',
		dataType: 'json'
	})
		.done(function(result) {
			//			result.forEach(item => {
			//				let link = $('<a />').attr('href', 'itemDetail.do?itemNumber=' + item.itemNumber).text(item.itemName).css('color', '#415094');
			//				$('<div />').addClass('table-row').append(
			//					$('<div />').addClass('listTitle').append(link),
			//					$('<div />').addClass('listPrice').text(item.price),
			//					$('<div />').addClass('listSeller').text(item.seller),
			//					$('<div />').addClass('listDate').text(item.upDate)
			//					//desc 생성 제거 --> 추가
			//				).appendTo($('.itemList'));
			//			});
		})
		.fail(function(err) {
			console.log('buyListPrt err');
			console.log(err);
		})
}

//구매 확정
$('#confirmBtn').on('click', function(e) {
	let billsNumber = $(e.target).parent().parent().find('input').val();
	console.log(billsNumber);
	$.ajax({
		url: 'buyConfirm.do',
		data: {
			billsNumber: billsNumber
		},
		method: 'GET',
		dataType: 'json'
	}).done(function(result) {
		if (result.retCode == 'OK') {
			console.log('구매 확정 성공');
		} else if (result.retCode == 'FAIL') {
			console.log('구매 확정 실패');
		}
	}).fail(function(err) {
		console.log(err);
	})
})

document.querySelectorAll('#cancelBtn').forEach(cbtn => {
	cbtn.click(function(e) {
		let billsNumber = $(e.target).parent().parent().find('input').val();
		$.ajax({
			url: 'buyCancel.do',
			data: {
				billsNumber: billsNumber
			},
			method: 'GET',
			dataType: 'json'
		}).done(function(result) {
			if (result.retCode == 'OK') {
				console.log('구매 취소 성공');
			} else if (result.retCode == 'FAIL') {
				console.log('구매 취소 실패');
			}
		}).fail(function(err) {
			console.log(err);
		})
	})
})

//구매 취소









