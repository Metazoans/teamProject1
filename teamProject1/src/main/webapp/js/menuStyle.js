/**
 * menuStyle.js
 */


let hiddenBtn = document.querySelector("#hiddenBtn");
let hiddenPage = document.querySelector("#hiddenPage");
let hiddenList = document.querySelector("#hiddenList");
let myPage = document.querySelector("#myPage");
let floatLeft = document.querySelectorAll(".float-left");
let subMenuLi = document.querySelectorAll(".submenu li");


gameMenuList();
function gameMenuList() {
	$.ajax('gameList.do')
		.done(function(result) {
			$('div.gamemenu ul li').remove();
			result.forEach((item) => {
				let game = item;
				$('<li/>').addClass('game-' + game).append($('<a/>').text(game),
					$('<div/>').addClass('servermenu').append($('<ul/>')
					.append($('<li/>').append($('<a/>').text('전체').attr("href", "https://www.daum.net/"))))
				).appendTo($('div.gamemenu>ul'));
				serverMenuList(game);
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}

function serverMenuList(game) {
	$.ajax('serverList.do?game=' + game)
		.done(function(result) {
			result.forEach((item) => {
				$('li.game-' + game + '>div.servermenu>ul').append($('<li/>')
				.append($('<a/>').text(item).attr("href", "https://www.daum.net/")));
			});
		})
		.fail(function(err) {
			console.log(err);
		})
}


subMenuLi.forEach((li) => {
	li.addEventListener('mouseover', function() {
		li.querySelector(".gamemenu").style.cssText = "display: block";
		li.querySelectorAll(".gamemenu>ul>li").forEach((inLi) => {
			inLi.addEventListener('mouseover', function() {
				inLi.querySelector(".servermenu").style.cssText = "display: block";
			})
			inLi.addEventListener('mouseout', function() {
				inLi.querySelector(".servermenu").style.cssText = "display: none";
			})
		})
	})
	li.addEventListener('mouseout', function() {
		li.querySelector(".gamemenu").style.cssText = "display: none";
	})
})

myPage.addEventListener('mouseover', function() {
	hiddenList.style.cssText = "display: block";

})
myPage.addEventListener('mouseout', function() {
	hiddenList.style.cssText = "display: none";
})



/*
document.querySelectorAll('div.menu-wrapper a').forEach((a)=>{
	a.style.width = "170px"
	a.style.height = "54px"
	a.style.fontWeight = "bold"

})

floatLeft.forEach((fl) => {
	fl.style.cssText = "float: left";
})

hiddenBtn.querySelectorAll("li a").forEach((a) => {
	a.style.cssText = 'width: 170px; height: 54px; font-size: 14px; font-weight: bold; line-height: 27px;';
})

hiddenPage.style.margin = "0 10px 0 0"
*/


// 검색창 스크립트
/* 
let selectBox = document.querySelector("div.nice-select");
let ulList = document.querySelector("ul.list");

selectBox.addEventListener('click', function(e){	//검색창 셀렉트박스
	selectBox.classList.toggle('open');
	ulList.querySelectorAll("li").forEach((li) =>{
		li.addEventListener('click', function(e){
			document.querySelector("span.current").innerText = li.innerText;
			document.querySelector('div#default-select select').value = e.target.dataset.value
		})
	})
})
let divCenter = document.querySelector("div#center-location");
let searchBtn = divCenter.querySelector("button");
divCenter.style.margin = "0 auto" 
 
searchBtn.addEventListener('click', function(e){	//검색창 검색버튼
	console.log('화면 옮겨지기');
})
*/
