<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원정보 페이지 입니다.</title>
</head>
<jsp:include page="../../ui/myResource.jsp"/>
<style>
	.division{
		text-align: center;
	}
	.infoForm{
		width: 30%;
		margin-top:200px;
		margin-left: 20%;
	}
</style>
<body>
<jsp:include page="../../ui/navbar.jsp"></jsp:include>
	<div class="mainContent">
		<div class="infoForm">
			<h3 style="margin-bottom:30px; color: green;">회원 정보 페이지</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="division">항목</th>
						<th class="division">정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="division">아이디</th>
						<td class="division">${dto.id }</td>
					</tr>
					<tr>
						<th class="division">이메일</th>
						<td class="division">${dto.email }</td>
					</tr>
					<tr>
						<th class="division">가입일</th>
						<td class="division">${dto.regdate }</td>
					</tr>
				</tbody>
			</table>
			<%-- 탈퇴시 자바스크립트로 물어보고 삭제시키기 위해  javascript:userConfirm()로 이동 시킨다.--%>
			<a class="btn btn-danger pull-right" href="javascript:userConfirm()" style="margin-left:5px;">
				<span class="glyphicon glyphicon-trash" style="white"></span> 회원 탈퇴
			</a>
			<a class="btn btn-info pull-right" href="updateform.do">
				<span class="glyphicon glyphicon-scissors" style="white"></span> 회원정보 수정
			</a>	
		</div>
	</div>
<script>
	//삭제여부를 물어보고 이동시키기 위한 함수
	function userConfirm(){
		var isDelete=confirm("우리 사이에 이러기에요?");
		if(isDelete){
			location.href="delete.do?id=${dto.id}";
		}
	}
</script>
</body>
</html>
















