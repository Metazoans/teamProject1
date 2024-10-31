<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="searchId.do" name="inputForm" onsubmit="return checkField();">
<% String mId = (String) request.getAttribute("mId");%>

 <table class="table" >
	<tr>
		<th>이름</th><td><input type="text" name="member_name">
		</td>
		</tr>
		<tr>
		<th>생일</th><td><input type="text" name="birth">
		</td>
		<tr>
		<tr>
		<th>휴대폰</th><td><input type="phone" name="phone">
		</td>
		<tr>
		<td colspan="2" align='center'>
			<input type="submit" class='btn btn-primary' value='입력'>
		</td>
	
		<td colspan="2" align='center'>
		<input type="button" class='btn btn-danger' value="취소" onclick="location.href = 'testBuyer.do' " />
		</td>
		</tr>
 
 </table>	
 </form>

	<script>
		console.log(${mId});
		function checkField(){
			let inputs = document.inputForm;
			if(!inputs.member_name.value){	// name속성이 id인 요소의 value가 없으면 true
				alert("이름를 입력하세요.");
				return false;	// pro페이지로 이동 금지.
			}
			if(!inputs.birth.value){	
				alert("생일을 입력하세요.");
				return false;
			}
			if(!inputs.phone.value){
				alert("휴대폰번호를 입력하세요.");
				return false;
			}	
			if(${mId}!=null){
				alert(${mId});
				
			}

		}
	</script>