<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- itemDetail.do -->
<h1>itemDetail.jsp</h1>

<div id="itemDetail">
	<h3 class="single-input">test ${item.itemName }</h3>
	
	<div>
		<span>${item.game }</span>
		<span>${item.servers }</span>
		<span>${item.categories }</span>
	</div>
	
	<div>
		<span class="single-textarea">${item.itemInfo }</span>
		<span>img</span>
	</div>
	
	<div>
		<span>${item.seller }</span>
		<span>${item.price }</span>
		<span>${item.count }</span>
		<button>구매</button>
	</div>
</div>

