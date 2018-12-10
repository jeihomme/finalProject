<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.joinDone b{
	color:#fff;
	
}

.joinDone input{
	color:#000;
}

.joinBtn {
	color:#000;
}
</style>

<form class="joinDone" action="/member/join" method="post">
	<b>계정</b> : <input type="text" name="userId"/><br>
	<b>암호</b> : <input type="password" name="password"/><br><br>
	<b>이름</b> : <input type="text" name="userName"/><br>
	<b>타입</b> : <input type="text" name="roleId"/><br><br>
	<b>메일</b> : <input type="text" name="email"/><br>
	<b>통신사</b> : <input type="text" name="telcom"/><br>
	<b>연락처</b> : <input type="text" name="contact"/><br><br>
	<button class="joinBtn">회원가입</button>
</form>

<button class="joinBtn" href="/member/main">취소</button>