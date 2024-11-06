<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="css/chat.css">
</head>

<h1>chat</h1>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#exampleModal" id="seller">test2</button>
<button type="button" class="seller">button</button>
<input type="hidden" class="sellerVal" value="test2">
<button type="button" class="buyer">button</button>
<input type="hidden" class="buyerVal" value="test2">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">채팅</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modal-chat">
					<!-- 내용들어갈부분 -->
				</div>
				<div class="modal-input">
					<textarea name="chat-content" cols="40" rows="4"
						style="resize: none;" class="float-reft" id="message"></textarea>
					<button type="button" class="btn btn-primary float-reft btnSize"
						onclick="chatUp()">전송</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	let fromId = "${logId}";
	let toId = "";
</script>
<script src="js/chat-seller.js"></script>