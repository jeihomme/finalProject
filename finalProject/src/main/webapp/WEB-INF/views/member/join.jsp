<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%response.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btnLogin").click(function() {
		$("#form").submit();
	});
});

</script>


<button class="loginBtn" data-target="#layerpop" data-toggle="modal">로그인</button>


<!-- 로그인 모달 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <!-- header title -->
        <h2 class="modal-title text-center">Login</h2>
      </div>
      <!-- body -->
      <div class="modal-body text-center">
            <form id=form action="/member/login" method="post">
		        <table style="border: none;">
				<tr>
				<td>ID:&nbsp;</td>
				<td><input type="text" style="color: black" name="userId" /></td></tr>
				<tr>
				<td>PW:&nbsp;</td>
				<td><input type="password" style="color: black" name="password" /></td></tr>
				</table>
				<br>
			</form>
			<button type="button" id="btnLogin" style="color:#337ab7">Login</button>
			<a href="/main"><button type="button" id="btnCancel" data-dismiss="modal">Cancel</button></a>
      </div>
      <!-- Footer -->
      <div class="modal-footer text-center">
      	<a href="/member/join">회원가입</a>&nbsp;&nbsp;&nbsp;
      	<a href="/member/findIdPw">아이디/비밀번호 찾기</a>
      </div>
    </div>
  </div>
</div>
