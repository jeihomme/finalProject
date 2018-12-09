<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

.loginDone b{
	color:#fff;
}

.loginDone input{
	color:#000;
}

.loginBtn {
	color:#000;
}
</style>

<form class="loginDone" action="/member/login" method="post">
	<b>계정</b> : <input type="text" name="userId" /><br>
	<b>암호</b> : <input type="password" name="password"/><br>
	<button class="loginBtn">로그인</button>
</form>

<!-- 버튼에 앵커 -->
	<button class="loginBtn" href="/member/main">취소</button>