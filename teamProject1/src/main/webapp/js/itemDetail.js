/**
 * itemDetail.js
 */


$('#dealBtn').on('click', function(e) {
	
	//최대값 이상의 숫자 입력시 취소 기능
	if ($('#dealCount').val() > $('#maxCount').val() * 1) {
		alert('거래 가능 숫자 초과');
		$('#dealCount').val('');
		$('#dealCount').focus();
	}
	else {

		$.ajax({
			url: 'dealItem.do',
			data: {
				itemNumber: $('#itemNumber').val(),
				dealCount: $('#dealCount').val(),
				logId: $('#logId').val()
			},
			method: 'GET',
			dataType: 'json'
		})
			.done(function(result) {
				if (result.retCode == 'LACK') {
					alert('마일리지 부족');
					$('#dealCount').val('');
					$('#dealCount').focus();
				}
				else if (result.retCode == 'OK') {
					console.log('성공');
					$('#dealCount').val('');
					$('#dealCount').focus();
					$('#maxCount').val(result.newCnt);
					$('#dealCount').attr('placeholder', '최대 : ' + result.newCnt);

				}
				else if (result.retCode == 'CFAIL') {
					console.log('거래 갯수 오류');
				}
				else if (result.retCode == 'RFAIL') {
					console.log('bills 추가 실패');
				}
			})
			.fail(function(err) {
				console.log('err 발생');
				console.log(err);
			})

	}
})




