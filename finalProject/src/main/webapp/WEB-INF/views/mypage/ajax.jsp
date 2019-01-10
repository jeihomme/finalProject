<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function viewMypageInfo(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/info"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageModifyInfo(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/modifyInfo"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageUserAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/userAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageBoardAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/boardAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
// 	-------------------------------------------------------------------
	function viewMypageIntro(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/intro"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageAppToBand(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/applicationToBand"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageCalendar(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/calendar"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
// 	----------------------------------------------------------------------
	function viewMypageRecommand(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/recommand"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				alert("실패");
			}
		});
	}
	
	function viewMypageAppToBar(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/applicationToBar"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function searchAppFromBand(){
		
		var appStartDate = $("#appStartDate").val()
		var appEndDate = $("#appEndDate").val()
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/applicationToBand"
			, dataType: "html"
			, data: {
				"appStartDate": appStartDate
				, "appEndDate": appEndDate
			}
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				alert("실패");
			}
		});
	}
	
	function searchAppFromBar(){
		
		var appStartDate = $("#appStartDate").val()
		var appEndDate = $("#appEndDate").val()
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/applicationToBar"
			, dataType: "html"
			, data: {
				"appStartDate": appStartDate
				, "appEndDate": appEndDate
			}
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				alert("실패");
			}
		});
	}
	
	function appToBandAccept(){
		//AJAX 처리하기
		
		var appToBandData = {
				appNo: $("#acceptAppNo").val()
				, accept: $("#acceptAcc").val()
		    };
		console.log(appToBandData);
		$.ajax({ 	
			type: "post"
			, url: "/mypage/applicationToBandAccept"
			, data: appToBandData
			, dataType: "json"
			, success: function( res ) {
				console.log(res);
				viewMypageAppToBand();
			}
			, error: function() {
				console.log(appToBandData);
				alert("실패");
			}
		});
	}

	function appToBandReject(){
		//AJAX 처리하기
		
		var appToBandData = {
				appNo: $("#rejectAppNo").val()
				, accept: $("#rejectAcc").val()
		    };
		console.log(appToBandData);
		$.ajax({ 	
			type: "post"
			, url: "/mypage/applicationToBandAccept"
			, data: appToBandData
			, dataType: "json"
			, success: function( res ) {
				console.log(res);
				viewMypageAppToBand();
			}
			, error: function() {
				console.log(appToBandData);
				alert("실패");
			}
		});
	}

	function viewAppFromBand(){
		//AJAX 처리하기
		
		var appNo = $("#appNo").val();
		var resumesNo = $("#resumesNo").val();
		var read = $("#read").val();
		
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo="+$("#resumesNo").val()
			, data: {
				"appNo": appNo
				, "resumesNo": resumesNo
				, "read": read
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				alert("실패");
			}
		});
	}

	function viewMypageUserAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/userAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function viewMypageBoardAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/boardAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function searchBoardInfo(){
		var searchCategory = document.getElementById("searchCategory").value;
		var searchKeyowrd = document.getElementById("searchKeyowrd").value;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/boardAdmin"
			, data: {
				"searchCategory": searchCategory
				, "searchKeyowrd": searchKeyowrd
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteBoardInfo1(){
		var selectResumesNo = document.getElementById("selectResumesNo1").value;
		console.log(selectResumesNo);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteBoard"
			, data: {
				"resumesNo": selectResumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteBoardInfo2(){
		var selectResumesNo = document.getElementById("selectResumesNo2").value;
		console.log(selectResumesNo);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteBoard"
			, data: {
				"resumesNo": selectResumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteBoardInfo3(){
		var selectResumesNo = document.getElementById("selectResumesNo3").value;
		console.log(selectResumesNo);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteBoard"
			, data: {
				"resumesNo": selectResumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteBoardInfo4(){
		var selectResumesNo = document.getElementById("selectResumesNo4").value;
		console.log(selectResumesNo);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteBoard"
			, data: {
				"resumesNo": selectResumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteBoardInfo5(){
		var selectResumesNo = document.getElementById("selectResumesNo5").value;
		console.log(selectResumesNo);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteBoard"
			, data: {
				"resumesNo": selectResumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function modifyIntro(){
		//AJAX 처리하기
		
		$.ajax({ 	
			type: "get"
			, url: "/mypage/modifyIntro"
			, data: {
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageUserAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/userAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageBoardAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/boardAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function modifyMypageInfo(){
		//AJAX 처리하기
		
// 		var jsonData = {
// 			email: document.getElementById("email").value
// 			, telcom: document.getElementById("telcom").value
// 			, contact: document.getElementById("contact").value
// 			, bandMemName: document.getElementsByName("bandMemName[]")
// 			, mPosition: document.getElementsByName("mPosition[]")
// 		}
		
		var email = document.getElementById("email").value;
		var telcom = document.getElementById("telcom").value;
		var contact = document.getElementById("contact").value;
		
		var bandMemberNo = [];
		var bandMemName = [];
		var mPosition = [];
		
		for(var i=0;i<document.getElementsByName("bandMemName[]").length; i++) {
			bandMemberNo[i] = document.getElementsByName("bandMemberNo[]")[i].value;
			bandMemName[i] = document.getElementsByName("bandMemName[]")[i].value;
			mPosition[i] = document.getElementsByName("mPosition[]")[i].value;
	    }
		
		$.ajaxSettings.traditional = true
		
		$.ajax({ 	
			type: "post"
			, url: "/mypage/modifyInfo"
			, data: {
				"email": email
				, "telcom": telcom
				, "contact": contact
				, "bandMemberNo": bandMemberNo
				, "bandMemName": bandMemName
				, "mPosition": mPosition
			}
			, dataType: "html"
			, success: function( res ) {
				alert("수정 완료!");
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function modifyPw(){
		
		var passwordData = {
				currPassword: $("#currPassword").val()
				, newPasswordFisrt: $("#newPasswordFisrt").val()
				, newPasswordSecond: $("#newPasswordSecond").val()
		    };
		//AJAX 처리하기
		$.ajax({ 	
			type: "POST"
			, url: "/mypage/modifyPw"
			, dataType: "json"
			, data: passwordData
			, success: function( res ) {
				$(".close").click();
			}
			, error: function() {
// 				console.log(passwordData);
				alert("현재 비밀번호 혹은 새로운 비밀번호가 틀렸습니다.");
			}
		});
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
//	  			document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('barAddress').value = fullAddr;
				// 커서를 상세주소 필드로 이동한다.
//	  			document.getElementById('addr2').focus();
//	  			$("input[name=addr2]").val("");
			}
		}).open();
	}

	function modifyIntro(){
		//AJAX 처리하기
		
		var introData = {
				locationNo: $("#locationNo").val()
				, genreNo: $("#genreNo").val()
				, barAddress: $("#barAddress").val()
				, barInfo: $("#modifyBarInfo").val()
				, barNo: $("#barNo").val()
		    };
		
		$.ajax({ 	
			type: "post"
			, url: "/mypage/modifyIntro"
			, data: introData
			, dataType: "json"
			, success: function( res ) {
				console.log(res);
				viewMypageIntro();
			}
			, error: function() {
				console.log(introData);
				alert("실패");
			}
		});
	}

	function viewMypageUserAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/userAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function viewMypageBoardAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/boardAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function searchUserInfo(){
		var searchCategory = document.getElementById("searchCategory").value;
		var searchKeyowrd = document.getElementById("searchKeyowrd").value;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/userAdmin"
			, data: {
				"searchCategory": searchCategory
				, "searchKeyowrd": searchKeyowrd
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteUserInfo1(){
		var selectUserId = document.getElementById("selectUserId1").value;
		console.log(selectUserId);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteUser"
			, data: {
				"userId": selectUserId
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteUserInfo2(){
		var selectUserId = document.getElementById("selectUserId2").value;
		console.log(selectUserId);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteUser"
			, data: {
				"userId": selectUserId
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteUserInfo3(){
		var selectUserId = document.getElementById("selectUserId3").value;
		console.log(selectUserId);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteUser"
			, data: {
				"userId": selectUserId
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteUserInfo4(){
		var selectUserId = document.getElementById("selectUserId4").value;
		console.log(selectUserId);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteUser"
			, data: {
				"userId": selectUserId
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteUserInfo5(){
		var selectUserId = document.getElementById("selectUserId5").value;
		console.log(selectUserId);
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteUser"
			, data: {
				"userId": selectUserId
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function addMemberlist(){
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/addMemberlist"
			, data: {
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minMemberlist1(){
		
		var bandNo = document.getElementById("bandNo").value;
		
		console.log(bandNo);
		
		var rnum = 1;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minMemberlist"
			, data: {
				"bandNo": bandNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minMemberlist2(){
			
		var bandNo = document.getElementById("bandNo").value;
		
		console.log(bandNo);
		
		var rnum = 2;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minMemberlist"
			, data: {
				"bandNo": bandNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
		
	}
		
	function minMemberlist3(){
		
		var bandNo = document.getElementById("bandNo").value;
		
		console.log(bandNo);
		
		var rnum = 3;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minMemberlist"
			, data: {
				"bandNo": bandNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minMemberlist4(){
		
		var bandNo = document.getElementById("bandNo").value;
		
		console.log(bandNo);
		
		var rnum = 4;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minMemberlist"
			, data: {
				"bandNo": bandNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minMemberlist5(){
		
		var bandNo = document.getElementById("bandNo").value;
		
		console.log(bandNo);
		
		var rnum = 5;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minMemberlist"
			, data: {
				"bandNo": bandNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
// 				viewMypageModifyInfo();
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
function viewResumes(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		var musicNo = document.getElementById("musicNo").value;
		var bandNo = document.getElementById("bandNo").value;
		
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
				, musicNo: musicNo
				, bandNo: bandNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewResumes1(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[0];
		console.log(resumesNo);
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewResumes2(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[1];
		
		console.log(resumesNo);
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewResumes3(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[2];
		
		console.log(resumesNo);
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewResumes4(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[3];
		
		console.log(resumesNo);
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewResumes5(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[4];
		
		console.log(resumesNo);
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/resumes?resumesNo=" + resumesNo
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function viewNewResumes(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/modifyResumes"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewModifyResumes(){
		
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[0];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/modifyResumes"
			, data: {
				"resumesNo": resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteResumes1(){
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[0];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteResumes"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteResumes2(){
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[1];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteResumes"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteResumes3(){
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[2];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteResumes"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteResumes4(){
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[3];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteResumes"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteResumes5(){
		var resumesNoList = [];
		
		for(var i=0;i<document.getElementsByName("resumesNo[]").length; i++) {
			resumesNoList[i] = document.getElementsByName("resumesNo[]")[i].value;
	    }
		
		var resumesNo = resumesNoList[4];
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/deleteResumes"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	
	function modifyResumesProc(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		var musicNo = document.getElementById("musicNo").value;
		var bandNo = document.getElementById("bandNo").value;
		var bandInfo = document.getElementById("bandInfo").value;
		var resumesTitle = document.getElementById("resumesTitle").value;
		var musicNo = document.getElementById("musicNo").value;
		var genreNo = document.getElementById("genreNo").value;
		
		var year = [];
		var historyNo = [];
		var historyInfo = [];
		
		for(var i=0;i<document.getElementsByName("year[]").length; i++) {
			year[i] = document.getElementsByName("year[]")[i].value;
			historyNo[i] = document.getElementsByName("historyNo[]")[i].value;
			historyInfo[i] = document.getElementsByName("historyInfo[]")[i].value;
	    }
		
		console.log( year );
		console.log( historyNo );
		console.log( historyInfo );
		
		$.ajaxSettings.traditional = true
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/modifyResumesProc"
			, data: {
				resumesNo: resumesNo
				, musicNo: musicNo
				, bandNo: bandNo
				, bandInfo: bandInfo
				, resumesTitle: resumesTitle
				, musicNo: musicNo
				, genreNo: genreNo
				, year: year
				, historyNo: historyNo
				, historyInfo: historyInfo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function addHistorylist(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/addHistorylist"
			, data: {
				resumesNo: resumesNo
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minHistorylist1(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		var rnum = 1;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minHistorylist"
			, data: {
				"resumesNo": resumesNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
function minHistorylist2(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		var rnum = 2;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minHistorylist"
			, data: {
				"resumesNo": resumesNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minHistorylist3(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		var rnum = 3;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minHistorylist"
			, data: {
				"resumesNo": resumesNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minHistorylist4(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		var rnum = 4;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minHistorylist"
			, data: {
				"resumesNo": resumesNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function minHistorylist5(){
		
		var resumesNo = document.getElementById("resumesNo").value;
		
		var rnum = 5;
		
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/minHistorylist"
			, data: {
				"resumesNo": resumesNo
				, "rnum": rnum
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function oneCheckbox(a){
        var obj = document.getElementsByName("publicResumes");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
                obj[i].checked = false;
            }
        }
    }
	
	function modifyPublicResumes() {
		
		var resumesNo;
		for(var i=0; i<document.getElementsByName("publicResumes").length; i++) {
			if ( document.getElementsByName("publicResumes")[i].checked ) {
				resumesNo  = document.getElementsByName("resumesNo[]")[i].value;
			}
	    }
		console.log(resumesNo);
		
		$.ajax({
			type: "post"
			, url: "/mypage/commitPublicResumes"
				, data: {
					resumesNo: resumesNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function uploadSoundIntro() {
			
		var form = $('#soundFileForm')[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#soundFile")[0].files[0]);

		$.ajax({
			type: "post"
			, url: "/mypage/uploadSoundIntro"
				, data: formData
	        , processData: false
	        , contentType: false
	        , success: function(res){
	            viewMypageIntro();
	            alert("선택된 이력서를 공개합니다.");
	        }
			, error: function() {
				alert("실패");
			}
		});
	}
	
	function uploadProfilePicIntro() {
		var form = $('#profileFileForm')[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#profileFile")[0].files[0]);

		$.ajax({
			type: "post"
			, url: "/mypage/uploadProfilePicIntro"
				, data: formData
	        , processData: false
	        , contentType: false
	        , success: function(res){
	        	viewMypageIntro();
	        }
			, error: function() {
				alert("실패");
			}
		});
		
// 		$.post( "/mypage/uploadProfilePicIntro", {
// 			data: formData
// 			, processData: false
// 			, contentType: false
// 		}, function(jqXHR) {
// 			viewMypageIntro();
// 		}, 'json' /* xml, text, script, html */)
// 		.done(function(jqXHR) {
// 		    console.log( "second success" );
// 		})
// 		.fail(function(jqXHR) {
// 			console.log( "error" );
// 		})
// 		.always(function(jqXHR) {
// 			console.log( "finished" );
// 		});
		
// 		$.get( "example.php?Name=ajax&Age=10", function(jqXHR) {
// 		    alert( "success" );
// 		}, 'json' /* xml, text, script, html */)
// 		.done(function(jqXHR) {
// 		    alert( "second success" );
// 		})
// 		.fail(function(jqXHR) {
// 		    alert( "error" );
// 		})
// 		.always(function(jqXHR) {
// 		    alert( "finished" );
// 		});
	}
	
	function deleteSound1() {
		
		var musicNoList = [];
		var bandNoList = [];
		
		for(var i=0;i<document.getElementsByName("musicNo").length; i++) {
			musicNoList[i] = document.getElementsByName("musicNo")[i].value;
			bandNoList[i] = document.getElementsByName("bandNo")[i].value;
	    }
		
		var musicNo = musicNoList[0];
		var bandNo = bandNoList[0];
		
		$.ajax({
			type: "post"
			, url: "/mypage/deleteSound"
				, data: {
					musicNo: musicNo
					, bandNo: bandNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function deleteSound2() {
		
		var musicNoList = [];
		var bandNoList = [];
		
		for(var i=0;i<document.getElementsByName("musicNo").length; i++) {
			musicNoList[i] = document.getElementsByName("musicNo")[i].value;
			bandNoList[i] = document.getElementsByName("bandNo")[i].value;
	    }
		
		var musicNo = musicNoList[1];
		var bandNo = bandNoList[1];
		
		$.ajax({
			type: "post"
			, url: "/mypage/deleteSound"
				, data: {
					musicNo: musicNo
					, bandNo: bandNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteSound3() {
		
		var musicNoList = [];
		var bandNoList = [];
		
		for(var i=0;i<document.getElementsByName("musicNo").length; i++) {
			musicNoList[i] = document.getElementsByName("musicNo")[i].value;
			bandNoList[i] = document.getElementsByName("bandNo")[i].value;
	    }
		
		var musicNo = musicNoList[2];
		var bandNo = bandNoList[2];
		
		$.ajax({
			type: "post"
			, url: "/mypage/deleteSound"
				, data: {
					musicNo: musicNo
					, bandNo: bandNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteSound4() {
		
		var musicNoList = [];
		var bandNoList = [];
		
		for(var i=0;i<document.getElementsByName("musicNo").length; i++) {
			musicNoList[i] = document.getElementsByName("musicNo")[i].value;
			bandNoList[i] = document.getElementsByName("bandNo")[i].value;
	    }
		
		var musicNo = musicNoList[3];
		var bandNo = bandNoList[3];
		
		$.ajax({
			type: "post"
			, url: "/mypage/deleteSound"
				, data: {
					musicNo: musicNo
					, bandNo: bandNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function deleteSound5() {
		
		var musicNoList = [];
		var bandNoList = [];
		
		for(var i=0;i<document.getElementsByName("musicNo").length; i++) {
			musicNoList[i] = document.getElementsByName("musicNo")[i].value;
			bandNoList[i] = document.getElementsByName("bandNo")[i].value;
	    }
		
		var musicNo = musicNoList[4];
		var bandNo = bandNoList[4];
		
		$.ajax({
			type: "post"
			, url: "/mypage/deleteSound"
				, data: {
					musicNo: musicNo
					, bandNo: bandNo
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
</script>
