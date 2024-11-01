<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <form action="loginForm.do" method ="post">
<body>
<%
 String msg = (String) request.getAttribute("msg");
String logId = (String)session.getAttribute("logId");
 %>
 <%if(msg!= null){ %>
 <p style="color: red;"><%=msg %></p>
 <%} %>
 <%if(logId!=null){%>
 alert("로그인이 되었습니다.")
 <%} %>
 

 <table class="table">
	<tr>
		<th>아이디</th><td><input type="text" name="logId">
		</td>
		</tr>
		<tr>
		<th>비밀번호</th><td><input type="password" name="logPw">
		</td>
		<tr>
		<td colspan="2" align='center'>
			<button type="submit" class='btn btn-primary'>로그인</button><br>
			<button type="button" class='btn btn-primary' onclick = "location.href = 'searchIdForm.do' ">아이디찾기</button>
			<button type="button" class='btn btn-primary'>비밀번호찾기</button>
		</td>
 
 </table>	
</body>
 </form>
</html>
 -->


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
.btn2 {
  margin: 10px 0; /* 간격 줄이기 */
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
  height: 700px;
}
.btn-primary {
  padding: 5px 10px; 
  font-size: 14px;
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
</style>
<div id="joindiv">
<form action="loginForm.do"class="joinForm" method ="post">
                                                                                               
      <h2>로그인</h2>
      <div class="textForm">
        <input name="logId" type="text" class="id" placeholder="아이디">
        </input>
      </div>
      <div class="textForm">
        <input name=logPw type="password" class="pw" placeholder="비밀번호">
      </div>
      <input type="submit" class="btn2" value="로그인"/><br>
      <input type="button" class='btn2 btn-primary' onclick = "location.href = 'searchIdForm.do'" value="아이디찾기">
      <input type="button" class='btn2 btn-primary' onclick = "location.href = 'searchPwdForm.do'" value="비밀번호찾기">
      
</form>
</div>    