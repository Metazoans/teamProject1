/**
 * chat.js
 */


//버튼당 클릭했을때 모달창 열기
document.querySelectorAll('.seller').forEach((seller) => {
	seller.addEventListener('click', function(e) {
	toId = $(e.target).parent().find('.sellerVal').val()
	modalOpen();
	})
})
function modalOpen() {
	let body = document.querySelector('body');
	body.className = 'modal-open';
	body.style.overflow = 'hidden';
	body.style.paddingRight = '17px';

	let modal = document.querySelector('#exampleModal');
	modal.classList.add('show');
	modal.setAttribute('aria-modal', true);
	modal.setAttribute('role', 'dialog');
	modal.removeAttribute('aria-hidden');
	modal.style.display = 'block';

	let div = document.createElement('div')
	div.className = 'modal-backdrop fade show';
	body.appendChild(div);
	
	showList();
}

//모달창 열었을때 채팅 목록 띄우기
function showList(e) {
	
	$.ajax('chatList.do?fromId=' + fromId + '&toId=' + toId)
		.done(function(result) {
			$('.modal-chat p').remove()
			result.forEach((item) => {
				if (item.fromId == fromId) {
					$('<p/>').addClass('rightP').append($('<div/>').addClass('floatRight chatting').text(item.message))
						.appendTo($('.modal-chat'))
				} else {
					$('<p/>').addClass('leftP').append($('<div/>').addClass('floatLeft chatting').text(item.message))
						.appendTo($('.modal-chat'))
				}
				$('.modal-chat').scrollTop($('.modal-chat').prop('scrollHeight'))
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}

//채팅 치기
function chatUp() {
	let message = $('#message').val()
	if(message == ""){
		alert("메세지를 입력해주세요.");
		return;
	}
	$.ajax('chatUpdate.do?fromId=' + fromId + '&toId=' + toId + '&message=' + message)
		.done(function(result) {
			console.log(result)
			if(result.retCode == "OK"){
				showList();
			} else if(result.retCode == "FAIL") {
				alert("입력에 실패하였습니다. 다시 시도해주십시오.")
			}
		})
		.fail(function(err) {
			console.log(err);
		})
}


//모달창 닫기
window.addEventListener('click', function(e) {
	if (e.target == document.querySelector('#exampleModal')) {
		modalClose();
	}
})
document.querySelector(".modal-header button").addEventListener('click', function(e) {
	modalClose();
})
document.querySelector(".modal-footer button").addEventListener('click', function(e) {
	modalClose();
})
function modalClose() {

	let body = document.querySelector('body');
	body.removeAttribute('style');
	body.removeAttribute('class');

	let modal = document.querySelector('#exampleModal');
	modal.classList.remove('show');
	modal.removeAttribute('aria-modal');
	modal.removeAttribute('role');
	modal.setAttribute('aria-hidden', true);
	modal.style.display = 'none';

	body.lastChild.remove();
}
