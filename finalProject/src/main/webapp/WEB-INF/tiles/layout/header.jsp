<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 자바스크립트 -->
<script type="text/javascript">

function onlyNum(event){ // 숫자만 입력하기 위한 함수
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.keyCode;
	   if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
	      return;
	   } else {
	      return false;
	   }
	}
	
function removeChar(event) { // 글자수 초과시 최대 글자 수만큼 자르는 함수
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.keyCode;
	   if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
	      return;      
	   } else{
	      event.target.value = event.target.value.replace(/[^0-9]/g, "");
	   }
	}

$(document).ready(function() {
	// x 버튼(닫기 버튼) 클릭시
	$(".close").click(function() {
		// 전체 모달 숨기기
		$("#loginModal").hide();
		$("#joinAgreeModal").hide();
		$("#joinModal1").hide();
		$("#joinModal2").hide();
		
		// Form 안의 내용 초기화
		document.getElementById("loginForm").reset();
		document.getElementById("joinAgreePost1").reset();
		document.getElementById("joinAgreePost2").reset();
		document.getElementById("joinForm1").reset();
	});
	
	// 일반 회원가입 당시 이메일 뒷부분 처리
	$("#joinEmailCheck").change(function() {
		$("#joinEmailCheck option:selected").each(function() {
			if($(this).val() == '0') { // 아무것도 선택 안 되어 있을 경우
				$("#joinEmail2").val(''); // 값 초기화
				$("#joinEmail2").attr("disabled", true); // 비활성화
			} else if($(this).val() == '9') { // 직접 입력일 경우
				$("#joinEmail2").val(''); // 값 초기화
				$("#joinEmail2").attr("disabled", false); // 활성화
			} else {
				$("#joinEmail2").val($(this).text()); // 선택값 입력
				$("#joinEmail2").attr("disabled", true) // 비활성화
			}
		});
	});
	
	
	// 약관 동의 모달을 켰을 경우
	$("#joinProcBtn").click(function() {
		// 약관 동의를 안 했을 경우
		if(document.joinAgreePost1.joinAgree1.value=="disagree") {
			alert("약관에 모두 동의하셔야 합니다");
			return;
		}
		
		if(document.joinAgreePost2.joinAgree2.value=="disagree") {
			alert("약관에 모두 동의하셔야 합니다");
			return;
		}
			
		// 약관에 모두 동의했을 경우 joinModal을 보여줌
		$("#joinModal1").show();
			
		// 로그인 모달과 가입 모달 숨기기
		$("#loginModal").hide();
		$("#joinAgreeModal").hide();
	});
	
		
	// 일반 회원 가입 진행 버튼 눌렀을 때
	$("#joinProcBtn2").click(function() {
		
		var emailCheck = $("#joinEmail2").val();
		var joinId = $("#joinUserId").val();
		var joinPw = $("#joinPassword").val();
		var joinPwChk = $("#passwordChk").val();
		var joinName= $("#joinUserName").val();
		var joinTelcom = $("#joinTelcom").val();
		var joinContact = $("#joinContact1").val()+$("#joinContact2").val()+$("#joinContact3").val();
		var joinEmail = $("#joinEmail1").val()+$("#joinEmail2").val();
		
		// 공란 있는지 확인
		if(joinId.length==0) {
			alert("아이디를 입력해 주세요.");
			joinForm1.joinUserId.focus();
			return;
		}
		
		if(joinName.length==0) {
			alert("닉네임을 입력해 주세요.");
			joinForm1.joinUserName.focus();
			return;
		}
		
		if(joinPw.length==0) {
			alert("비밀번호를 입력해 주세요.");
			joinForm1.joinPassword.focus();
			return;
		}
		
		if(joinForm1.joinContact1.value.length==0) {
			alert("전화번호를 입력해 주세요.");
			joinForm1.joinContact1.focus();
			return;
		} else if(joinForm1.joinContact2.value.length==0) {
			alert("전화번호를 입력해 주세요.");
			joinForm1.joinContact2.focus();
			return;
		} else if(joinForm1.joinContact3.value.length==0) {
			alert("전화번호를 입력해 주세요.");
			joinForm1.joinContact3.focus();
			return;
		}

		if(joinForm1.joinEmail1.value.length==0) {
			alert("이메일을 입력해 주세요.");
			joinForm1.joinEmail1.focus();
			return;
		} else if (joinForm1.joinEmail2.value.length==0) {
			alert("이메일을 입력해 주세요.");
			joinForm1.joinEmail2.focus();
			return;
		}
		
		// 전화번호 형식이 제대로 되지 않았을 때
		if(joinForm1.joinContact1.value.length<3) {
			alert("전화번호가 너무 짧습니다.");
			joinForm1.joinContact1.focus();
			return;
		} else if(joinForm1.joinContact1.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			joinForm1.joinContact1.focus();
			return;
		} else if(joinForm1.joinContact2.value.length<3) {
			alert("전화번호가 너무 짧습니다.");
			joinForm1.joinContact2.focus();
			return;
		} else if(joinForm1.joinContact2.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			joinForm1.joinContact2.focus();
			return;
		} else if(joinForm1.joinContact3.value.length<4) {
			alert("전화번호가 너무 짧습니다.");
			joinForm1.joinContact3.focus();
			return;
		} else if(joinForm1.joinContact3.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			joinForm1.joinContact3.focus();
			return;
		}
		
		// 이메일 형식이 잘못된 경우
		if(emailCheck.indexOf(".")<0) {
			alert("올바른 이메일 형식이 아닙니다.");
			$("input[name=joinEmail2]").val("");
			joinForm1.joinEmail2.focus();
			return;
		}
		
		if(joinForm1.joinEmail1.value.length<3) {
			alert("이메일 길이가 너무 짧습니다.");
			$("input[name=joinEmail1]").val("");
			joinForm1.joinEmail1.focus();
			return;
		}
		
		// 가입하고자 하는 아이디와 닉네임이 일치하는지 검사
		if(joinId==joinName) {
			alert("아이디와 닉네임이 일치하면 안 됩니다.");
			$("input[name=joinUserId]").val("");
			$("input[name=joinUserName]").val("");
			joinForm1.joinUserId.focus();
			return;
		}
		
		if(joinId==joinPw) {
			alert("아이디와 비밀번호가 일치하면 안 됩니다.");
			$("input[name=joinUserId]").val("");
			$("input[name=joinPassword]").val("");
			joinForm1.joinUserId.focus();
			return;
		}
		
		if(joinName==joinPw) {
			alert("닉네임과 비밀번호가 일치하면 안 됩니다.");
			$("input[name=joinUserName]").val("");
			$("input[name=joinPassword]").val("");
			joinForm1.joinUserName.focus();
			return;
		}
		
		// 비밀번호 일치 확인
		if(joinPw!=joinPwChk) {
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name=joinPassword]").val("");
			$("input[name=passwordChk]").val("");
			joinForm1.joinPassword.focus();
			return;
		}
		
		// 공백 검사
		if(joinId.indexOf(" ")>=0) {
			alert("아이디에 공백이 들어가면 안 됩니다.");
			$("input[name=joinUserId]").val("");
			joinForm1.joinUserId.focus();
			return;
		}
		
		if(joinName.indexOf(" ")>=0) {
			alert("닉네임에 공백이 들어가면 안 됩니다.");
			$("input[name=joinUserName]").val("");
			joinForm1.joinUserName.focus();
			return;
		}
		
		if(joinPw.indexOf(" ")>=0) {
			alert("비밀번호에 공백이 들어가면 안 됩니다.");
			$("input[name=joinPassword]").val("");
			joinForm1.joinPassword.focus();
			return;
		}
		
		if(joinContact.indexOf(" ")>=0) {
			alert("전화번호에 공백이 들어가면 안 됩니다.");
			$("input[name=joinContact1]").val("");
			$("input[name=joinContact2]").val("");
			joinForm1.joinContact1.focus();
			return;
		}

		// 가입 형식에 다 맞을 경우 joinModal2 보여 줌
		$("#joinModal2").show();
		
		// joinModal1 숨기기
		$("#joinModal1").hide();
	});
	
	// 약관 동의 모달을 띄웠을 경우
	$("#joinAgreeModal").click(function() {
		// 로그인 모달 숨기기
		$("#loginModal").hide();
	});
	
	// 회원가입 모달을 띄웠을 경우
	$("#joinModal1").click(function() {		
		// 약관 동의 모달 숨기기
		$("#joinAgreeModal").hide();
	});

	// 가입 두 번째 모달을 켰을 경우
	$("#joinModal2").click(function() {
		// 가입 모달 1 숨기기
		$("#joinModal1").hide();
	});
	
	$("#btnLogin").click(function() {
	    // 공백 검사
	    if(document.loginPost.userId.value.indexOf(" ")>=0) {
	    	alert("아이디에 공백이 들어가면 안 됩니다.");
	    	$("input[name=userId]").val("");
	    	loginPost.userId.focus();
	    	return;
	    }
	    
	    if(document.loginPost.password.value.indexOf(" ")>=0) {
	    	alert("비밀번호에 공백이 들어가면 안 됩니다.");
	    	$("input[name=password]").val("");
	    	loginPost.password.focus();
	    	return;
	    }
	    
	    // 공란 있는지 확인
	    if(document.loginPost.userId.value.length==0) {
	        alert("아이디를 입력해 주세요.");
	        loginPost.userId.focus();
	        return;
	    }
		
	    if(document.loginPost.password.value.length==0) {
	        alert("비밀번호를 입력해 주세요.");
	        loginPost.password.focus();
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
					
				// login form submit
				$("loginForm").submit();
					
				location.href="/main";
				
			},
			error: function() {
				// 로그인 실패, 아이디 or 비밀번호 오류
				alert("아이디 혹은 비밀번호가 잘못되었습니다.");
			}
			
		});
	});
});

