<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 %>
 <%if(msg!= null){ %>
 <p style="color: red;"><%=msg %></p>
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
			<button type="submit" class='btn btn-primary'>로그인</button>
		</td>
 
 </table>	
</body>
 </form>
</html>