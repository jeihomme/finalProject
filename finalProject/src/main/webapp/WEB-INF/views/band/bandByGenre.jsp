<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="background-color:gray; border-radius:20px;">
	<table>
		<c:forEach items="${band }" var="b">
			<c:forEach items="${profile }" var="p">
				<c:if test="${b.profileNo eq p.profileNo }">
					<td>
						<table>
							<tr>
								<td>
									<img class="img-rounded" src="http://${p.path }/${p.originName}" />
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