</script>

<style type="text/css">
	
.modal-footer, .joinAgree {
	text-align: center;
	margin: auto;
}

table {
	text-align: left;
	margin: auto;
}

input {
	border: none;
	border-bottom: 2px solid gold;
	color: black;
}

.modal {
        text-align: center;
        color: white;
}

.modal-backdrop {
		background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
	vertical-align: middle;
}

.modal-dialog {
    display: inline-block;
	vertical-align: middle;
	border: 3px solid #ccc;
}

.modal-content {
	background-color: #181818;
}

.barBandJoinTable {
	vertical-align: middle;
	text-align: center;
	margin: auto;
}

.barJoinImg, .bandJoinImg {
	width: 200px;
	height: 200px;
	border-radius: 20px;
}

.loginBtn {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:20px;
	padding: 0 10px 0 10px;
	text-decoration:none;
	height: 28px;
	
	border: none;
	background-color: rgba(0,0,0,0);
}

.loginBtn:hover {
/* 	color:#D4F4FA; */
	color: gold;
	height: 28px;
/* 	메뉴 밑줄 색상 */
	border-bottom:3px solid #ffffff;
}

#btnLogin {
	border: none;
	outline: none;
	color: gold;
	background-color: #181818;
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
	text-align:left; /* 글 왼쪽 정렬 */
}
</style>
<!-- 헤더 타이틀 -->
<div >
	<h1 class="headerTitle" onclick="location.href='/main' ">Insert Image</h1>
