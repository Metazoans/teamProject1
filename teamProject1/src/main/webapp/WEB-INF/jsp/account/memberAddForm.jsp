<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--  <form action="memberAdd.do">
		<table class='table'>
		<tr>
		<th>회원ID</th><td><input type="text" name="member_id"></td>			
		</tr>
		<tr>
		<th>비밀번호</th><td><input type="password" name="password" minlength='3' place></td>			
		</tr>
		<tr>
		<th>회원이름</th><td><input type="text" name="member_name"></td>			
		</tr>
		<tr>
		<th>생년월일</th><td><input type="text" name="birth"></td>			
		</tr>
		<tr>
		<th>연락처</th><td><input type="text" name="phone"></td>			
		</tr>
		<tr>
		<td colspan='2' align="center"><input type="submit" value="저장" class='btn btn-primary'></td>			
		</tr>
		</table>
	</form> -->
	<style>




.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.birth {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
</style>

<form action="memberAdd.do"class="joinForm">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="member_id" type="text" class="id" placeholder="아이디">
        </input>
      </div>
      <div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호">
      </div>
      <div class="textForm">
        <input name="member_name" type="text" class="name" placeholder="이름">
      </div>
      <div class="textForm">
        <input name="birth" type="text" class="birth" placeholder="생년월일">
      </div>
      <div class="textForm">
        <input name="phone" type="text" class="cellphoneNo" placeholder="전화번호">
      </div>
      <input type="submit" class="btn" value="저장"/>
    </form>