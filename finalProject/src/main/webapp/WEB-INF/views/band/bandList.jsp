<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<h1>Band</h1>
<!-- 밴드 장르 -->
<div style="background-color:gray; border-radius:20px;">
	<table>
		<tr>
			<c:forEach items="${genre }" var="g">
				<th style="border: 1px solid red;"><a style="font-size:25px;">${g.genreName }</a></th>
			</c:forEach>
		</tr>
	</table>
</div>

<br><br>

<!-- 밴드 갤러리형식의 리스트 -->
<div style="background-color:gray; border-radius:20px;">
	<table>
		<c:forEach items="${band }" var="b">
			<c:forEach items="${profile }" var="p">
				<c:if test="${b.profileNo eq p.profileNo }">
					<td>
					band: ${b }
						<table>
							<tr>
								<td>
									<img class="img-rounded" src="sftp://root@${p.path }/${p.originName}" />
									<img class="img-rounded" src="https://${p.path }/${p.originName}" />
								</td>
							</tr>
							<tr>
								<td><a href="/band/bandView?bandNo=${b.bandNo }">${b.bandNo}, ${b.bandName}</a></td>
							</tr>
						</table>
					</td>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
</div>
<button style="background-color:black; border:0px; align:right;">+ 더보기</button>
