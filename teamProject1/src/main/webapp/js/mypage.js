/**
 * mypage.js
 */
	window.onload=function(){
		console.log(paystep);
		paystep.forEach((li) => {
			if(li.innerHTML == 'processing'){
				li.innerHTML = '거래 신청';
			}else if(li.innerHTML == 'deal'){
				li.innerHTML = '거래 승인';
			}else if(li.innerHTML == 'completed'){
				li.innerHTML = '거래 완료';
			}
		})
		
		
	}
	

		
