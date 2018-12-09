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
	<b>암호</b> : <input type="password" name="password"/><br>
	<b>이름</b> : <input type="text" name="userName"/><br>
	<b>타입</b> : <input type="text" name="roleId"/><br>
	<button class="joinBtn">회원가입</button>
</form>

<button class="joinBtn" href="/member/main">취소</button>