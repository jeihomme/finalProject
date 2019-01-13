<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" ></script>

<script type="text/javascript">

//슬라이드 
function barTableDiv() {
  var wid = 0;
  var now_num = 0;
  var barTableDiv_length = 0;
  var auto = null;
  var $barTableDotli = $('.barTableDot>li');
  var $barTablePanel = $('.barTablePanel');
  var $barTablePanelLi = $barTablePanel.children('li');

  // 변수 초기화
  function init() {
    wid = $('#barWindow').width();
    now_num = $('.barTableDot>li.on').index();
    barTableDiv_length = $barTableDotli.length;
  }

  // 이벤트 묶음
  function barTableDivEvent() {

    // 슬라이드 하단 barTableDot버튼 클릭했을때
    $barTableDotli.click(function() {
      now_num = $(this).index();
      barTableDivMove();
    });

    // 이후 버튼 클릭했을때
    $('.barRecNext').click(function() {
      barRecNextChkPlay();
    });

    // 이전 버튼 클릭했을때
    $('.barRecPrev').click(function() {
      barRecPrevChkPlay();
    });

    // 오토플레이
    autoPlay();

    // 오토플레이 멈춤
    autoPlayStop();

    // 오토플레이 재시작
    autoPlayRestart();

    // 화면크기 재설정 되었을때
    resize();
  }

  // 자동실행 함수
  function autoPlay() {
    auto = setInterval(function() {
      barRecNextChkPlay();
    }, 3000);
  }

  // 자동실행 멈춤
  function autoPlayStop() {
    $barTablePanelLi.mouseenter(function() {
      clearInterval(auto);
    });
  }


  // 자동실행 멈췄다가 재실행
  function autoPlayRestart() {
    $barTablePanelLi.mouseleave(function() {
      auto = setInterval(function() {
        barRecNextChkPlay();
      }, 3000);
    });
  }

  // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
  function barRecPrevChkPlay() {
    if (now_num == 0) {
      now_num = barTableDiv_length - 1;
    } else {
      now_num--;
    }
    barTableDivMove();
  }

  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
  function barRecNextChkPlay() {
    if (now_num == barTableDiv_length - 1) {
      now_num = 0;
    } else {
      now_num++;
    }
    barTableDivMove();
  }

  // 슬라이드 무브
  function barTableDivMove() {
    $barTablePanel.stop().animate({
      'margin-left': -wid * now_num +35
    });
    $barTableDotli.removeClass('on');
    $barTableDotli.eq(now_num).addClass('on');
  }

  // 화면크기 조정시 화면 재설정
  function resize() {
    $(window).resize(function() {
      init();
      $barTablePanel.css({
        'margin-left': -wid * now_num
      });
    });
  }
  init();
  barTableDivEvent();
}

