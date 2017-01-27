<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
<head>
<meta charset="UTF-8" />
<title>게시글</title>
<style>
#boardInsertBtn {
	margin-top: 0px;
	float: right;
	padding: 4px;
	font-weight: bold;
	width: 80px;
}

.boardListForm {
	margin: 100px 20px 100px 20px;
}

.container {
	margin-top: 100px;
	width: 75%;
}

.comment textarea {
	width: 70%;
	background-color: #fff;
}

.comment form {
	display: none;
}

.comment {
	position: relative;
}

.comment .reply_icon {
	position: absolute;
	top: 0;
	left: -20px;
}

.page_display a {
	text-decoration: none;
	color: #000;
}

li a.muted {
	color: #cecece;
}

.move-btn {
	width: 65px;
	margin: 0px;
}
</style>
</head>
<body>
	<jsp:include page="../ui/navbar.jsp"/>
	<!-- 로그인 한 회원이 작성한 글이라면 수정 링크를 제공해준다. -->
	<div class="mainContent">
	<div class="container">
		<c:if test="${dto.prevNum ne 0 }">
			<a
				href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}"
				class="btn btn-default pull-left move-btn"
				style="margin-right: 10px; font-size: 12px; padding: 5px;"> <span
				class="glyphicon glyphicon-chevron-up" style="color: red;"></span>이전글
			</a>
		</c:if>
		<c:if test="${dto.nextNum ne 0}">
			<a
				href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}"
				class="btn btn-default pull-left move-btn"
				style="font-size: 12px; padding: 5px;"> 다음글<span
				class="glyphicon glyphicon-chevron-down" style="color: red;"></span>
			</a>
		</c:if>
		<a href="list.do?condition=${condition}&keyword=${keyword}"
			class="pull-right btn btn-default move-btn"
			style="font-size: 12px; padding: 5px;">목록</a>
		<table class="table table-bordered" style="margin-top: 40px;">
			<tr>
				<td>
					<div class="row">
						<div class="col-xs-4" style="font-weight: bold;">${dto.title }</div>
						<div class="col-xs-4"></div>
						<div class="col-xs-4 pull-right" style="font-size: 12px;">${dto.regdate }</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="row">
						<div class="col-xs-4">글번호 : ${dto.num }</div>
						<div class="col-xs-4"></div>
						<div class="col-xs-4 pull-right">작성자 : ${dto.writer }</div>
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="content" style="margin-top: 40px;">${dto.content }</div></td>
			</tr>
		</table>
		<c:if test="${id eq dto.writer }">
			<a href="javascript:deleteCheck()" class="btn btn-danger pull-right"
				style="margin-left: 10px">삭제</a>
			<a href="private/updateform.do?num=${dto.num }"
				class="btn btn-warning pull-right">수정</a>
		</c:if>
		</div>
		</div>

		
	<script
		src="${pageContext.request.contextPath }/resource/js/jquery-3.1.1.js"></script>
	<script>
		function deleteCheck(){
			var isDelete = confirm("진짜 삭제할거에요?");
			if(isDelete){
				location.href = "private/delete.do?num=${dto.num}";
			}
		}
	</script>
</body>
</html>