</div>

<!-- 헤더 메뉴 -->
<div id="headerMenu">
	<ul>
	<li><a href="/bar/barlist">Bar</a></li>
	
	<li><a href="/band/bandList">Band</a>
		<ul>
			<li><a href="/band/bandByGenre?genreN=1">Bebob</a></li>
			<li><a href="/band/bandByGenre">Swing</a></li>
			<li><a href="/band/bandByGenre">Punk</a></li>
			<li><a href="/band/bandByGenre">Modern</a></li>
			<li><a href="/band/bandByGenre">Bosa Nova</a></li>
			<li><a href="/band/bandByGenre">Boogie Woogie</a></li>
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
	<li><button class="loginBtn" data-target="#loginModal" data-toggle="modal">Login</button>
	</li>
	</c:if>
	
	<c:if test="${login }">
	<li><a>${loginInfo.userName }</a>님
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
<div class="modal fade" id="loginModal" aria-hidden="true" style="display: none">
  <div class="modal-dialog modal-lg" style="width: 30%;">
    <div class="modal-content">
    <div class="modal-header text-center">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
    	<br>
        <h3 class="modal-title text-center"><b>Login</b></h3>     
    </div>
      <div class="modal-body text-center" style="height: 230px;">
            <form id="loginForm" action="/member/login" method="post" name="loginPost">
		        <br>
		        <table style="border: none; height: 60px;">
				<tr style="line-height: 140%;">
				<td>ID:&nbsp;&nbsp;</td>
				<td><input type="text" style="width: 120%;" id="userId" name="userId" placeholder=" 아이디를 입력해 주세요"/><br></td></tr>
				<tr style="padding-bottom: 3px;">
				<td>PW:&nbsp;&nbsp;</td>
				<td><input type="password" style="width: 120%;" id="password" name="password" placeholder=" 비밀번호를 입력해 주세요"/></td></tr>
				</table>
				<br>
			</form>
			<button type="button" id="btnLogin"><b>Submit</b></button>
      		<br><br><br>
      	<a data-toggle="modal" href="#joinAgreeModal" style="color: #ccc;">회원가입</a>&nbsp;&nbsp;&nbsp;
      	<a href="/member/findIdPw" style="color: #ccc;">아이디/비밀번호 찾기</a>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입 서비스 약관 동의 모달 -->
