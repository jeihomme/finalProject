<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btnLogin").click(function() {
		$("#form").submit();
	});
});

</script>

<!-- css 사용 -->
<style type="text/css">
.loginModalBtn {
	background-color: white;
	border: 1px solid #F7819F;
	outline: none;
	
	text-align: right;
	margin: auto;
}

table {
	text-align: center;
	margin: auto;
}

.modal {
        text-align: center;
}

@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}

.modal-body {
	text-align: center;
	margin: auto;
}

.modal-footer {
	text-align: center;
	margin: auto;
}

.modal-dialog {
    display: inline-block;
	vertical-align: middle;
	width: 30%;
}

</style>


<body>

<div class="btnModal text-right">
	<button class="loginModalBtn btn-xs" data-target="#layerpop" data-toggle="modal">Login</button><br/>
</div>
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
				<td><input type="text" name="userId" /></td></tr>
				<tr>
				<td>PW:&nbsp;</td>
				<td><input type="password" name="userPw" /></td></tr>
				</table>
				<br>
			</form>
			<button type="button" id="btnLogin">Login</button>
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

</body>
</html>