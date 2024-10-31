<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <form action="searchId.do" name="inputForm" onsubmit="return checkField();">


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
 -->
 
 
<script>
function checkField() {
    let inputs = document.inputForm;
    if (!inputs.member_name.value) {
        alert("이름을 입력하세요.");
        return false;
    }
    if (!inputs.birth.value) {
        alert("생일을 입력하세요.");
        return false;
    }
    if (!inputs.phone.value) {
        alert("휴대폰 번호를 입력하세요.");
        return false;
    }
    return true; 
}
</script>
	
<style>
.joinForm {
  position: absolute;
  width: 400px;
  height: auto; /* Adjusted height to accommodate new fields */
  padding: 30px 20px;
  background-color: #FFFFFF;
  text-align: center;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 15px 0; /* Adjusted margin */
  padding: 10px 0; /* Adjusted padding */
}

.inputField {
  width: 100%;
  border: none;
  outline: none;
  color: #636e72;
  font-size: 16px;
  height: 25px;
  background: none;
}

.btn2 {
  margin: 10px 0;
  width: 80%;
  height: 40px;
  background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
  background-position: left;
  background-size: 200%;
  color: white;
  font-weight: bold;
  border: none;
  cursor: pointer;
  transition: 0.4s;
}

.btn2:hover {
  background-position: right;
}

#joindiv {
  display: block;
  height: 600px; /* Adjusted to accommodate new fields */
  
}
</style>

<div id="joindiv">
  <form action="searchId.do" class="joinForm" method="post" onsubmit="return checkField();">
    <h2>아이디 찾기</h2>

    <div class="textForm">
      <input name="member_name" type="text" class="inputField" placeholder="이름">
    </div>
    <div class="textForm">
      <input name="phone" type="text" class="inputField" placeholder="휴대폰 번호">
    </div>
    <div class="textForm">
      <input name="birth" type="text" class="inputField" placeholder="생년월일">
    </div>

    <input type="submit" class="btn2" value="입력"/><br>
    <input type="button" class="btn2 btn-primary" onclick="location.href='testBuyer.do'" value="취소">
  </form>
</div>