<div class="modal fade" id="joinAgreeModal" aria-hidden="true" style="display: none" >
  <div class="modal-dialog modal-lg" style="width: 55%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white"><b>&times;</b></button>
        <h3 class="modal-title text-center"><b>Join</b></h3>
        	<div class="joinInfo text-right"><br>
      			<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	  	</div>
      </div> 
      <div class="modal-body text-center" style="height: 450px;">
     	 <div class="agreeDiv text-center" style="margin-right: 100px; margin-left: 100px;"><br>
	     	 <div class="text-left" style="padding-bottom: 12px;"><b>ㆍ 서비스 약관 동의&nbsp;<font color="red">*</font></b></div>
	      	<div class="joinAgree text-right" style="overflow-y: scroll; height: 100px; width: 100%; border:2px solid gold;">
	      		<b>제 1 장 총 칙</b><br>
				제 1 조 목적<br>
				본 약관은 서비스 이용자가 주식회사 JazzBar(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.<br>
				<br>
				제 2 조 (약관의 명시, 효력 및 개정)<br>
				① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.<br>
				② 회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
				③ 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.<br>
				④ 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.<br>
				<br>
				<b>제 2 장 회원의 가입 및 관리</b><br>
				제 3 조 (회원가입절차)<br>
				① 서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.<br>
				② 회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이 동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지 “확인” 단추를 누르는 방법으로 합니다. 다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를 제출하도록 할 수 있습니다.<br>
				③ 법인고객 회원가입의 경우 회원가입 신청서의 제출, 서비스 이용대금의 납부 이외에 회사가 정하는 추가 서류의 제출이 추가적으로 필요합니다.<br>
				④ 법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가 다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.<br>
	      	</div>
		      	<div class="text-right" style="padding-top: 10px;">
			      	<form name="joinAgreePost1" id="joinAgreePost1">
			      	<input type="radio" name="joinAgree1" value="disagree" checked="checked">동의하지 않습니다&nbsp;&nbsp;&nbsp;
			      	<input type="radio" name="joinAgree1" value="agree">동의합니다
			      	</form>
		      	</div>
         </div>
         
         <div class="agreeDiv2 text-center" style="margin-right: 100px; margin-left: 100px;"><br>
	     	 <div class="text-left" style="padding-bottom: 12px;"><b>ㆍ 개인정보 수집 및 이용 동의&nbsp;<font color="red">*</font></b></div>
	      	<div class="joinAgree text-right" style="overflow-y: scroll; height: 100px; width: 100%; border:2px solid gold;">
			(주)JazzBar는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.<br>
				<b>1. 수집목적</b><br>
				• 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록 <br>
				• 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달 <br>
				• 유료 서비스 이용 시 요금 정산 <br>
				• 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용<br> 
				• 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 <br>
				• 프라이버시 보호 측면의 서비스 환경 구축 <br><br>
				<b>2. 수집항목</b><br>
				(필수) 아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택)<br><br> 
				<b>3. 보유기간</b><br>
				수집된 정보는 회원탈퇴 후 지체없이 파기됩니다. 다만 내부 방침에 의해 서비스 부정이용기록은 부정 가입 및 이용 방지를 위하여 회원 탈퇴 시점으로부터 최대 1년간 보관 후 파기하며, 관계법령에 의해 보관해야 하는 정보는 법령이 정한 기간 동안 보관한 후 파기합니다.<br> 				
				서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다.<br> 
				더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.<br>
	      	</div>
		      	<div class="text-right" style="padding-top: 10px;">
		      		<form name="joinAgreePost2" id="joinAgreePost2">
			      	<input type="radio" name="joinAgree2" value="disagree" checked="checked">동의하지 않습니다&nbsp;&nbsp;&nbsp;
			      	<input type="radio" name="joinAgree2" value="agree">동의합니다
			      	</form>
		      	</div>
         </div><br>
			<button type="button" style="color: black;" id="joinProcPrev"> &#60; Prev</button>
 			<button type="button" style="color: black;" id="joinProcBtn">Next &#62;</button>
      		<br>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입 모달 1 -->
