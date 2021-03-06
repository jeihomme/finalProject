<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- Daum 지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 자바스크립트 -->
<script type="text/javascript">

var idx = 0;

var idCheck = 0;
var nickCheck = 0;
var pwCheck = 0;

// member 가입시 아이디 중복 확인
function checkId() {
	// 닉네임 입력 값
	var inputed = $("#joinUserId").val();
	
	$.ajax ({
		data: {
			userId: inputed
		},
		url: "/member/checkJoinMemberId",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinIdCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinIdCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinIdCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);

			// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinIdCheck").css("color", "green");
				$(".nextBtn").prop("disabled", false);
			
			}
		}
	});
}

//member 가입시 닉네임 중복 확인
function checkNick() {
	// 닉네임 입력 값
	var inputed = $("#joinUserName").val();
	
	$.ajax ({
		data: {
			userName: inputed
		},
		url: "/member/checkJoinMemberNick",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinUserNameCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinUserNameCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinUserNameCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);

				// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinUserNameCheck").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			}
		}
	});
}

//member 가입시 비밀번호, 비밀번호 확인이 일치하는지 확인
function checkPw() {
	// 비밀번호 입력 값
	var inputed1 = $("#joinPassword").val();
	var inputed2 = $("#passwordChk").val();
	
	$.ajax ({
		data: {
			password: inputed1,
			passChk: inputed2
		},
		url: "/member/checkJoinMemberPw",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed1=="" && data=="0") {
				$("#joinPwCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);

			} else if(inputed2=="" && data=="0") {
				$("#joinPwCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
				
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinPwCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinPwCheck").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			// 입력된 값이 없을 때
			} else if(inputed1=="" || inputed1==null) {
				$("#joinPwCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);
				
			} else if(inputed2=="" || inputed2==null) {
				$("#joinPwCheck").css("color", "red");
				$(".nextBtn").prop("disabled", true);

			}
		}
	});

}

//member 가입시 전화번호 길이가 맞는지 확인
function checkContact() {
	// 비밀번호 입력 값
	var contact1 = $("#joinContact1").val();
	var contact2 = $("#joinContact2").val();
	var contact3 = $("#joinContact3").val();
	var contact = contact1+contact2+contact3;

	$.ajax ({
		data: {
			contact: contact
		},
		url: "/member/checkJoinMemberContact",
		success: function(data) {
		
			if(contact1.length<=2 || contact2.length<=3 || contact3.length<=3) {
				$("#joinContactChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
				
			} else if(contact1.length>=4 || contact2.length>=5 || contact3.length>=5) {
				$("#joinContactChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			} else if(data=="0") {
				$("#joinContactChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
				
			} else if(data=="1" && contact1.length==3 && contact2.length==4 && contact3.length==4) {
				$("#joinContactChk").css("color", "green");
				$(".nextBtn").prop("disabled", false);
			}
			
		}
	
	});
}

// bar 가입시 barName 중복 확인
function checkBarName() {
	// 닉네임 입력 값
	var inputed = $("#barName").val();
	
	$.ajax ({
		data: {
			barName: inputed
		},
		url: "/member/checkJoinBarName",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinBarNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinBarNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinBarNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);

				// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinBarNameChk").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			}
		}
	});
}

//bar 가입시 manager 중복 확인
function checkBarManager() {
	// 닉네임 입력 값
	var inputed = $("#manager").val();
	
	$.ajax ({
		data: {
			manager: inputed
		},
		url: "/member/checkJoinBarManager",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinBarManagerChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinBarManagerChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinBarManagerChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);

				// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinBarManagerChk").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			}
		}
	});
}

//bar 가입시 주소 중복 확인
function checkBarAddress() {
	// 닉네임 입력 값
	var inputed = $("#addr1").val();
// 	var inputed2 = $("#manager").val();

	$.ajax ({
		data: {
			barAddress: inputed
		},
		url: "/member/checkJoinBarAddress",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinBarAddressChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinBarAddressChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinBarAddressChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);

				// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinBarAddressChk").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			}
		}
	});
}

//band 가입시 bandName 중복 확인
function checkBandName() {
	// 닉네임 입력 값
	var inputed = $("#bandName").val();

	$.ajax ({
		data: {
			bandName: inputed
		},
		url: "/member/checkJoinBandName",
		success: function(data) {
			// 입력 값이 비어 있고 출력되는 값이 0일 때
			if(inputed=="" && data=="0") {
				$("#joinBandNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 출력 값이 0일 때
			} else if(data=="0") {
				$("#joinBandNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);
			
			// 입력된 값이 없을 때
			} else if(inputed=="" || inputed==null || inputed.length<=2) {
				$("#joinBandNameChk").css("color", "red");
				$(".nextBtn").prop("disabled", true);

				// 중복 체크 끝난 다음, 가입 가능할 때
			} else if(data=="1") {
				$("#joinBandNameChk").css("color", "green");
				$(".nextBtn").prop("disabled", false);

			}
		}
	});
}

function onlyNum(event){ // 숫자만 입력하기 위한 함수
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.keyCode;
	   if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) {
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
	   } else {
	      event.target.value = event.target.value.replace(/[^0-9]/g, "");
	   }
	}

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
// 			$("input[name=addr2]").val("");
		}
	}).open();
}


