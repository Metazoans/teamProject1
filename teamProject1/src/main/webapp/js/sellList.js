/**
 * sellList.js
 */


//목록 출력
buyListPrt();
function buyListPrt() {
	let logId = $('#logId').val();
	$('.table-row').remove();
	$.ajax({
		url: 'sellList.do', //수정
		data: { logId: logId },
		method: 'GET',
		dataType: 'json'
	})
		.done(function(result) {
			result.forEach(item => {
				let divRow = $('<div />').addClass('table-row');
				
				let confirmBtn = $('<button />').addClass('genric-btn primary-border confirmBtn').text('거래승인');
				let cancelBtn = $('<button />').addClass('genric-btn danger-border cancelBtn').text('거래취소');
				let chatBtn = $('<button />').addClass('genric-btn warning-border chatBtn').text('채팅');

				if (item.trade == 'sell') { //판매글이었으면 구매 요청
					$(divRow).append(
						$('<input>').attr('type', 'hidden').val(item.billsNumber),
						$('<input>').attr('type', 'hidden').addClass('buyer').val(item.buyer),
						$('<div />').addClass('buyTitle').text(item.itemName),
						$('<div />').addClass('buyCount').text(item.count),
						$('<div />').addClass('buyPrice').text(item.total),
						$('<div />').addClass('buyPayStep').text('거래 신청'),
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
						$('<input>').attr('type', 'hidden').addClass('buyer').val(item.buyer),
						$('<div />').addClass('buyTitle').text(item.itemName),
						$('<div />').addClass('buyCount').text(item.count),
						$('<div />').addClass('buyPrice').text(item.total),
						$('<div />').addClass('buyPayStep').text('거래 신청'),
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
//			chatFnc();
		})
		.fail(function(err) {
			console.log('buyListPrt err');
			console.log(err);
		})
}

//거래 확정 deal 상태로 변경
function confirmFnc() {
	document.querySelectorAll('.confirmBtn').forEach(btn => {
		console.log('confirm btn start');
		
		btn.addEventListener('click', function(e) {
			console.log('sellList confirm btn click');
			let billsNumber = $(e.target).parent().parent().find('input').val();
			let payStep = $(e.target).parent().parent().find('.buyPayStep').text();
			let logId = $('#logId').val();
			
			if(payStep == '거래 신청') {
				$.ajax({
					url: 'payStepUpdate.do',
					data: {
						billsNumber: billsNumber,
						logId: logId
					},
					method: 'GET',
					dataType: 'json'
				}).done(function(result) {
					if(result.retCode == 'LACK') { //마일리지 부족
						alert('마일리지 부족');
					}
					else if (result.retCode == 'OK') {
						buyListPrt();
						alert('거래 확정 성공');
					}
					else if (result.retCode == 'FAIL') {
						alert('거래 확정 실패');
					}
				}).fail(function(err) {
					console.log(err);
				})
			}
		})
	})
}

//거래 취소
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

