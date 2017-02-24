<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Caveat" rel="stylesheet">

<title>팝-업!</title>
<style>
	body{
		background-color: white;
		color: black;
	}
	
	.welcometext{
		display: table-cell;
		vertical-align:middle;
		text-align: center;
		color: #e2583e;
		font-size: 80px;
		font-style: bold;
		font-family: 'Abril Fatface', cursive;		
	}
	
	.close-btn{
		border: 1px solid #e2583e;
		background-color: #e2583e;
		color: #1c1c1c;
		font-size: 13px;
		font-style: bold;
	}
</style>
</head>

<body>

<div class="welcomeblock">
	<p class="welcometext">Welcome to Undefined</p>
</div>
<%-- 체크시 팝업에 관한 chk 파라메터 전송 --%>
<form action="nopopup.do" method="post" name="myForm">
	<label>
		<input type="checkbox" name="chk" value="no"/>
		1분 동안 안 볼래요 :( &nbsp;
	</label>
	<button href="javascript:closePopup()" class="close-btn">닫기</button>
</form>
<script>
	//폼에 대한 button를 클릭시 함수를 호출
	function closePopup(){
		//폼 강제 전송 
		document.myForm.submit();
	}
</script>
</body>
</html>