$(document).ready(function() {
	
	// Band 가입할 때 Band Member 추가
	var maxField = 5; // 5개까지만 동적 생성
	var wrapper = $(".bandMemberAdd");
	var start = 1;	// 첫 숫자
	
	var fieldHTML = '<div><input type="text" name="bandMember" value="" style="margin-bottom: 10px; width: 130px;" class="input"/> - <input type="text" name="bandMemberPosition" value="" style="margin-bottom: 10px; width: 130px;" class="input"/><a href="#" class="removeBandMemberBtn"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></a></div>';
	
	$(".AddBandMemberBtn").click(function() {
		if(start < maxField) {
			start++;
			$(".bandMemberAdd").append(fieldHTML); // add field
		}
	});
	
	$(wrapper).on("click", ".removeBandMemberBtn", function(e) {
		e.preventDefault();
		$(this).parent('div').remove(); // remove field
		start--;
	});
	
	$('.modal-content:not(:eq('+idx+'))').hide();
	console.log("hide modal");		
	
	$(".modal").on("hide.bs.modal", function() {
		idx=0;
		console.log("Modal hidden");
	});
	
	// bar 가입할 때 사진 등록 버튼을 눌렀을 경우
	$('.barPicAdd').on('click', function() {
		$("#joinBarPic").click();
		return false;
	});
	
	

	// 이미지 파일 확장자 확인 (이미지가 아닐 경우 반환)
	$("#joinBarPic").change(function() {
		
		ext = $(this).val().split('.').pop().toLowerCase();
		
		// 확장자가 이미지 파일이 아닐 경우
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    		$("#joinBarPicform").get(0).reset(); //폼 초기화
            alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        }
		
		var formData = new FormData();
		var file = this.files[0];
		formData.append("JoinPic", file);
		
		$.ajax({
			async: true,
			method: "post",
			url: "/member/profilePic",
			processData: false,
			data: formData,
			contentType: false,
			success: function(data) {
// 				alert("파일 업로드 성공");
			},
			error: function() {
				alert("파일 업로드 실패");
			}
		});
		
		readBarPicURL(this);
	});
	
	// 사진 미리보기
	function readBarPicURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#previewBarPic").attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
			
		} 
	}
	
	$("#joinBandPic").change(function() {
		ext = $(this).val().split('.').pop().toLowerCase();
		
		// 확장자가 이미지 파일이 아닐 경우
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    		$("#joinBandPicform").get(0).reset(); //폼 초기화
            alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        }
		
		var formData = new FormData();
		var file = this.files[0];
		formData.append("JoinPic", file);
		
		$.ajax({
			async: true,
			method: "post",
			url: "/member/profilePic",
			processData: false,
			data: formData,
			contentType: false,
			success: function(data) {
// 				alert("파일 업로드 성공");
			},
			error: function() {
				alert("파일 업로드 실패");
			}
		});
		
		readBandPicURL(this);
	});
	
	function readBandPicURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#previewBandPic").attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$('.bandPicAdd').on('click', function() {
		$("#joinBandPic").click();
		return false;
	});
	
	// 상단바에 있는 로그인 버튼을 클릭했을 때
	$(".loginBtn").click(function() {
		$(".modal-content").hide();
		$(".modal-content:eq("+idx+")").show();
		console.log(idx+" 번째 index");
		
		console.log($("#loginForm").get(0));
		$("#loginForm").get(0).reset();
		$("#joinAgreePost1").get(0).reset();
		$("#joinAgreePost2").get(0).reset();
		$("#joinForm1").get(0).reset();
		$("#joinBarPicform").get(0).reset();
		$("#joinForm2").get(0).reset();
		$("#joinBandPicform").get(0).reset();
		$("#joinForm3").get(0).reset();
		
	});
	
	// 다음 버튼을 클릭했을 때
	$(".nextBtn").click(function() {
		console.log("다음 버튼 클릭 "+idx);
		
		// 가입 동의 모달일 경우
		if(idx==1) {
			
			if(document.joinAgreePost1.joinAgree1.value=="disagree") {
				alert("약관에 모두 동의하셔야 합니다");
				return;
			}
			
		// 일반 회원가입 모달일 경우
		} else if(idx==2) {
			
			if(document.joinAgreePost2.joinAgree2.value=="disagree") {
				alert("약관에 모두 동의하셔야 합니다");
				return;
			}
			
		// 일반 회원가입 모달일 경우
		} else if(idx==3) {
			
			var emailCheck = $("#joinEmail2").val();
			var joinId = $("#joinUserId").val();
			var joinPw = $("#joinPassword").val();
			var joinPwChk = $("#passwordChk").val();
			var joinName= $("#joinUserName").val();
			var joinTelcom = $("#joinTelcom").val();
			var joinContact = $("#joinContact1").val()+$("#joinContact2").val()+$("#joinContact3").val();
			var joinEmail = $("#joinEmail1").val()+"@"+$("#joinEmail2").val();
			
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
			
		// 아이디 / 비밀번호 찾기 선택 모달일 경우
		} else if(idx==8) {
		
			
		// 비밀번호 찾기 모달일 경우
		} else if(idx==10) {
			
		}
		
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+1)+")").show();
		idx++;
		
		console.log("인덱스 ++ "+idx);	
		
	});
	
	$(".deleteMember").click(function() {
		if(document.deleteAgreeForm.deleteMemberAgree.value=="disagree") {
			alert("약관에 동의하셔야 합니다");
			return;
		}
		
	    var formData = {
		    	userId: $("#memberDeleteId").val(),
		    	roleId: $("#memberDeleteRoleId").val()
		    };
		
		$.ajax({
			type: "POST",
			url: "/member/delete",
			dataType: "json",
			data: formData,
			success: function(res) {
				alert("회원 탈퇴 성공");
				$(".modal-content:eq("+Number(idx+12)+")").hide();

				location.reload();

			},
			error: function() {
				alert("회원 탈퇴 실패");
				$(".modal-content:eq("+Number(idx+12)+")").hide();

				location.reload();


			}
		});
		$(".modal-content:eq("+Number(idx+12)+")").hide();

			location.reload();


	});
	
	$(".findIdPw").click(function() {
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+8)+")").show();
		idx=idx+8;
		
		console.log("인덱스 ++ "+idx);	
	});
	
	$(".backBtn").click(function() {
		console.log("이전 버튼 클릭 "+idx);
		
		if(idx<=4 || idx==9) {
			// Form 안의 내용 초기화
			document.getElementById("loginForm").reset();
			document.getElementById("joinAgreePost1").reset();
			document.getElementById("joinAgreePost2").reset();
			document.getElementById("joinForm1").reset();
			document.getElementById("findIdForm").reset();
			document.getElementById("findPwForm").reset();
			
			$(".modal-content:eq("+idx+")").hide();
			$(".modal-content:eq("+Number(idx-1)+")").show();
			idx--;
			
			console.log("인덱스 -- "+idx);
		
		// bar 가입 모달일 때
		} else if(idx==5) {
			$("#joinBarPicform").get(0).reset();
			document.getElementById("joinBarPicform").reset();
			document.getElementById("joinForm2").reset();
			
			$(".modal-content:eq("+idx+")").hide();
			$(".modal-content:eq("+Number(idx-1)+")").show();
			idx--;
			
			console.log("인덱스 -- "+idx);
		
		// band 가입 모달일 때
		} else if(idx==6) {
			$("#joinBandPicform").get(0).reset();
			document.getElementById("joinBandPicform").reset();
			document.getElementById("joinForm3").reset();
			
			$(".modal-content:eq("+idx+")").hide();
			$(".modal-content:eq("+Number(idx-2)+")").show();
			idx=idx-2;
			
		// 아이디 / 비밀번호 찾기 모달일 때
		} else if(idx==8) {
			$(".modal-content:eq("+idx+")").hide();
			// 로그인 모달 보여 주기
			$(".modal-content:eq("+Number(idx-8)+")").show();
			idx=idx-8;
			
			console.log("인덱스 -- "+idx);
			
		} else if(idx==10) {
			document.getElementById("findIdForm").reset();
			document.getElementById("findPwForm").reset();
			
			$(".modal-content:eq("+idx+")").hide();
			$(".modal-content:eq("+Number(idx-2)+")").show();
			idx=idx-2;
		}
		
	});
	
	// bar 가입 버튼
	$(".nextBtn1").click(function() {
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+1)+")").show();
		idx++;
		
		console.log("인덱스 ++ "+idx);	
	});
	
	// band 가입 버튼
	$(".nextBtn2").click(function() {
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+2)+")").show();
		idx+=2;
		
		console.log("인덱스 +=2 "+idx);	
	});
	
	// 탈퇴 버튼 클릭했을 때 모달 띄우기
	$(".deleteMemberBtn").click(function() {
		$(".modal-content:eq("+Number(idx+12)+")").show();
	});
	
	// 아이디 찾기 버튼
	$(".findIdBtn").click(function() {
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+1)+")").show();
		idx++;
		
		console.log("인덱스 ++ "+idx);	
	});
	
	// 비밀번호 찾기 버튼
	$(".findPwBtn").click(function() {
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+2)+")").show();
		idx+=2;		
	});
	
	// 아이디 찾기 확인 버튼
	$(".findIdConfirmBtn").click(function() {
		
		var findIdEmailCheck = $("#findUserIdEmail2").val();
		var findIdTelcom = $("#findIdTelcom").val();
		var findIdContact = $("#findIdContact1").val()+$("#findIdContact2").val()+$("#findIdContact3").val();
		var findIdEmail = $("#findUserIdEmail1").val()+"@"+$("#findUserIdEmail2").val();
		
		// 이메일을 입력하지 않은 경우
		if(findIdForm.findUserIdEmail1.value.length==0) {
			alert("이메일을 입력해 주세요.");
			findIdForm.findUserIdEmail1.focus();
			return;
		
		// 전화번호를 입력하지 않은 경우
		} else if(findIdForm.findIdContact1.value.length==0) {
			alert("전화번호를 입력해 주세요.");
			findIdForm.findIdContact1.focus();
			return;
			
		} else if(findIdForm.findIdContact2.value.length==0) {
			alert("전화번호를 입력해 주세요.");
			findIdForm.findIdContact2.focus();
			return;
			
		} else if(findIdForm.findIdContact3.value.length==0) {	
			alert("전화번호를 입력해 주세요.");
			findIdForm.findIdContact3.focus();
			return;
		}
		
		// 전화번호 형식이 제대로 되지 않았을 때
		if(findIdForm.findIdContact1.value.length<3) {
			alert("전화번호가 너무 짧습니다.");
			findIdForm.findIdContact1.focus();
			return;
		} else if(findIdForm.findIdContact1.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			findIdForm.findIdContact1.focus();
			return;
		} else if(findIdForm.findIdContact2.value.length<3) {
			alert("전화번호가 너무 짧습니다.");
			findIdForm.findIdContact2.focus();
			return;
		} else if(findIdForm.findIdContact2.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			findIdForm.findIdContact2.focus();
			return;
		} else if(findIdForm.findIdContact3.value.length<4) {
			alert("전화번호가 너무 짧습니다.");
			findIdForm.findIdContact3.focus();
			return;
		} else if(findIdForm.findIdContact3.value.length>=5) {
			alert("전화번호가 너무 깁니다.");
			findIdForm.findIdContact3.focus();
			return;
		}
		
		// 이메일 형식이 잘못된 경우
		if(findIdEmailCheck.indexOf(".")<0) {
			alert("올바른 이메일 형식이 아닙니다.");
			$("input[name=findUserIdEmail2]").val("");
			findIdForm.findUserIdEmail2.focus();
			return;
		} else if(findIdForm.findUserIdEmail1.value.length<3) {
			alert("이메일 길이가 너무 짧습니다.");
			$("input[name=findUserIdEmail1]").val("");
			findIdForm.findUserIdEmail1.focus();
			return;
		
		// 이메일에 공백이 들어갔을 경우
		} else if(findIdEmailCheck.indexOf(" ")>=0) {
			alert("이메일에 공백이 들어가면 안 됩니다.");
			$("input[name=findUserIdEmail1]").val("");
			$("input[name=findUserIdEmail2]").val("");
			findIdForm.findIdEmailCheck1.focus();
			return;			
		}
		
		var formData = {
			telcom: findIdTelcom,
			contact: findIdContact,
			email: findIdEmail
		}
		
		$.ajax({
			type: "POST",
			url: "/mail/findId",
			dataType: "json",
			data: formData,
			success: function(res) {
				
				// Find Your Id form submit
				$("findIdForm").submit();
				alert("이메일 전송 성공!");
				
				$(".modal-content:eq("+idx+")").hide();
				$(".modal-content:eq("+Number(idx+2)+")").show();
				idx+=2;
				
				console.log("인덱스 +2 "+idx);	
			},
			error: function() {
				alert("등록되지 않은 이메일 혹은 전화번호입니다.");
			}
			
		});
			
	});
	
	// 비밀번호 찾기 확인 버튼
	$(".findPwConfirmBtn").click(function() {
		var findPasswordEmailCheck = $("#findPasswordEmail2").val();
		var findPasswordUserId = $("#findPasswordUserId").val();
		var findPasswordEmail = $("#findPasswordEmail1").val()+"@"+$("#findPasswordEmail2").val();
		
		// 이메일을 입력하지 않은 경우
		if(findPwForm.findPasswordEmail1.value.length==0) {
			alert("이메일을 입력해 주세요.");
			findPwForm.findPasswordEmail1.focus();
			return;
			
		// 아이디를 입력하지 않은 경우
		} else if(findPwForm.findPasswordUserId.value.length==0) {
			alert("아이디를 입력해 주세요.");
			findPwForm.findPasswordUserId.focus();
			return;
		}
	
		// 이메일 형식이 잘못된 경우
		if(findPasswordEmailCheck.indexOf(".")<0) {
			alert("올바른 이메일 형식이 아닙니다.");
			$("input[name=findPasswordEmail2]").val("");
			findPwForm.findPasswordEmail2.focus();
			return;
		} else if(findPwForm.findPasswordEmail1.value.length<3) {
			alert("이메일 길이가 너무 짧습니다.");
			$("input[name=findPasswordEmail1]").val("");
			findPwForm.findPasswordEmail1.focus();
			return;
		
		// 이메일에 공백이 들어갔을 경우
		} else if(findPasswordEmailCheck.indexOf(" ")>=0) {
			alert("이메일에 공백이 들어가면 안 됩니다.");
			$("input[name=findPasswordEmail1]").val("");
			$("input[name=findPasswordEmail2]").val("");
			findPwForm.findPasswordEmail1.focus();
			return;		
			
		// 아이디에 공백이 들어갔을 경우
		} else if(findPasswordUserId.indexOf(" ")>=0) {
			alert("이메일에 공백이 들어가면 안 됩니다.");
			$("input[name=findPasswordUserId]").val("");
			findPwForm.findPasswordUserId.focus();
			return;
		}
		
		var formData = {
				userId: findPasswordUserId,
				email: findPasswordEmail
			}
		
		$.ajax({
			type: "POST",
			url: "/mail/findPw",
			dataType: "json",
			data: formData,
			success: function(res) {
				
				// Find Your Id form submit
				$("findPwForm").submit();
				alert("이메일 전송 성공!");
				
				$(".modal-content:eq("+idx+")").hide();
				$(".modal-content:eq("+Number(idx+1)+")").show();
				idx++;
				
				console.log("인덱스 ++ "+idx);		
			},
			error: function() {
				alert("등록되지 않은 아이디 혹은 이메일입니다.");
			}
			
		});
	});
	
	// bar 가입 버튼 눌렀을 때
	$(".btnBarJoin").click(function() {
		var roleId = 1; // roleId를 1로 줌
		var genreNo = $("#barGenre").val();
		var profileNum = 0;
		
		console.log(genreNo);
		
	    // 넘겨 줄 값 설정
	    var formData = {
	    	userId: $("#joinUserId").val(),
	    	roleId: roleId,
	    	userName: $("#joinUserName").val(),
	    	password: $("#joinPassword").val(),
	    	telcom: $("#joinTelcom").val(),
	    	contact: $("#joinContact1").val()+$("#joinContact2").val()+$("#joinContact3").val()*1,
	    	email: $("#joinEmail1").val()+"@"+$("#joinEmail2").val(),
	    	barName: $("#barName").val(),
	    	manager: $("#manager").val(),
	    	locationName: $("#addr1").val().substring(0,2),
	    	barAddress: $("#addr1").val()+" "+$("#addr2").val(),
	    	barInfo: $("#barInfo").val(),
	    	genreNo: $("#barGenre").val(),
	    	profileNum: profileNum
	    };
	    
		$.ajax({
			type: "POST",
			url: "/member/join",
			dataType: "json",
			data: formData,
			success: function(res) {
				
				// join form submit
				$("joinForm1").submit();
				$("joinForm2").submit();
				
			},
			error: function() {
				alert("회원가입 실패");
			}
			
		});
		
		$(".modal-content:eq("+idx+")").hide();
		$(".modal-content:eq("+Number(idx+2)+")").show();
		idx+=2;
		
		console.log("인덱스 +=2 "+idx);
	});
	
	$(".btnBandJoin").click(function() {
		var roleId = 2;
		var genreNo = $("#bandGenre").val();
		var profileNum = 0;
		
		var bandMember1 = $("input[name=bandMember]:eq(0)").val();
		var bandMember2 = $("input[name=bandMember]:eq(1)").val();
		var bandMember3 = $("input[name=bandMember]:eq(2)").val();
		var bandMember4 = $("input[name=bandMember]:eq(3)").val();
		var bandMember5 = $("input[name=bandMember]:eq(4)").val();

		var bandMemberPosition1 = $("input[name=bandMemberPosition]:eq(0)").val();
		var bandMemberPosition2 = $("input[name=bandMemberPosition]:eq(1)").val();
		var bandMemberPosition3 = $("input[name=bandMemberPosition]:eq(2)").val();
		var bandMemberPosition4 = $("input[name=bandMemberPosition]:eq(3)").val();
		var bandMemberPosition5 = $("input[name=bandMemberPosition]:eq(4)").val();
		
	    // 넘겨 줄 값 설정
	    var formData = {
	    	userId: $("#joinUserId").val(),
	    	roleId: roleId,
	    	userName: $("#joinUserName").val(),
	    	password: $("#joinPassword").val(),
	    	telcom: $("#joinTelcom").val(),
	    	contact: $("#joinContact1").val()+$("#joinContact2").val()+$("#joinContact3").val(),
	    	email: $("#joinEmail1").val()+"@"+$("#joinEmail2").val(),
	    	bandName: $("#bandName").val(),
	    	genreNo: $("#bandGenre").val(),
	    	profileNum: profileNum,
	    	bandMember1: bandMember1,
	    	bandMember2: bandMember2,
	    	bandMember3: bandMember3,
	    	bandMember4: bandMember4,
	    	bandMember5: bandMember5,
	    	bandPosition1: bandMemberPosition1,
	    	bandPosition2: bandMemberPosition2,
	    	bandPosition3: bandMemberPosition3,
	    	bandPosition4: bandMemberPosition4,
	    	bandPosition5: bandMemberPosition5
	    };
	    	
			$.ajax({
				type: "POST",
				url: "/member/join",
				dataType: "json",
				data: formData,
				success: function(res) {
					
					// join form submit
					$("joinForm1").submit();
					$("joinForm3").submit();
					
				},
				error: function() {
					alert("회원가입 실패");
				}
				
			});

			
			$(".modal-content:eq("+idx+")").hide();
			$(".modal-content:eq("+Number(idx+1)+")").show();
			idx++;
			
			console.log("인덱스 ++ "+idx);
		
	});
	
	// Main 버튼(닫기 버튼) 클릭시
	$(".goToMain").click(function() {
		// 전체 모달 숨기기
		$("#loginModal").hide();
		
		// Form 안의 내용 초기화
			document.getElementById("loginForm").reset();
			document.getElementById("joinAgreePost1").reset();
			document.getElementById("joinAgreePost2").reset();
			document.getElementById("joinForm1").reset();
// 			$("#joinBarPicform").get(0).reset();
			document.getElementById("joinBarPicform").reset();
			document.getElementById("joinForm2").reset();
// 			$("#joinBandPicform").get(0).reset();
			document.getElementById("joinBandPicform").reset();
			document.getElementById("joinForm3").reset();
			document.getElementById("findIdForm").reset();
			document.getElementById("findPwForm").reset();
			$("#joinIdCheck").css("color", "red");
			$("#joinUserNameCheck").css("color", "red");
			$("#joinPwCheck").css("color", "red");
			$("#joinContactChk").css("color", "red");
			$("#joinBarNameChk").css("color", "red");
			$("#joinBarManagerChk").css("color", "red");
			$("#joinBarAddressChk").css("color", "red");
			$("#joinBandNameChk").css("color", "red");
		
		idx=0;
	});
	
	// x 버튼(닫기 버튼) 클릭시
	$(".close").click(function() {
		// 전체 모달 숨기기
		$("#loginModal").hide();
		
		// Form 안의 내용 초기화
			document.getElementById("loginForm").reset();
			document.getElementById("joinAgreePost1").reset();
			document.getElementById("joinAgreePost2").reset();
			document.getElementById("joinForm1").reset();
// 			$("#joinBarPicform").get(0).reset();
			document.getElementById("joinBarPicform").reset();
			document.getElementById("joinForm2").reset();
// 			$("#joinBandPicform").get(0).reset();
			document.getElementById("joinBandPicform").reset();
			document.getElementById("joinForm3").reset();
			document.getElementById("findIdForm").reset();
			document.getElementById("findPwForm").reset();
			$("#joinIdCheck").css("color", "red");
			$("#joinUserNameCheck").css("color", "red");
			$("#joinPwCheck").css("color", "red");
			$("#joinContactChk").css("color", "red");
			$("#joinBarNameChk").css("color", "red");
			$("#joinBarManagerChk").css("color", "red");
			$("#joinBarAddressChk").css("color", "red");
			$("#joinBandNameChk").css("color", "red");
		
		idx=0;
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
	
	// 아이디 찾기 당시 이메일 뒷부분 처리
	$("#findIdEmailCheck").change(function() {
		$("#findIdEmailCheck option:selected").each(function() {
			if($(this).val() == '0') { // 아무것도 선택 안 되어 있을 경우
				$("#findUserIdEmail2").val(''); // 값 초기화
				$("#findUserIdEmail2").attr("disabled", true); // 비활성화
			} else if($(this).val() == '9') { // 직접 입력일 경우
				$("#findUserIdEmail2").val(''); // 값 초기화
				$("#findUserIdEmail2").attr("disabled", false); // 활성화
			} else {
				$("#findUserIdEmail2").val($(this).text()); // 선택값 입력
				$("#findUserIdEmail2").attr("disabled", true) // 비활성화
			}
		});
	});
	
	// 비밀번호 찾기 당시 이메일 뒷부분 처리
	$("#findPwEmailCheck").change(function() {
		$("#findPwEmailCheck option:selected").each(function() {
			if($(this).val() == '0') { // 아무것도 선택 안 되어 있을 경우
				$("#findPasswordEmail2").val(''); // 값 초기화
				$("#findPasswordEmail2").attr("disabled", true); // 비활성화
			} else if($(this).val() == '9') { // 직접 입력일 경우
				$("#findPasswordEmail2").val(''); // 값 초기화
				$("#findPasswordEmail2").attr("disabled", false); // 활성화
			} else {
				$("#findPasswordEmail2").val($(this).text()); // 선택값 입력
				$("#findPasswordEmail2").attr("disabled", true) // 비활성화
			}
		});
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
	
	.joinAgree {
		text-align: left;
		margin: auto;
	}
	
	table {
		text-align: left;
		margin: auto;
	}
	
	input {
		border: 1px solid #ccc;
		color: black;
		height: 30px;
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
	
		vertical-align: middle;
		
		margin: 30px 30px 30px 30px;
		border: 1px solid #ccc;
		border-radius: 15px;
	}
	
	.modal-dialog {
	    display: inline-block;
		vertical-align: middle;
	}
	
	.modal-content  {
	    -webkit-border-radius: 15px !important;
	    -moz-border-radius: 15px !important;
	    border-radius: 15px !important; 
	}
	
	.barBandJoinTable {
		vertical-align: middle;
		text-align: center;
		margin: auto;
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
	
	.close {
		margin-right: 15px;
		margin-top: 10px;
	}
	
	.backBtn {
		float: left;
		margin-left: 5px;
		margin-top: 10px;
		border: none;
		outline: none;
		background-color: white;
		color: #BDBDBD;
	}
	
	.barJoinImg, .bandJoinImg {
		width: 150px;
		height: 150px;
		border-radius: 20px;
	}
	
	#previewBandPic, #previewBarPic {
		height: 100px;
		width: 100px;
		border-radius: 50px;
	}
	
	#btnLogin, .btnBarJoin, .btnBandJoin, .findIdBtn, .findPwBtn, .deleteMember,
			.findIdConfirmBtn, .findPwConfirmBtn, .goToMain {
		border: none;
		outline: none;
		color: gold;
		background-color: #181818;
		
		height: 40px;
		width: 80%;
	}
	
	.nextBtn {
		border: 1px solid white;
		outline: none;
		background-color: white;
		
		font-weight: bold;
		
		height: 40px;
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
	
	.mainImage {
		width:300px;
		height:150px;
		cursor:pointer;
	}
	
	.searchBtn {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
	}
	
	.acceptBtnBlue {
		color: white;
		font-weight: bold;
		background: MidnightBlue ;
		border-radius:10px;
		border-color: MidnightBlue ;
	}
	
	.acceptBtnRed {
		color: white;
		font-weight: bold;
		background: IndianRed  ;
		border-radius:10px;
		border-color: IndianRed  ;
	}
	
	table.type10 tr th {
		text-align: center;
		color:#000;
		background-color: gold;
	}
	
	table.type10 tr td {
		text-align: center;
/* 		border-left: 1px solid white; */
/* 		border-right: 1px solid white; */
		color:#fff;
		background-color: black;
	}
	
	table.type10 {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
/* 	    border-top: 1px solid #ccc; */
/* 	    border-bottom: 1px solid #ccc; */
/* 	    margin: 20px 10px; */
	    width: 700px;
	}
	
	table.type10 thead th {
/*  	    width: 700px; */
 	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: black;
	    background: gold;
	    margin: 20px 10px;
	    border-radius:200px;
	}
	table.type10 tbody th {
 	    width: 150px; 
	    padding: 10px;
	}
	
	table.type10 tbody tr:hover {
	    width: 150px;
/* 	    padding: 10px; */
	    background:gold;
	}
	
	table.type10 td {
 	    width: 700px;
	    padding: 10px;
	}
	table.type10 .even {
	    background: #222 ;
	}
	
</style>
<!-- 헤더 타이틀 -->
<div >
	<img src="../resources/mainImage.png" class="mainImage" onclick="location.href='/main' ">
</div>

<!-- 헤더 메뉴 -->
<div id="headerMenu">
	<ul>
	<li><a href="/bar/barlist">Bar</a></li>
	
	<li><a href="/band/bandList">Band</a>
		<ul>
			<li><a href="#">Bebob</a></li>
			<li><a href="#">Swing</a></li>
			<li><a href="#">Punk</a></li>
			<li><a href="#">Modern</a></li>
			<li><a href="#">Bosa Nova</a></li>
			<li><a href="#">Boogie Woogie</a></li>
		</ul>
	</li>
	
	<li><a href="/advertise/list">Advertise</a>
		<ul>
			<li><a href="/advertise/list">ALL List</a></li>
			<li><a href="/advertise/adscate">MemBer</a></li>
			<li><a href="/advertise/adscateCol">Collaboration</a></li>
		</ul>
	</li>
	
	<li><a href="/notice/list">Board</a>
		<ul>
			<li><a href="/notice/list">Notice</a></li>
			<li><a href="/faq/list">FAQ</a></li>		
		</ul>
	</li>
	
	<c:if test="${not login }">
	<li><button class="loginBtn" data-target="#loginModal" data-backdrop="false" data-toggle="modal">Login</button>
	</li>
	</c:if>
	
	<c:if test="${login }">
	<li><a>${loginInfo.userName }</a>님
		<ul>
			<li><a href="/mypage/info">계정관리</a></li>
			<li><a href="/member/logout">로그아웃</a></li>
			<li><a data-toggle="modal" href="/main#deleteMemberModal" class="deleteMemberBtn" style="cursor: pointer;">계정탈퇴</a></li>
		</ul>
	</li>
	</c:if>
	
	</ul>
</div><br>

<!-- <!-- <?php -->
<!-- 	$R['bandMemberAdd'] = isset($R['bandMemberAdd'])? $R['kor']:"; -->
<!-- <!-- ?> -->

<!-- 로그인 모달 #0 -->
<div class="modal modal-center fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none">
  <div class="modal-dialog modal-lg" style="width: 30%;">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center" style="height: 330px;">
    	<br>
        <h3 class="modal-title text-center" style="color: black;"><b>Login</b></h3><br> 
            <form id="loginForm" action="/member/login" method="post" name="loginPost">
		        <br>
				&nbsp;<input type="text" style="width: 80%; margin-bottom: 10px; color: black;" id="userId" name="userId" placeholder=" 회원 아이디"/><br>
				&nbsp;&nbsp;<input type="password" style="width: 80%; color: black;" id="password" name="password" placeholder=" 비밀번호"/>
				<br><br>
			</form>
			&nbsp;&nbsp;<button type="button" id="btnLogin"><b>로그인</b></button>
      		<br><br><br>
      	<a data-toggle="modal" class="nextBtn" style="cursor: pointer; color: #6E6E6E;">회원가입</a>&nbsp;&nbsp;&nbsp;
      	<a data-toggle="modal" class="findIdPw" style="cursor: pointer; color: #6E6E6E;">아이디/비밀번호 찾기</a>
      </div>
    </div>


<!-- 회원가입 서비스 약관 동의 모달 1 #1 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal"><b>&times;</b></button>
      <div class="modal-body text-center" style="height: 450px;">
        <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Join</b></h3>
        	<div class="joinInfo text-right" style="color: black; font-size: 11px;"><br>
      			<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	  	</div> 
     	 <div class="agreeDiv"><br>
	     	 <div class="text-left" style="color: black; padding-bottom: 12px; font-size: 13px;"><b>ㆍ 서비스 약관 동의&nbsp;<font color="red">*</font></b></div>
	      	<div class="joinAgree" style="color: black; overflow-y: scroll; height: 200px; width: 100%; border:2px solid #ccc; border-radius: 5px;">
	      		<p class="text-center"><b>제 1 장 총 칙</b><br>제 1 조 목적</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 약관은 서비스 이용자가 JazzBar(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.<br>
				<br>
				<p class="text-center">제 2 조 (약관의 명시, 효력 및 개정)</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;② 회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;③ 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;④ 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.<br>
				<br>
				<p class="text-center"><b>제 2 장 회원의 가입 및 관리</b>	<br>제 3 조 (회원가입절차)</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;① 서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;② 회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이 동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지 “확인” 단추를 누르는 방법으로 합니다. 다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를 제출하도록 할 수 있습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;③ 법인고객 회원가입의 경우 회원가입 신청서의 제출, 서비스 이용대금의 납부 이외에 회사가 정하는 추가 서류의 제출이 추가적으로 필요합니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;④ 법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가 다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.<br>
	      	</div>
		      	<div class="text-center" style="color: black; padding-top: 10px;">
			      	<form name="joinAgreePost1" id="joinAgreePost1">
			      	<table>
			      	<tr>
				      	<td><input type="radio" name="joinAgree1" value="disagree" checked="checked"></td><td>&nbsp;동의하지 않습니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				      	<td><input type="radio" name="joinAgree1" value="agree"></td><td>&nbsp;동의합니다</td></tr>
			      	</table>
			      	</form>
		      	</div>
         </div>
			<br>
 			<button type="button" style="color: black;" class="nextBtn">Next &#62;</button>
      		<br>
      </div>
    </div>

<!-- 회원가입 서비스 약관 동의 모달 2 #2 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal"><b>&times;</b></button>
      <div class="modal-body text-center" style="height: 450px;">
        <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Join</b></h3>
        	<div class="joinInfo text-right" style="color: black; font-size: 11px;"><br>
      			<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	  	</div> 
     	 <div class="agreeDiv"><br>
	     	 <div class="text-left" style="color: black; padding-bottom: 12px; font-size: 13px;"><b>ㆍ 개인정보 수집 및 이용 동의&nbsp;<font color="red">*</font></b></div>
	      	<div class="joinAgree" style="color: black; overflow-y: scroll; height: 200px; width: 100%; border:2px solid #ccc; border-radius: 5px;">
			&nbsp;&nbsp;&nbsp;(주)JazzBar는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.<br><br>
				<p class="text-center"><b>1. 수집목적</b></p>
				• 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록 <br>
				• 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달 <br>
				• 유료 서비스 이용 시 요금 정산 <br>
				• 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용<br> 
				• 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 <br>
				• 프라이버시 보호 측면의 서비스 환경 구축 <br><br>
				<p class="text-center"><b>2. 수집항목</b></p>
				(필수) 아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택)<br><br> 
				<p class="text-center"><b>3. 보유기간</b></p>
				수집된 정보는 회원탈퇴 후 지체없이 파기됩니다. 다만 내부 방침에 의해 서비스 부정이용기록은 부정 가입 및 이용 방지를 위하여 회원 탈퇴 시점으로부터 최대 1년간 보관 후 파기하며, 관계법령에 의해 보관해야 하는 정보는 법령이 정한 기간 동안 보관한 후 파기합니다.<br> 				
				서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다.<br> 
				더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.<br>
	      	</div>
		      	<div class="text-center" style="color: black; padding-top: 10px;">
			      	<form name="joinAgreePost2" id="joinAgreePost2">
			      	<table>
			      	<tr>
				      	<td><input type="radio" name="joinAgree2" value="disagree" checked="checked"></td><td>&nbsp;동의하지 않습니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				      	<td><input type="radio" name="joinAgree2" value="agree"></td><td>&nbsp;동의합니다</td></tr>
			      	</table>
			      	</form>
		      	</div>
         </div>
         <br>
 			<button type="button" style="color: black;" class="nextBtn">Next &#62;</button>
      		<br>
      </div>
    </div>

<!-- 회원가입 모달 1 #3 -->
<form id="joinForm1" name="joinPost" class="joinForm">
    <div class="modal-content" id="joinModal1">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 480px;">
      ㅏ
        <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Join</b></h3>
        	<div class="joinInfo text-right" style="color: black; font-size: 11px;"><br>
      			<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	  	</div>
		        <table style="border: none; height: 300px; width: 100%; color: black">
				<tr>
				<td><font color="red">*</font>&nbsp;<input type="text" id="joinUserId" name="joinUserId" oninput="checkId()" placeholder=" 아이디" />&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinIdCheck" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span></td>
				</tr>
				<tr>
				<td><font color="red">*</font>&nbsp;<input type="text" id="joinUserName" name="joinUserName" oninput="checkNick()" placeholder=" 닉네임"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinUserNameCheck" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span></td>
				</tr>
				<tr>
				<td><font color="red">*</font>&nbsp;<input type="password" id="joinPassword" name="joinPassword" oninput="checkPw()" placeholder=" 비밀번호"/></td>
				</tr>
				<tr>
				<td><font color="red">*</font>&nbsp;<input type="password" id="passwordChk" name="passwordChk" oninput="checkPw()" placeholder=" 비밀번호 확인"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinPwCheck" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span></td>
				</tr>
				<tr>
				<td><font color="red">*</font>
					<select id="joinTelcom" name="joinTelcom" style="color: black; width: 18%; height: 28px">
						<option value="SK" selected>SKT</option>
						<option value="KT">KT</option>
						<option value="LG">LGT</option>
					</select>&nbsp;
						<input type="text" style="width: 50px" maxlength="3" size="3" name="joinContact1" id="joinContact1" oninput="checkContact()" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
						<input type="text" style="width: 50px" maxlength="4" size="4" name="joinContact2" id="joinContact2" oninput="checkContact()" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
						<input type="text" style="width: 50px" maxlength="4" size="4" name="joinContact3" id="joinContact3" oninput="checkContact()" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/>
						<span class="glyphicon glyphicon-ok" id="joinContactChk" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span></td>
				</tr>
				<tr>
				<td><font color="red">*</font>
						<input type="text" id="joinEmail1" name="joinEmail1" style="width: 110px;" placeholder=" 이메일"/> @ 
						<input type="text" name="joinEmail2" id="joinEmail2" style="color: black; width: 75px" disabled value=""/>
							<select name="joinEmailCheck" id="joinEmailCheck" style="color: black; width: 85px; height: 30px;">
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
 			<button type="button" style="color: black;" class="nextBtn">Next &#62;</button>
      		<br>
      </div>
    </div>
</form>

<!-- 회원가입 모달 2 #4 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 330px;">
        <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Join As</b></h3>
		        <br>
		        <div style="padding-top: 30px;">
			        <table style="border: none;" class="barBandJoinTable">
					<tr>
					<td>
						<a data-toggle="modal" class="nextBtn1" style="cursor: pointer;" id="barJoin"><img class="barJoinImg" src="${pageContext.request.contextPath}/resources/joinImg/barJoin.JPG"></a>
					</td>
					<td style="padding-left: 15px;">
						<a data-toggle="modal" class="nextBtn2" style="cursor: pointer;" id="bandJoin"><img class="bandJoinImg" src="${pageContext.request.contextPath}/resources/joinImg/bandJoin.JPG"></a>
					</td>
					</tr>
					<tr>
					<td class="text-center" style="color: black"><b>Bar Owner</b></td>
					<td class="text-center" style="color: black"><b>Band</b></td>
					</table>
				</div>
				<br><br>
      </div>
    </div>

<!-- 회원가입 모달 3, bar join #5 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 650px;">
         <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Bar</b></h3>
         <div class="joinInfo text-right" style="color: black; font-size: 11px;"><br>
      		<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	 </div> 
		        <br>
		        <form id="joinBarPicform" name="joinBarPicform" class="joinBarPicform" enctype="multipart/form-data">
      			<img class="text-center" id="previewBarPic" src="../resources/joinImg/profileBasic.jpg">
      			<button class="barPicAdd" style="border: 1px solid white; color: black; margin-bottom: 50px; background-color: white;"><span class="glyphicon glyphicon-picture" style="top: 40px; right: 10px;" aria-hidden="true"></span></button>
      			<input type="file" id="joinBarPic" style="display: none;">
      			</form>
      			<form id="joinForm2" name="joinPost2" class="joinForm">
		        <table style="border: none; height: 350px; width: 100%; color: black;">
				<tr>
				<td>
				<input type="text" name="barRoleId" id="barRoleId" value="1" style="display: none;">
				<font color="red">*</font>&nbsp;<input type="text" name="barName" id="barName" oninput="checkBarName()" placeholder=" bar 이름"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinBarNameChk" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span>
				</td></tr>
				<tr>
				<td><font color="red">*</font>&nbsp;<select name="barGenre" id="barGenre" style="color: black; width: 170px; height: 26px; ">
						<option value="0" selected style="padding-left: 30px"> ::: 장르 선택 :::</option>
						<option value="1">Bebob</option>
						<option value="2">Swing</option>
						<option value="3">Punk</option>
						<option value="4">Modern</option>
						<option value="5">Bosa Nova</option>
						<option value="6">Boogie Woogie</option>
					</select>
				<tr>
				<td><font color="red">*</font>&nbsp;<input type="text" name="manager" id="manager" oninput="checkBarManager()" placeholder=" 담당자 이름"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinBarManagerChk" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span>
				</td></tr>
				<tr>
				<td><font color="red">*</font>
						<input type="text" id="addr1" name="addr1" oninput="checkBarAddress()" placeholder=" bar 주소" style="width: 225px;"/>
						<input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-xs"/>
				</td></tr>
				<tr><td>
				<input type="text" id="addr2" name="addr2" oninput="checkBarAddress()" placeholder=" 상세 주소" style="width: 250px; margin-left: 10px;"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinBarAddressChk" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span></td></tr>
				<tr><td><textarea rows="4" cols="40" style="resize: none; margin-left: 10px;" id="barInfo" name="barInfo" placeholder=" bar 소개"></textarea>
				</td></tr>
				</table>
				</form>
				<br>
 				<button type="button" class="btnBarJoin"><b>회원가입</b></button><br>
      		<br>
      </div>
    </div>
    
    <!-- 회원가입 모달 4, band join #6 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 600px;">
         <h3 class="modal-title text-center" style="color: black; padding-top: 8px;"><b>Band</b></h3>
         <div class="joinInfo text-right" style="color: black; font-size: 11px; padding-bottom: 15px;"><br>
      		<font color="red">*</font> 표시가 된 부분은 필수 항목입니다
    	 </div> 
      			<form id="joinBandPicform" name="joinBandPicform" class="joinBandPicform" enctype="multipart/form-data">
      			<img id="previewBandPic" src="../resources/joinImg/profileBasic.jpg">
      			<button class="bandPicAdd" style="color: black; border: 1px solid white; background-color: white;"><span class="glyphicon glyphicon-picture" style="top: 40px; right: 10px;" aria-hidden="true"></span></button>
      			<input type="file" id="joinBandPic" style="display: none;">
      			</form>
      	    <form id="joinForm3" name="joinPost3" class="joinForm">
      		<table style="border: none; height: 300px; width: 100%; color: black;" >
				<tr>
				<td>
				<input type="text" name="bandRoleId" id="bandRoleId" value="2" style="display: none;">
				<font color="red">*</font>&nbsp;<input type="text" oninput="checkBandName()" name="bandName" id="bandName" placeholder=" Band 이름"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok" id="joinBandNameChk" style="width: 20px; color: red; height: 20px;" aria-hidden="true"></span>
				</td></tr>
				<tr>
				<td><font color="red">*</font>&nbsp;<select name="bandGenre" id="bandGenre" style="color: black; width: 170px; height: 26px; ">
						<option value="0" selected style="padding-left: 30px"> ::: 장르 선택 :::</option>
						<option value="1">Bebob</option>
						<option value="2">Swing</option>
						<option value="3">Punk</option>
						<option value="4">Modern</option>
						<option value="5">Bosa Nova</option>
						<option value="6">Boogie Woogie</option>
					</select></td></tr>
					<tr><td style="padding-left: 9px">
						<input type="text" name="bandMember" class="input" style="margin-bottom: 10px; width: 130px;" placeholder=" Band Member 추가"/>
						 - <input type="text" name="bandMemberPosition" class="input" style="margin-bottom: 10px; width: 130px;" placeholder=" 포지션"/>
						
						<a href="#" class="AddBandMemberBtn"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
						<div class="bandMemberAdd"></div>
			</table><br>
			</form>
			<button type="button" class="btnBandJoin"><b>회원가입</b></button><br>
			<br>
      </div>
    </div>
    
<!-- 회원가입 모달 5, 회원 완료 #7 -->
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 180px;">
         <h3 class="modal-title text-center" style="color: black;"><b>Join</b></h3>
 			<br><font style="color: black">회원가입이 완료되었습니다!<br>감사합니다!</font>
				<br>
 				<button type="button" class="goToMain" data-dismiss="modal" style="margin-top: 10px;"><b>Main</b></button>
      		<br>
      </div>
    </div>


<!-- 아이디 / 비밀번호 찾기 모달, ID PW 확인 #8 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 300px;"><br>
         <h3 class="modal-title text-center" style="color: black;"><b>Find Your ID/PW</b></h3>
		      <table style="border: none; height: 170px; width: 100%; color: black; margin-left: 33px; margin-top: 20px;" >
				<tr><td>
				<button type="button" class="findIdBtn"><b>아이디 찾기</b></button>
				</td></tr>
				<tr><td style="padding-top: 10px;">
				<button type="button" class="findPwBtn"><b>비밀번호 찾기</b></button>
			  </table><br>
      		<br>
      </div>
    </div>
    
<!-- 아이디 찾기 모달, ID 확인 #9 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 300px;">
         <h3 class="modal-title text-center" style="color: black;"><b>Find Your ID</b></h3>
		      <form id="findIdForm" name="findIdForm" class="findIdForm">
		      <table style="border: none; height: 150px; width: 100%; color: black; margin-top: 20px;" >
				<tr class="text-center"><td><font style="font-size: 13px;">가입한 계정의 <b>이메일</b>과 <b>전화번호</b>를 입력해 주세요</font></td></tr>
				<tr><td>
				<font color="red">*</font>&nbsp;
				<input type="text" id="findUserIdEmail1" name="findUserIdEmail1" style="width: 100px;" placeholder=" 이메일"/> @ 
				<input type="text" name="findUserIdEmail2" id="findUserIdEmail2" style="color: black; width: 80px" disabled value=""/>
					<select name="findIdEmailCheck" id="findIdEmailCheck" style="color: black; width: 90px; height: 30px;">
						<option value="0" selected> ::: 선택 :::</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="9">직접 입력</option>
					</select>
				</td></tr>
				<tr><td style="padding-top: 10px;">
					<font color="red">*</font>&nbsp;
					<select id="findIdTelcom" name="findIdTelcom" style="color: black; width: 20%; height: 28px">
						<option value="SK" selected>SKT</option>
						<option value="KT">KT</option>
						<option value="LG">LGT</option>
					</select>&nbsp;
					<input type="text" style="width: 50px" name="findIdContact1" id="findIdContact1" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
					<input type="text" style="width: 50px" name="findIdContact2" id="findIdContact2" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/> -
					<input type="text" style="width: 50px" name="findIdContact3" id="findIdContact3" onkeydown="return onlyNum(event)" onkeyup='removeChar(event)'/>
				</td></tr>
			  </table><br></form>
				<button type="button" class="findIdConfirmBtn"><b>아이디 찾기</b></button>
      		<br>
      </div>
    </div>
    
<!-- 비밀번호 찾기 모달, PW 확인 #10 -->
    <div class="modal-content">
        <button class="backBtn"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></button>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 300px;">
         <h3 class="modal-title text-center" style="color: black;"><b>Find Your PW</b></h3>
		      <form id="findPwForm" name="findPwForm" class="findPwForm">
		      <table style="border: none; height: 150px; width: 100%; color: black; margin-top: 20px;" >
				<tr class="text-center"><td><font style="font-size: 13px;">가입한 계정의 <b>아이디</b>와 <b>이메일</b>을 입력해 주세요</font></td></tr>
				<tr><td>
				<font color="red">*</font>&nbsp;<input type="text" name="findPasswordUserId" id="findPasswordUserId" placeholder=" 아이디"/>				</td></tr>
				<tr><td style="padding-top: 10px;">
				<font color="red">*</font>&nbsp;
				<input type="text" id="findPasswordEmail1" name="findPasswordEmail1" style="width: 100px;" placeholder=" 이메일"/> @ 
				<input type="text" name="findPasswordEmail2" id="findPasswordEmail2" style="color: black; width: 80px" disabled value=""/>
					<select name="findPwEmailCheck" id="findPwEmailCheck" style="color: black; width: 90px; height: 30px;">
						<option value="0" selected> ::: 선택 :::</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="9">직접 입력</option>
					</select></td></tr>
			  </table><br></form>
				<button type="button" class="findPwConfirmBtn"><b>비밀번호 찾기</b></button>
      		<br>
      </div>
    </div>
    
<!-- 아이디 / 비밀번호 찾기 완료 모달, ID/PW 확인 완료 #11 -->
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 150px;">
         <h3 class="modal-title text-center" style="color: black;"><b>Find Your ID/PW</b></h3>
		    <br><font style="color: black">이메일이 전송되었습니다!<br>이용해 주셔서 감사합니다!</font>
      		<br>
      </div>
    </div>
 </div>
</div>
    
<!-- 계정 탈퇴 모달 #12 -->
<div class="modal modal-center fade" id="deleteMemberModal" tabindex="12" role="dialog" aria-hidden="true" style="display: none">
  <div class="modal-dialog modal-lg" style="width: 30%;">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div class="modal-body text-center"  style="height: 250px;">
         <h3 class="modal-title text-center" style="color: black;"><b>Delete Your Account</b></h3>
		      <form name="deleteAgreeForm" id="deleteAgreeForm">
		      <table class="text-center" style="border: none; border-spacing: 20px 25px; height: 100px; width: 80%; color: black;  margin-top: 20px; margin-left: 33px; " >
				<tr style="height: 30px;"><td colspan="4">
				<font class="text-center">모든 정보가 삭제됩니다.<br><b>탈퇴</b>하시겠습니까?</font>
				<input type="text" id="memberDeleteId" value="${loginInfo.userId }" style="display: none;">
				<input type="text" id="memberDeleteRoleId" value="${loginInfo.roleId }" style="display: none;">
				</td></tr>
				<tr>
					<td style="height: 20px; width: 20px;"><input type="radio" name="deleteMemberAgree" value="disagree" checked="checked"></td><td style="width: 165px; padding-right:20px">동의하지 않습니다</td>
				    <td style="width: 20px;"><input type="radio" name="deleteMemberAgree" value="agree"></td><td style="width: 85px">동의합니다</td></tr>
			  </table>
			  </form><br>
					<button type="button" class="deleteMember"><b>회원 탈퇴</b></button>
      </div>
    </div>
</div>
</div>
<hr>