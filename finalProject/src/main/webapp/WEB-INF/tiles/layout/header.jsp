<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btnLogin").click(function() {
		$("#form").submit();
	});
});

</script>

<style type="text/css">
	
table {
	text-align: center;
	margin: auto;
}

.modal {
        text-align: center;
		background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        
        color: white;
}

.modal-backdrop {
	background-color: black;
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

.loginBtn {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:20px;
	padding: 0 10px 0 10px;
	text-decoration:none;
	height: 28px;
}

.loginBtn:hover {
/* 	color:#D4F4FA; */
	color: gold;
	height: 28px;
/* 	메뉴 밑줄 색상 */
	border-bottom:3px solid #ffffff;
}

.headerTitle {
	padding:10px;
	color:#ffffff;
	cursor:pointer;
}

#headerMenu {
 	float:right; 
	text-align:right;
	margin:0px 5px 3px 5px;
	padding:0 100px 3px 10px;
	box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
/* 	background-color:#5c5c5c; */
}

#headerMenu ul li{
	float:left;
	list-style-type:none;
}

#headerMenu a {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:20px;
	padding:0 10px 0 10px;
	text-decoration:none;
}

#headerMenu a:hover {
/* 	color:#D4F4FA; */
	color: gold;
/* 	메뉴 밑줄 색상 */
	border-bottom:3px solid #ffffff;
}

#headerMenu ul ul {
	display:none;
	position:absolute;
	background-color:#000000;
}

#headerMenu ul li:hover ul {
	display: block;
}

#headerMenu ul ul li {
	float:none;
}
</style>
<!-- 헤더 타이틀 -->
<div >
	<h1 class="headerTitle" onclick="location.href='/main' ">Insert Image</h1>
</div>

<!-- 헤더 메뉴 -->
<div id="headerMenu">
	<ul>
	<li><a>Bar</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<li><a>Band</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<li><a>Ad</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<li><a>Notice</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<c:if test="${not login }">
	<li><a>Login</a>
		<ul>
			<li class="loginBtn" data-target="#layerpop" data-toggle="modal">로그인</li>
			<li><a href="/member/join">회원가입</a></li>
		</ul>
	</li>
	</c:if>
	
	<c:if test="${login }">
	<li><a>${loginName }</a>님
		<ul>
			<li><a href="/mypage/info">계정관리</a></li>
			<li><a href="/member/logout">로그아웃</a></li>
			<li><a href="#">계정탈퇴</a></li>
		</ul>
	</li>
	</c:if>
	
	</ul>
</div><br>

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
				<td><input type="text" name="userId" /></td></tr>
				<tr>
				<td>PW:&nbsp;</td>
				<td><input type="password" name="password" /></td></tr>
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

<hr>