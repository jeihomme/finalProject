<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js">
$(document).ready(function() {
	$("#btnWrite").click(function(){
		submitContents($(this));
	})
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
});

</script>
<style type="text/css">
.intput{
	color: black;
}

.btn{
	color: black;
	margin-left: 80%;
	
}

#btnWrite{
height:40px;

    width:65px;

    background-color: #6E6E6E;

    border: none;
    
    border-radius:10px;

    color:white;

    padding: 11px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
	
	

}

#btnCancel{

height:40px;

    width:65px;

    background-color: #D8D8D8;

    border: none;
    
    border-radius:10px;

    color:black;

    padding: 11px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
	
}


#content{
	color:black;
}

option {

	color:black;
}

select{
	color:black;
}
</style>


<h1>글쓰기</h1>
<hr>
<form  action="/advertise/update" method="POST">
<h4>USER :<input style="color:black" type="text" name="userId" value="${band.bandName }" readonly="readonly" /></h4>
<input type="hidden" id="bandNo" name="bandNo" value="${band.bandNo }">
<h4>Searching for: <select name="adsNo">
			<c:if test="${ads.adsNo eq '1'}">
				<option value="1" selected="selected">Member</option>
				<option value="2">Collaboration</option>
			</c:if>
			<c:if test="${ads.adsNo eq '2'}">
				<option value="1">Member</option>
				<option value="2" selected="selected">Collaboration</option>
			</c:if>
</select></h4>
<h4>Advertise : <select name="positionNo">
			<option value="1">보컬</option>
			<option value="2">기타</option>
			<option value="3">드러머</option>
			<option value="4">콘트라베이스</option>
			<option value="5">첼로</option>
			<option value="6">베이스기타</option>
			<option value="7">콜라보</option>
			
</select></h4>
<h4>Genre : <select name="genre" >
			<option value="1">Bebob</option>
			<option value="2">Swing</option>
			<option value="3">Punk</option>
			<option value="4">Modern</option>
			<option value="5">Bosa Nova</option>
			<option value="6">Boogie Woogie</option>
</select></h4>	
<h4>Title : <input  type="text" name="title" style="color: black" value="${ads.title }"/></h4><br>
	<h4>Content :</h4><textarea  id="content" name = "content" rows="20" cols="60" style="resize:none;" >${ads.content }</textarea><br><br>

<div class="btn">
<button  id="btnWrite">확인</button>
<button id="btnCancel">취소</button>
</div>
</form>




