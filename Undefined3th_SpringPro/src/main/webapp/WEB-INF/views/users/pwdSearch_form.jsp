<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>비밀번호 찾기 페이지</title>
<style>
	.pwdSearchForm{
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
		<form action="pwdSearch.do?uri=${uri }" method="post" class="pwdSearchForm">
			<h3><strong>비밀번호 찾기</strong></h3>
			<div class="form-group">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" 
					id="id" name="id"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="answer">비밀번호 찾기 질문</label>
				<select class="form-control" name="answer" id="answer">
					<option value="1">졸업한 초등학교는?</option>
					<option value="2">가장 감명깊게 읽은 책은?</option>
					<option value="3">가장 존경하는 인물은?</option>
				</select>				
			</div>
			<div class="form-group">
				<label class="control-label" for="aw">답변</label>
				<input class="form-control" type="text" 
					id="aw" name="aw"/>
			</div>
			<div><button type="submit" class="btn btn-primary btn-block">확인</button></div>
			<button type="reset" class="btn btn-danger btn-block">취소</button>
		</form>		
	</div>
</body>
</html>