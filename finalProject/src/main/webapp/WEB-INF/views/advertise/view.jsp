<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	// $("#member").click(function() {
// 		var modal = document.getElementById("advertiseView");
		

		$(".view").click(function() {
		var findNo = $(this).attr("id");
		 
// 		modal.style.display = "block";
		
		
	         });
		
		$("#close").click(function(){
			history.go(-1);	
		})
		
			
});		

						

</script>  
<style>
.modal-ads {
   display: block; /* Hidden by default */
/*     position: absolute; /* Stay in place */ */
    z-index: 6; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    margin: auto;
    overflow: auto; /* Enable scroll if needed */
   background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ 
/* 	margin-left: 20%; */
/*     margin-top: 8%; */



}

.modal-img{
/* 	border: 1px solid white; */
    width: 50%;
    height: 45%;
    text-align: center;
    position: absolute;
/* 	margin-left: auto; */
/* 	margin-right: auto; */
}

.modal-music{
/* 	border: 1px solid white; */
	width: 60%;
    height: 10%;
    margin-top: 5%;

}

.modal-close{
	margin-left: 90%;

}
.modal-info{
/* 	border: 1px solid white;   */
	float: right;
    width: 41%;
    height: 100%;
}

.member-div {
 margin-left: 25%;
}

.modal-info input {

	color: black;
}


.close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

.close:hover,
.close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
input[type=text]{
/* 	border: none; */
	background-color: gray;
	color:black;

} 

.img-info{

	width: 100%;
	height: 100%;
}
</style>


<c:set var="proPic" value="${map.proPic }"/>
<c:set var="findM" value="${map.findM }"/>
<c:set var="member" value="${map.member }"/>
<c:set var="bandMember" value="${map.bandMember }"/>

 <div class ="modal-ads" id="advertiseView">
<div class='modal-img' >
<!-- <img src='http://" + proPic.path + "/" + proPic.originName + "' width="100%" height="100%"/> -->
	<img class="img-info" src="http://${proPic.path }/${proPic.originName } " />
</div>
<div class="modal-info">
	<div style="margin-left:10%; margin-top:1%;"><p>· Member</p><div class="member-div"><input type="text"style="width: 220px" /></div>
		<div style="margin-top: 10%"><p>· Genre<input style="margin-left: 5%; width: 240px;" type="text" value="${findM.genre}"/></p></div>
			<div style="margin-top: 10%"><p>· Searching for<input style="margin-left: 5%; width: 195px;" type="text" value="${bandMember.mPosition}" /></p></div>
					<div style="margin-top: 10%"><p>· Contact Number<input style="margin-left: 5%" type="text" value="${member.contact}" /></p></div>
					    <div class="etc" style="margin-top: 10% ,"><p>· Etc.<input style="margin-left: 5%; height: 185px; width:88%; " maxlength=12;  type="text" name="content" /></p></div>
					     </div></div>
					     <div style="margin-top: 50%">
					     <audio src="" autoplay controls style="width:55%"></audio>
					     </div>
					     <div>
					     <button type="button" id="adsUpdate">수정</button>
					     <button type="button" id="close" class="btn btn-default">Close</button>
						</div>
</div>					