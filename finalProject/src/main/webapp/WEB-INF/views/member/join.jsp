<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%response.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 자바스크립트 -->
<script type="text/javascript">

var idx = 0;

function execDaumPostcode() { // (post)
	new daum.Postcode({
		oncomplete: function(data) {
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				if(data.bname !== ''){//법정동명이 있을 경우 추가한다.
					extraAddr += data.bname;
				}
				if(data.buildingName !== ''){ // 건물명이 있을 경우 추가한다.
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
// 			document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('addr1').value = fullAddr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('addr2').focus();
			
			var address = addr1+addr2;
			
			$("input[name=addr2]").val("");
		}
	}).open();
}

$(document).ready(function() {
	
	// idx가 아닌 modal 숨김
	$('.modal-content:not(:eq('+idx+'))').hide();
	console.log("hide");
	
	// modal이 꺼지면 idx가 0으로 돌아감
	$("#layerpop").on("hide.bx.modal", function() {
		idx=0;
		
		console.log("hide modal"+idx);
	});
	
	$("#btnLogin").click(function() {
		
		// 다른 modal은 다 숨기고 로그인 modal만 띄움
		$('.modal-content').hide();
		$('.modal-content:eq('+idx+')').show();
		
		$('.joinBtn').click(function() {
			
			if(idx==0){
			
			$('.modal-content:eq('+idx+')').hide();
			$('.modal-content:eq('+(idx+1)+')').show();
			idx++;
				
			} else {
				console.log("else");
			}
		});
		
		
	    // 공백 검사
	    if(document.loginPost.userId.value.indexOf(" ")>=0) {
	    	alert("아이디에 공백이 들어가면 안 됩니다.");
	    	$("input[name=userId]").val("");
	    	post.userId.focus();
	    	return;
	    }
	    
	    if(document.loginPost.password.value.indexOf(" ")>=0) {
	    	alert("비밀번호에 공백이 들어가면 안 됩니다.");
	    	$("input[name=password]").val("");
	    	post.password.focus();
	    	return;
	    }
	    
	    // 공란 있는지 확인
	    if(document.loginPost.userId.value.length==0) {
	        alert("아이디를 입력해 주세요.");
	        post.userId.focus();
	        return;
	    }
		
	    if(document.loginPost.password.value.length==0) {
	        alert("비밀번호를 입력해 주세요.");
	        post.password.focus();
	        return;
	    }
		
	    // 넘겨 줄 값 설정
	    var formData = {
	    	userId: $("#userId").val(),
	    	password: $("#password").val()
	    };
	    
		$.ajax({
			type: "POST",
			url: "/member/login",
			dataType: "json",
			data: formData,
			success: function(res) {
				
				// 로그인 성공시 userId 및 password로 저장
				sessionStorage.setItem("userId", formData.userId);
				sessionStorage.setItem("password", formData.password);
										
				// form submit
				$("loginForm").submit();
					
				location.href="/main";
				
			},
			error: function() {
				alert("아이디 혹은 비밀번호가 잘못되었습니다.");
			}
			
		});
	});
});

</script>

<input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-light btn-xs"/><br>


<button class="loginBtn" data-target="#layerpop" data-toggle="modal">로그인</button>


<div class="modal fade" id="layerpop" tabindex="-1" role="dialog" aria-labelledby="layerpopLabel" aria-hidden="true">
  <div class="modal-dialog">
<!-- 로그인 모달 - modal 0 -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title text-center" id="layerpopLabel">Login</h2>
      </div>
      <div class="modal-body text-center">
            <form id="loginForm" action="/member/login" method="post">
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
      </div>
      <div class="modal-footer text-center">
      	<button type="button" class="joinBtn" id="layerpopLabel">회원가입</button>&nbsp;&nbsp;&nbsp;
      	<a href="/member/findIdPw">아이디/비밀번호 찾기</a>
      </div>
    </div>
    
    <!-- 회원가입 모달 - modal 1 -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title text-center">Join</h2>
      </div>
      <div class="modal-body text-center">
            <form id="joinUser" action="/member/join" method="post">
		        <table style="border: none;">
				<tr>
				<td>아이디:&nbsp;</td>
				<td><input type="text" style="color: black" name="userId" /></td></tr>
				<tr>
				<td>비밀번호:&nbsp;</td>
				<td><input type="password" style="color: black" name="password" /></td></tr>
				<tr>
				<td>비밀번호 확인:&nbsp;</td>
				<td><input type="password" style="color: black" name="password" /></td></tr>
				<tr>
				<td>닉네임:&nbsp;</td>
				<td><input type="text" style="color:black" name="userName" /></td></tr>
				</table>
				<button class="nextBtn">다음</button>
				<br>
			</form>
			<button type="button" id="btnJoin" style="color:#337ab7">Join</button>
      </div>

    </div>
    
  </div>
</div>
