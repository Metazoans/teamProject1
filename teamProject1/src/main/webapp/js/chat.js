/**
 * chat.js
 */

document.querySelector('#seller').addEventListener('click', function(e) {
	let toId = document.querySelector('#seller').innerHTML
	$.ajax('chatList.do?fromId=' + fromId + '&toId=' + toId)
		.done(function(result) {
			console.log(result)
			result.forEach((item) => {
				if (item.fromId == fromId) {
					$('<p/>').append($('<div/>').addClass('floatRight chatting').text(item.message))
						.appendTo($('.modal-chat'))
				} else {
					$('<p/>').append($('<div/>').addClass('floatLeft chatting').text(item.message))
						.appendTo($('.modal-chat'))
				}
			});
		})
		.fail(function(err) {
			console.log(err);
		})


})