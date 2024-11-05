/**
 * mypage.js
 */
	window.onload=function(){
		console.log(paystep);
		paystep.forEach((li) => {
			if(li.innerHTML == 'processing'){
				li.innerHTML = '처리중';
			}else{
				li.innerHTML = '처리완료';
			}
		})
		
	}
	
	topBtn.addEventListener('click', function(){
		console.log(topBtn);
		window.scrollTo({top:0});
	})