<form id="joinForm1" action="/member/join" method="post" name="joinPost">
<div class="modal" id="joinModal1" aria-hidden="true" style="display: none" >
  <div class="modal-dialog modal-lg" style="width: 55%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
        <h3 class="modal-title text-center"><b>Join</b></h3>
	      	<div class="joinInfo text-right"><br>
      			<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	  	</div>
      </div> 
      <div class="modal-body text-center"  style="height: 450px;">
		        <br>
		        <table style="border: none; height: 300px; width: 100%;" >
				<tr style="line-height: 140%;">
				<td class="text-center"><font color="red">*</font>&nbsp;ID:&nbsp;
				<input type="text" id="joinUserId" name="joinUserId" /></td>
				<td><font color="red">*</font>&nbsp;Nickname:&nbsp;<input type="text" id="joinUserName" name="joinUserName" style="width: 205px;"/></td>
				</tr>
				<tr>
				<td class="text-center"><font color="red">*</font>&nbsp;PW:&nbsp;<input type="password" id="joinPassword" name="joinPassword" /></td>
				<td><font color="red">*</font>&nbsp;Phone:&nbsp;
					<select id="joinTelcom" name="joinTelcom" style="color: black; width: 15%; height: 23px">
						<option value="SK" selected>SKT</option>
						<option value="KT">KT</option>
						<option value="LG">LGT</option>
					</select>&nbsp;
						<input type="text" style="width: 40px" name="joinContact1" id="joinContact1" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
						<input type="text" style="width: 50px" name="joinContact2" id="joinContact2" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
						<input type="text" style="width: 50px" name="joinContact3" id="joinContact3" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/></td>
				</tr>
				<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>&nbsp;PW Check:&nbsp;<input type="password" id="passwordChk" name="passwordChk" /></td>
				<td><font color="red">*</font>&nbsp;Email:&nbsp;
						<input type="text" id="joinEmail1" name="joinEmail1" style="width: 120px;"/> @ 
						<input type="text" name="joinEmail2" id="joinEmail2" style="color: black; width: 90px" disabled value=""/>
							<select name="joinEmailCheck" id="joinEmailCheck" style="color: black; width: 90px; height: 24px; ">
								<option value="0" selected> ::: 선택 :::</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="9">직접 입력</option>
							</select>
				</td>
				</tr>
				</table>
				<br>
            
			<button type="button" data-toggle="modal" data-target="#joinAgreeModal" style="color: black;"> &#60; Prev</button>
 			<button type="button" id="joinProcBtn2" style="color: black;">Next &#62;</button>
      		<br>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입 모달 2 -->
<div class="modal" id="joinModal2" aria-hidden="true" style="display: none" >
  <div class="modal-dialog modal-lg" style="width: 55%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
        <h3 class="modal-title text-center"><b>Join As</b></h3>
      </div> 
      <div class="modal-body text-center"  style="height: 500px;">
		        <br>
		        <div>
			        <table style="border: none;" class="barBandJoinTable">
					<tr>
					<td>
						<a data-toggle="modal" href="#barJoinModal"><img class="barJoinImg" src="${pageContext.request.contextPath}/resources/joinImg/barJoin.JPG"></a>
					</td>
					<td>
						<a data-toggle="modal" href="#bandJoinModal"><img class="bandJoinImg" src="${pageContext.request.contextPath}/resources/joinImg/bandJoin.JPG"></a>
					</td>
					</tr>
					</table>
				</div>
				<br>
      		<br>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입 모달 3, bar join -->
<div class="modal" id="barJoinModal" aria-hidden="true" style="display: none" >
  <div class="modal-dialog modal-lg" style="width: 55%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
        <h3 class="modal-title text-center"><b>Join As</b></h3>
      </div> 
      <div class="modal-body text-center"  style="height: 500px;">
		        <br>
		        <table style="border: none; height: 300px; width: 100%;" >
				<tr style="line-height: 140%;">
				<td class="text-center"><font color="red">*</font>&nbsp;ID:&nbsp;
				</td>
				</tr>
				</table>
				<br>
      		<br>
      </div>
    </div>
  </div>
</div>
</form>

<hr>