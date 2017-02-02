<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지입니다.</title>
<jsp:include page="../../ui/myResource.jsp"/>
<style>
	#updateForm{
		width: 30%;
		margin-top:200px;
		margin-left: 20%;	
	}
</style>
</head>
<body>
<jsp:include page="../../ui/navbar.jsp"></jsp:include>
	<div class="mainContent">
		<form action="update.do" method="post" class="form-group" id="updateForm">
			<h3><strong>회원 정보 수정</strong></h3>
			<div class="form-group">		
				<input type="hidden" name="id"  class="form-control" value="${dto.id }"/>
				<label class="control-label" for="id">아이디</label>
				<input type="text" id="id" value="${dto.id }" class="form-control" disabled="disabled"/><br/>	
			</div>
			<div class="form-group">
				<label class="control-label" for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" class="form-control" value=""/><br/>
			</div>
			<div class="form-group">
				<label class="control-label" for="check_pwd">비밀번호 확인</label>
				<input type="password" name="check_pwd" id="check_pwd" class="form-control" value=""/><br/>
			</div>			
			<div class="form-group">
				<label class="control-label" for="email">이메일</label>
				<input type="text" name="email" id="email" class="form-control" value="${dto.email }"/><br/>
			</div>
			<button type="submit" class="btn btn-primary" id="updateBtn" style="width: 100%">
				<span class="glyphicon glyphicon-pencil"></span> 수정
			</button><br/>
			<button type="reset" class="btn btn-danger" style="width: 100%; margin-top: 5px;">
				<span class="glyphicon glyphicon-remove"></span> 취소
			</button><br/>
		</form>		
	</div>
	<script>
		$("#updateForm").on("submit",function(event){
			var firstPwd=$("#pwd").val();
			var secondPwd=$("#check_pwd").val();
			if(firstPwd!=secondPwd){
				alert("비밀번호를 확인 하세요");
				$("#pwd").val("");
				$("#check_pwd").val("");
				event.preventDefault();//폼전송 막기 				
			}
		})
	</script>	
</body>
</html>