$(document).ready(function() {
	
	barTableDiv();
	
	
	var scrollEvent = false;
	var count = 0;

	$(window).scroll(function() {
		if($(this).scrollTop() > 500) {
			$("#moveToTop").fadeIn();
			$("#moveToTop2").fadeIn();
			
		} else {
			$("#moveToTop").fadeOut();
			$("#moveToTop2").fadeOut();
		}
	});
	
	$("#moveToTop").click(function() {
		var position = $(".mainImage").offset();
		count=0;

		$("html, body").animate({
			scrollTop: position.top
		}, 400);
		
	});
	
	$("#moveToTop2").click(function() {
		var position = $(".mainImage").offset();
		count=0;

		$("html, body").animate({
			scrollTop: position.top
		}, 400);
		
	});
	
	// 공지사항으로 가기 버튼 눌렀을 때 이벤트
	$("#goToNotice1").click(function() {
		// 함수 position에 #noticeWindow의 위치를 담음
		var position = $(".mainImage").offset();
		count=0;
		
		$("html, body").animate({
			scrollTop: position.top
			}, 400);
		
	});
	
	// bar 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBarRec1").click(function() {
		// 함수 position에 #barWindow의 위치를 담음
		var position = $("#barWindow").offset();
		count=1;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	// band 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBandRec1").click(function() {
		// 함수 position에 #bandWindow의 위치를 담음
		var position = $("#bandWindow").offset();
		count=2;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	// 공지사항으로 가기 버튼 눌렀을 때 이벤트
	$("#goToNotice2").click(function() {
		// 함수 position에 #noticeWindow의 위치를 담음
		var position = $(".mainImage").offset();
		count=0;
		
		$("html, body").animate({
			scrollTop: position.top
			}, 400);
	});
	
	// bar 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBarRec2").click(function() {
		// 함수 position에 #barWindow의 위치를 담음
		var position = $("#barWindow").offset();
		count=1;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	// band 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBandRec2").click(function() {
		// 함수 position에 #bandWindow의 위치를 담음
		var position = $("#bandWindow").offset();
		count=2;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	// 공지사항으로 가기 버튼 눌렀을 때 이벤트
	$("#goToNotice3").click(function() {
		// 함수 position에 #noticeWindow의 위치를 담음
		var position = $(".mainImage").offset();
		count=0;
		
		$("html, body").animate({
			scrollTop: position.top
			}, 400);
	});
	
	// bar 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBarRec3").click(function() {
		// 함수 position에 #barWindow의 위치를 담음
		var position = $("#barWindow").offset();
		count=1;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	// band 추천을 가기 버튼 눌렀을 때 이벤트
	$("#goToBandRec3").click(function() {
		// 함수 position에 #bandWindow의 위치를 담음
		var position = $("#bandWindow").offset();
		count=2;
		
		$("html, body").animate({
			scrollTop:position.top
			}, 400);
	});
	
	$("html, body").on('mousewheel', function(c) {
		c.preventDefault();
		var m = c.originalEvent.wheelDelta;
		// .mainImage, #bar/bandWindow의 높이 값을 저장
		var noticeP = $(".mainImage").offset();
		var barP = $("#barWindow").offset();
		var bandP = $("#bandWindow").offset();
		
		// bar 추천 div에서 스크롤 올릴 때
		if(m>1 && scrollEvent==false && count==1) {
			console.log(count); // 제대로 작동하는지 확인
			scrollEvent = true;
			count--;
			
			$("html, body").animate({
				scrollTop: noticeP.top
			}, {duration: 300, complete: function() { // 지속 시간
				scrollEvent = false;} // 앞의 이벤트가 끝나면 작동
			});
						
		// notice div에서 스크롤 내릴 때
		} else if(m<1 && scrollEvent==false && count==0) {
			console.log(count);
			scrollEvent = true;
			count++;
			
			$("html, body").animate({
				scrollTop: barP.top
			}, {duration: 300, complete: function() { // 지속 시간
				scrollEvent = false;} // 앞의 이벤트가 끝나면 작동
			});
		
		// bar 추천 div에서 스크롤 내릴 때
		} else if (m<1 && scrollEvent==false && count==1) {
			console.log(count); // 제대로 작동하는지 확인
			scrollEvent = true;
			count++;
			
			$("html, body").animate({
				scrollTop: bandP.top
			}, {duration: 300, complete: function() { // 지속 시간
				scrollEvent = false;} // 앞의 이벤트가 끝나면 작동
			});
		
		// band 추천 div에서 스크롤 올릴 때
		} else if (m>1 && scrollEvent==false && count==2) {
			console.log(count);
			scrollEvent = true;
			count--;
			
			$("html, body").animate({
				scrollTop: barP.top
			}, {duration: 300, complete: function() { // 지속 시간
				scrollEvent = false;} // 앞의 이벤트가 끝나면 작동
			});
			
		}

	});
	
});

</script>

<style type="text/css">
.noticePhoto {
	height: 200px;
	width: 350px;
	border-radius: 15px;
}

#noticeDiv, .barTableDiv, #bandTableDiv {
	background-color: rgb(68,68,68,0.8);
	border-radius: 15px;
	height: 250px;
}

#noticePhotoDiv {
	position: absolute;
}

#MainHead, #MainHead2, #MainHead3 {
	width: 100%;
	text-align: center;
	height: 50px;
	font-size: 15px;
}

#goToNotice1, #goToBarRec1, #goToBandRec1,
#goToNotice2, #goToBarRec2, #goToBandRec2,
#goToNotice3, #goToBarRec3, #goToBandRec3 {
 	display: inline-block; 
	padding-top: 20px;
	cursor: pointer;
}

#goToNotice1:hover, #goToBarRec1:hover, #goToBandRec1:hover,
#goToNotice2:hover, #goToBarRec2:hover, #goToBandRec2:hover,
#goToNotice3:hover, #goToBarRec3:hover, #goToBandRec3:hover {
	color: gold;
	border-bottom: 3px solid #ffffff;
}

#noticeWindow, #barWindow, #bandWindow {
	padding-top: 20px;
	width: 100%;
 	height: 720px;
}

#moveToTop, #moveToTop2 {
	margin-left: 800px;
	margin-top: 40px;
	
}

.barTableDiv ul, ol, li {
  list-style: none;
}


.barTableDiv {
  position: relative;
  padding-top: 50px;
  overflow: hidden;
}

.barTablePanel {
  width: 400%;
}

.barTablePanel:after {
  content: "";
  display: block;
  clear: both;
}

.barTablePanel>li {
  width: 25%;
  height: 200px;
  float: left;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  position: relative;
}

.barTableDot:after {
  content: "";
  display: block;
  clear: both;
}

.barTableDot {
  position: absolute;
  left: 50%;
  bottom: 10%;
  transform: translateX(-50%);
}

.barTableDot>li {
  float: left;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #fff;
  margin-left: 10px;
  margin-right: 10px;
  text-indent: -9999px;
  cursor: pointer;
}

.barTableDot>li.on {
  background-color: gold;
}

