/**
 * memberAdd.js
 */
document.querySelector('#checkBtn').addEventListener('click', function(e) {
	let mId = $('#memberId').val();
	console.log(mId);
	/*
	$.ajax('duplicateId.do?mId=' + mId)
		success: function(result) {
			console.log(result);
			if (result.retCode == "OK") {
				$('<p/>').attr('style', 'color: red').text(result.retVal).appendTo($('#msg'))
				$('#memberId').val("");
			} else if (result.retCode == "FAIL") {
				alert("입력에 실패하였습니다. 다시 시도해주십시오.")
			}
		},
		error: function(err) {
			console.log(err);
		}
		*/
		$.ajax('duplicateId.do?mId=' + mId)
		.done(function(result) {
			let newResult = JSON.parse(result)
			console.log(result);
			console.log(newResult);
			$('#msg p').remove();
			if (newResult.retCode == "OK") {
				$('<p/>').attr('style', 'color: red').text(newResult.retMsg).appendTo($('#msg'))
				$('#memberId').val("");
			} else if (newResult.retCode == "FAIL") {
				$('<p/>').attr('style', 'color: red').text(newResult.retMsg).appendTo($('#msg'))
			}
		})
		.fail(function(err) {
			console.log(err);
		})
		
		
		
		
	/*
	fetch('duplicateId.do?mId=' + mId)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result);
			if (result.retCode == "OK") {
				$('<p/>').attr('style', 'color: red').text(result.retVal).appendTo($('#msg'))
				$('#memberId').val("");
			} else if (result.retCode == "FAIL") {
				alert("입력에 실패하였습니다. 다시 시도해주십시오.")
			}
		})
		.catch(err => console.log(err));
		*/
})

