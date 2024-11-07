/**
 * buyList.js
 */

//목록 출력
buyListPrt();
function buyListPrt() {
	let buyer = $('#buyer').val();
	$('.table-row').remove();
	$.ajax({
		url: 'buyListChange.do',
		data: { buyer: buyer },
		method: 'GET',
		dataType: 'json'
	})
		.done(function(result) {
			result.forEach(item => {
				let divRow = $('<div />').addClass('table-row');
				
				let confirmBtn = $('<button />').addClass('genric-btn primary-border confirmBtn').text('거래확정');
				let cancelBtn = $('<button />').addClass('genric-btn danger-border cancelBtn').text('거래취소');
				let chatBtn = $('<button />').addClass('genric-btn warning-border chatBtn').text('채팅');

				let payStep;
				if(item.payStep == 'processing') payStep = '거래 신청';
				else if(item.payStep == 'deal') payStep = '거래 승인';

				if (item.trade == 'sell') { //판매글이었으면 구매 요청
					$(divRow).append(
						$('<input>').attr('type', 'hidden').val(item.billsNumber),
						$('<input>').attr('type', 'hidden').addClass('seller').val(item.seller),
						$('<div />').addClass('buyTitle').text(item.itemName),
						$('<div />').addClass('dealUser').text(item.seller),
						$('<div />').addClass('buyCount').text(item.count),
						$('<div />').addClass('buyPrice').text(item.total),
						$('<div />').addClass('buyPayStep').text(payStep),
						$('<div />').addClass('buyBtnDiv').append(
							confirmBtn,
							cancelBtn,
							chatBtn
						)
					).appendTo('#buyList')
				}
				else if (item.trade == 'buy') { //구매글이었으면 판매 요청
					$(divRow).append(
						$('<input>').attr('type', 'hidden').val(item.billsNumber),
						$('<input>').attr('type', 'hidden').addClass('seller').val(item.seller),
						$('<div />').addClass('buyTitle').text(item.itemName),
						$('<div />').addClass('dealUser').text(item.seller),
						$('<div />').addClass('buyCount').text(item.count),
						$('<div />').addClass('buyPrice').text(item.total),
						$('<div />').addClass('buyPayStep').text(payStep),
						$('<div />').addClass('buyBtnDiv').append(
							confirmBtn,
							cancelBtn,
							chatBtn
						)
					).appendTo('#sellList')
				}
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
	document.querySelectorAll('.confirmBtn').forEach(btn => {
		console.log('confirm btn start');
		
		btn.addEventListener('click', function(e) {
			let billsNumber = $(e.target).parent().parent().find('input').val();
			let payStep = $(e.target).parent().parent().find('.buyPayStep').text();
			let buyer = $('#buyer').val();
			
			if(payStep == '거래 신청') {
				alert('거래 확인중입니다.');
			}
			else if(payStep == '거래 승인') {
				$.ajax({
					url: 'buyConfirm.do',
					data: {
						billsNumber: billsNumber,
						logId: buyer
					},
					method: 'GET',
					dataType: 'json'
				}).done(function(result) {
					if(result.retCode == 'LACK') { //마일리지 부족
						alert('마일리지 부족');
					}
					else if (result.retCode == 'OK') {
						buyListPrt();
						alert('구매 확정 성공');
					}
					else if (result.retCode == 'FAIL') {
						alert('구매 확정 실패');
					}
				}).fail(function(err) {
					console.log(err);
				})
			}
		})
	})
}

//구매 취소
function cancelFnc() {
	document.querySelectorAll('.cancelBtn').forEach(btn => {
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
					console.log('거래 취소 성공');
				} else if (result.retCode == 'FAIL') {
					console.log('거래 취소 실패');
				}
			}).fail(function(err) {
				console.log(err);
			})
		})
	})
}