.barRecPrev {
  position: absolute;
  width: 50px;
  height: 50px;
  background-color: black;
/*   transform: translateY(-50%); */
  top: 158%;
  left: 16%;  
  cursor: pointer;
}

.barRecNext {
  position: absolute;
  width: 50px;
  height: 50px;
  background-color: black;
/*   transform: translateY(-50%); */
  top: 158%;
  right: 15%; 
  cursor: pointer;
}

</style>

<body>
<div>
	<div id="noticeWindow">
		<header id="MainHead">
			<b id="goToNotice1">Notice</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBarRec1">Today's Bar</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBandRec1">Today's Band</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</header>
	<br><br>
		<font style="font-size: 20px; margin-left: 20px; border-bottom: 3px solid gold;"><b>Notice</b></font><br>
		<div id="noticeDiv" class="text-center" style="margin-top: 10px;">
			<div id="noticePhotoDiv" style="padding-top: 25px; padding-left: 50px;">
				<a href="/notice/list"><img class="noticePhoto" src="${pageContext.request.contextPath}/resources/joinImg/notice.jpg"></a>
			</div>
			<div id="noticeTableDiv" style="padding-top: 35px; padding-left: 480px; line-height: 200%">
				<table id="noticeTable" style="height: 110px;">
					<c:forEach items="${noticeList }" var="notice">
					<tr>
						<td style="width:35%"><ul><a href="/notice/view?noticeNo=${notice.noticeNo}" style="color: #ccc;"><b><li>${notice.content }</li></b></a></ul></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="noticeBar">
			
		</div>
	</div>

	<div id="barWindow"><br><br><br><br>
		<header id="MainHead2">
			<b id="goToNotice2">Notice</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBarRec2">Today's Bar</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBandRec2">Today's Band</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</header>
		<br><br>
		<font style="font-size: 20px; margin-left: 20px; border-bottom: 3px solid gold;"><b>Today's Bar</b></font><br>
		<div class="barTableDiv" style="margin-top: 10px;">
			  <ul class="barTablePanel">
				    <!-- bar 추천 슬라이드 1 -->
				    <li>
				    	<div id="barRecommend1">
				    		<table id="barRecommend1Table">
				    		<tr><td>
				    			${bar1.barName }
				    		</td></tr>
				    		<tr><td>
				    			${bar1.barAddress }
				    		</td></tr>
				    		<tr><td>
				    			${bar1.manager }
				    		</td></tr>
				    		</table>
				    	</div>
					</li>
				    <!-- bar 추천 슬라이드 2 -->
				    <li>
				    	<div id="barRecommend2">
				    		<table id="barRecommend2Table">
				    		<tr><td>
				    			${bar2.barName }
				    		</td></tr>
				    		<tr><td>
				    			${bar2.barAddress }
				    		</td></tr>
				    		<tr><td>
				    			${bar2.manager }
				    		</td></tr>
				    		</table>
				    	</div>
				    </li>
				    <!-- bar 추천 슬라이드 3 -->
				    <li>
				    	<div id="barRecommend3">
				    		<table id="barRecommend3Table">
				    		<tr><td>
				    			${bar3.barName }
				    		</td></tr>
				    		<tr><td>
				    			${bar3.barAddress }
				    		</td></tr>
				    		<tr><td>
				    			${bar3.manager }
				    		</td></tr>
				    		</table>
				    	</div>
				    </li>
				    <!-- bar 추천 슬라이드 4 -->
				    <li>
				    	<div id="barRecommend4">
				    		<table id="barRecommend4Table">
				    		<tr><td>
				    			${bar4.barName }
				    		</td></tr>
				    		<tr><td>
				    			${bar4.barAddress }
				    		</td></tr>
				    		<tr><td>
				    			${bar4.manager }
				    		</td></tr>
				    		</table>
				    	</div>
				    </li>
			  </ul>
			  <ul class="barTableDot">
				    <li class="on"></li>
				    <li></li>
				    <li></li>
				    <li></li>
			  </ul>
		</div>
			  <div class="barRecPrev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></div>
			  <div class="barRecNext"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></div>
		<button id="moveToTop" style="background-color: black; border: 1px solid #ccc;"><b>Top</b></button>		
	</div>
	
	<div id="bandWindow"><br><br><br><br>
		<header id="MainHead3">
			<b id="goToNotice3">Notice</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBarRec3">Today's Bar</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b id="goToBandRec3">Today's Band</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</header>
		<br><br>
		<font style="font-size: 20px; margin-left: 20px; border-bottom: 3px solid gold;"><b>Today's Band</b></font><br>
		<div id="bandRecoDiv" class="text-center" style="margin-top: 10px;">
			<div id="bandRecoPhotoDiv" style="padding-top: 25px; padding-left: 50px;">
			test
			</div>
			
			<div id="bandTableDiv" style="padding-top: 25px; padding-left: 50px;">
			test
			</div>
		</div>
		<button id="moveToTop2" style="background-color: black; border: 1px solid #ccc;"><b>Top</b></button>		
	</div>

</div>
</body>

