<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

	var locArr = []; // [1,2] 
	var idx = 0;
	
	// 페이징 처리
	var page = 1;
	
	// 각 밴드 출력 카운터
	var counter = 0;
	
	// 로딩 시 더보기 버튼 유무 확인
	var viewPlus = 1;
	
	$(document).ready(function(){
		$('#locSearch').click(function(){
			
			// 여기서 체크박스 및 어레이 초기화!
			idx = 0;
			locArr = []; //끝~ ???
			
			$('input:checkbox[name="location"]').each(function(){
				
				if(this.checked == true){
					locArr[idx] = this.value;
					idx++;
					//console.log('체크된값 ' + this.value);	
					
				}
			});

			console.log(locArr);
			
			$.ajax({
	
		         type : "POST",
		         url : "/bar/barlocation",
		         dataType : "JSON",
		         data : {'paramMap' : locArr},
		         success : function(data) {
		            console.log(data.result);
		            
		            console.log(data.barList.length);
		            
		            var str = "";
		            
		            for(i=0; i<data.barList.length; i++){
			            str += '<a href="/bar/viewbar?barNo=' + data.barList[i].barNo + '">';
			            str += '	<div class="bar">';
			            str += '		<p><img src="http://' + data.barList[i].path + '/' + data.barList[i].originName + '"></p>';
			            str += '		<p>' + data.barList[i].barName + '</p>';
			            str += '	</div>';
			            str += '</a>';
		            }
		            
		            $('.barList').html(str);
		         }, 
		         error : function(data) {
		         	console.log(data);
		         }
			});
			
		});	
	});
	
	
	
	function locChk(t){
		var thisId = $(t).attr('id');
		/* 
		if($('input:checked[id="' + thisId + '"]').is(':checked') == true){
			locArr[idx] = thisId;
			idx++;
		}
		 */
		 
		console.log('locArr = ');
		 $('input:checkbox[name="location"]').each(function(){
			 
			if(this.checked == true){
				locArr[idx] = this.value;
				idx++;
				console.log('체크된값 ' + this.value);				
			}
			

		 });
	}
	

	function listMore(){
		
		$.ajax({
			type: "POST",
			url: "/bar/listmore",
			data: {'page': page, 'cnt':12 },
			dataType: "JSON",
			success: function(data){
				console.log("성공");
				
				page++;
				
				var str = "";
	            
	            for(i=0; i<data.barList.length; i++){
		            str += '<a href="/bar/viewbar?barNo=' + data.barList[i].barNo + '">';
		            str += '	<div class="bar">';
		            str += '		<p><img src="http://' + data.barList[i].path + '/' + data.barList[i].originName + '"></p>';
		            str += '		<p>' + data.barList[i].barName + '</p>';
		            str += '	</div>';
		            str += '</a>';
	            }
	            
	            $('.barList').append(str);
			},
			error: function(){
				console.log("실패");
			}
		});
	}

</script>

<style type="text/css">
	.bar {
		display: inline-block;
	}
	.bar img{
		width: 130px;
	}
	.font {
		text-align:center;
	}
	.btn{
		background-color: #a24040;
	}
</style>

<div class="test">
	<p onclick="location.href= '/main' "> 메인으로 </p>
</div> <br>


<div id="location">
			<h2>Location</h2>
			<button id="locSearch" class="btn">검색</button><br>
	<table>
		<tr>
			<c:forEach items="${location}" var="location">
				<input type="checkbox" name="location" class="locationBox" id="${location.locationNo}" value="${location.locationNo}" />
				${location.locationName}
			</c:forEach>
			
		</tr>
	</table>
</div>
<hr>

<h2>Bar List</h2>
<hr>

<div id="list" class="barList"> 
	<div class="bar">
			<c:forEach var="row" varStatus="status" items="${list }">
					<div class="bar">
						<p onclick="location.href= '/bar/viewbar?barNo=${row.barNo}' "> <img src="../resources/${row.originName }"> </p>
						<p class="font" onclick="location.href= '/bar/viewbar?barNo=${row.barNo}'"> ${row.barName } </p>
						
						<c:if test="${status.count % 6 eq 0 }">
						<tr></tr>
						</c:if>
					</div>
			</c:forEach>
	</div>
</div>

<div>
	<button id="listMore" class="barMore btn" onclick="listMore();">+ 더보기</button>
</div>

