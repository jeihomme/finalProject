<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
</style>


<h1>글쓰기</h1>
<hr>
<div>
<form action="/notice/write" method="POST">
<h4>작성자 :<input style="color:black" type="text" name="id" value="${userId }" readonly="readonly"/></h4>
<h4> 제목 : <input  type="text" name="title" style="color: black"/></h4><br>
	<h4>내용 :</h4><textarea  id="content" name = "content" rows="20" cols="60" style="resize:none;" ></textarea><br><br>

<div class="btn">
<button  id="btnWrite">확인</button>
<button id="btnCancel">취소</button>
</div>
</form>


