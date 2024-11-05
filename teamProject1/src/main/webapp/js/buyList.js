/**
 * buyList.js
 */

//목록 출력
buyListPrt();
function buyListPrt() {
	let buyer = $('#buyer').val();
	$('.itemList .table-row').remove();
	$.ajax({
		url: 'buyListChange.do',
		data: { buyer: buyer },
		method: 'GET',
		dataType: 'json'
	})
		.done(function(result) {
			result.forEach(item => {
				let confirmBtn = $('<button />').addClass('genric-btn primary-border').attr('id', 'confirmBtn').text('구매확정');
				let cancelBtn = $('<button />').addClass('genric-btn danger-border').attr('id', 'cancelBtn').text('구매취소');
				let chatBtn = $('<button />').addClass('genric-btn warning-border').attr('id', 'chatBtn').text('채팅');
				$('<div />').addClass('table-row').append(
					$('<input>').attr('type', 'hidden').val(item.billsNumber),
					$('<input>').attr('type', 'hidden').addClass('seller').val(item.seller),
					$('<div />').addClass('buyTitle').text(item.itemName),
					$('<div />').addClass('buyCount').text(item.count),
					$('<div />').addClass('buyPrice').text(item.total),
					$('<div />').addClass('buyPayStep').text(item.payStep),
					$('<div />').addClass('buyBtnDiv').append(
						confirmBtn,
						cancelBtn,
						chatBtn
					)
					//desc 생성 제거 --> 추가
				).appendTo($('.itemList'));
			});
			confirmFnc();
			cancelFnc();
			chatFnc();
		})
		.fail(function(err) {
			console.log('buyListPrt err');
			console.log(err);
		})
}

//구매 확정
function confirmFnc() {
	document.querySelectorAll('#confirmBtn').forEach(btn => {
		btn.addEventListener('click', function(e) {
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
					buyListPrt();
					console.log('구매 확정 성공');
				} else if (result.retCode == 'FAIL') {
					console.log('구매 확정 실패');
				}
			}).fail(function(err) {
				console.log(err);
			})
		})
	})
}

//구매 취소
function cancelFnc() {
	document.querySelectorAll('#cancelBtn').forEach(btn => {
		btn.addEventListener('click', function(e) {
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
					buyListPrt();
					console.log('구매 취소 성공');
				} else if (result.retCode == 'FAIL') {
					console.log('구매 취소 실패');
				}
			}).fail(function(err) {
				console.log(err);
			})
		})
	})
}







