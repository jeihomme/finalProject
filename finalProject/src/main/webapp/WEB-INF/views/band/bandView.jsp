<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="background-color:gray; border-radius:20px;">

	<!-- 밴드 사진 -->
	<div style="border: 2px solid yellow;">
		<h1>사진 넣을거다!</h1>
	</div>
	
	<!-- 밴드 맴버 -->
	<div style="border: 2px solid yellow;">0
		<table>
			
		</table>
	</div>
	
	<!-- 밴드 History -->
	<div style="border: 2px solid yellow;">
		<table>
		
		</table>
	</div>
	
	<!-- 밴드 소개 -->
	<div style="border: 2px solid yellow;">
	
	</div>
	
	1. ${band }<br>
	2. ${band.info }<br><br>
	
	3-1. ${band.info.resumesNo }<br>
	3-2. ${band.info.publicResumes }<br>
	3-3. ${band.info.resumesTitle }<br>
	3-4. ${band.info.bandNo }<br>
	3-5. ${band.info.bandInfo }<br>
	3-6. ${band.info.musicNo }<br>
	
	<h3>밴드맴버</h3>
	
	<c:forEach items="${band.member }" var="bm">
		${bm.bandMemName } : ${bm.mPosition }<br>
	</c:forEach>
</div>