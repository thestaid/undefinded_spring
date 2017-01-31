<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>홈페이지 로그인 페이지 입니다.</title>
<style>
	strong{
		color:red;
	}
	.loginForm{
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
	<%--파라미터 uri값을 넘겨줘서 요청했던 페이지로 넘어가기 --%>
		<form action="signin.do?uri=${param.uri }" method="post" class="loginForm">
			<h3><strong>로그인</strong></h3>
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" class="form-control" name="id" id="id"/>
				<p class="help-block">반드시 입력하세요</p>									
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd"/>
				<p class="help-block">반드시 입력하세요</p>					
			</div>				
			<div><button type="submit" class="btn btn-primary btn-block">로그인</button></div>
			<button type="reset" class="btn btn-danger btn-block">취소</button>
		</form>		
	</div>	
</body>
</html>