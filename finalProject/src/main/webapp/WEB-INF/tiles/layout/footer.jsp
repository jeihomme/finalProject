<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 카카오 플러스친구 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
	.footerAnchor {
	padding:10px;
	}
</style>
<hr>
	<div class="text-center">
		<a class="footerAnchor" href="/member/main" >조 소개</a>
		<a class="footerAnchor" href="/member/main" >이용약관</a>
		<a class="footerAnchor" href="/member/main" >개인정보처리방침</a>
		<a class="footerAnchor" href="/member/main" >청소년보호정책</a>
		<a class="footerAnchor" href="/member/main" >고객센터</a>
		<a class="footerAnchor" href="/member/main" >(주)1조Final</a>
		
		<!-- 카카오 플러스친구 1:1 채팅-->
		<div id="plusfriend-chat-button" style="float: right;"></div>
	</div>
	
<!-- 카카오 플러스친구 API -->
<script>
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('1997f5d35656cdaa5bbe7194afc3502f');
	// 스토리 공유 버튼을 생성합니다.
	Kakao.PlusFriend.createChatButton({
	  container: '#plusfriend-chat-button',
	  plusFriendId: '_nuxcJj',
	  title: 'question',
	  size: 'small',
	  color: 'yellow',
	  shape: 'pc',
	  supportMultipleDensities: true
	});
//]]>
</script>
