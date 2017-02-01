<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원가입 페이지</title>
<style>
	.signupForm{
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
		<form action="signup.do?uri=${uri }" method="post" class="signupForm">
			<h3><strong style="color: blue">회원가입</strong></h3>
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" 
					id="id" name="id"/>
				<p class="help-block">사용할 수 없는 아이디 입니다.</p>
				<span class="glyphicon form-control-feedback"></span>
			</div>
			<div class="form-group">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" 
					id="pwd" name="pwd"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" 
					id="email" name="email"/>
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
			<div><button type="submit" class="btn btn-primary btn-block">가입</button></div>
			<button type="reset" class="btn btn-danger btn-block">취소</button>
		</form>		
	</div>
</body>
<script>
	//아이디 입력란에 keyup 이벤트가 발생했을때 실행할 함수 등록 
	$("#id").on("keyup", function(){
		//입력한 아이디 읽어오기
		var inputId=$("#id").val();
		//ajax 요청을 이용해서 서버에 전송
		$.ajax({
			url:"checkid.do",
			method:"get",
			data:{inputId:inputId},
			
			success:function(data){
				console.log(data);
				$("#id").parent()
				.removeClass("has-success has-error");
				if(data.canUse){
					$("#id")
					.parent()
					.addClass("has-success")
					.find(".help-block")
					.hide()
					.parent()
					.find(".glyphicon")
					.removeClass("glyphicon-remove")
					.addClass("glyphicon-ok");
				}else{
					$("#id")
					.parent()
					.addClass("has-error")
					.find(".help-block")
					.show()
					.parent()
					.find(".glyphicon")
					.removeClass("glyphicon-ok")
					.addClass("glyphicon-remove");
				}
			}
		});
	});
</script>
</html>