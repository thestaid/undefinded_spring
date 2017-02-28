<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>비밀번호 수정 페이지</title>
<style>
	.pwdUpdateForm{
		width: 30%;
		margin-top:200px;
		margin-left: 20%;
	}
	.btn-block{
		margin-top:5px;
	}	
</style>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../ui/navbar.jsp"></jsp:include>
	<div class="mainContent">
	<%--회원가입하면 원래 요청한 페이지의 uri값을 파라미터로 들고간다. --%>
		<form action="pwdUpdate.do?uri=${uri }" method="post" class="pwdUpdateForm">
			<h3><strong>비밀번호 수정</strong></h3>
			<div class="form-group">
				<label class="control-label" for="id">아이디</label>
				<input type="hidden" name="id" value="${checkId }"/>
				<input class="form-control" type="text" 
					id="id" disabled="disabled" value="${checkId }"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="pwd">변경할 비밀번호</label>
				<input class="form-control" type="password" 
					id="pwd" name="pwd"/>
			</div>
			<div><button type="submit" class="bt-default btn-sm pull-right">변경</button></div>
		</form>		
	</div>
</body>
</html>