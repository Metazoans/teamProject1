/**
 * itemDetail.js
 */


//buyBtn 동작 -> OK=count 변경, CFAIL=구매 갯수 오류, RFAIL=bills 추가 실패
$('#buyBtn').on('click', function(e) {
	console.log('buyBtn click');
	
	//최대값 이상의 숫자 입력시 취소 기능
	

	$.ajax({
		url: 'buyItem.do',
		data: {
			itemNumber: $('#itemNumber').val(),
			buyCount: $('#buyCount').val(),
			logId: $('#logId').val()
		},
		method: 'GET',
		dataType: 'json'
	}) 
		.done(function(result) {
			if(result.retCode == 'OK') {
				console.log('성공');
				$('#buyCount').val('');
				$('#buyCount').focus();
				$('#buyCount').attr('placeholder', '최대 : ' + result.newCnt);
				
			}
			else if(result.retCode == 'CFAIL') {
				console.log('구매 갯수 오류');
			}
			else if(result.retCode == 'RFAIL') {
				console.log('bills 추가 실패');
			}
		})
		.fail(function(err) {
			console.log('err 발생');
			console.log(err);
		})
})







