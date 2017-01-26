<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	session.setAttribute("id", "gura");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시판</title>
<jsp:include page="../ui/myResource.jsp" />
<style>
.division {
	text-align: center;
}

.page_display a {
	text-decoration: none;
	color: #000;
}

.page_display a.active {
	font-weight: bold;
	color: red;
	text-decoration: underline;
}

#boardInsertBtn {
	margin-top: 0px;
	float: right;
	padding: 4px;
	font-weight: bold;
	width: 80px;
}

.container {
	margin: auto;
	width: 80%;
}

.boardListForm {
	margin: 100px 20px 100px 20px;
}

h3 {
	font-weight: bolder;
	margin-top: 50px;
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 2px solid gray;
}
</style>
</head>
<body>
	<jsp:include page="../ui/navbar.jsp">
		<jsp:param value="board" name="active" />
	</jsp:include>
	<div class="mainContent">
		<div class="container">
			<div class="boardListForm">
				<table class="table table-hover col-xs-8">
					<thead>
						<tr>
							<th class="division"></th>
							<th class="division">제목</th>
							<th class="division">작성자</th>
							<th class="division">등록일</th>
							<th class="division">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${list }">
							<tr>
								<td class="division">${tmp.num }</td>
								<td class="division"><a
									href="detail.do?num=${tmp.num}&condition=${condition}&keyword=${keyword}">${tmp.title }</a>
								</td>
								<td class="division">${tmp.writer }</td>
								<td class="division">${tmp.regdate }</td>
								<td class="division">${tmp.viewCount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<%-- 로그인 여부에 따라 글쓰기의 처리가 다름 --%>
			<a
				href="<c:choose>
				<c:when test="${empty id }">javascript:boardInsertBtn()</c:when>
				<c:otherwise>private/insertform.do</c:otherwise>
			</c:choose>"
				id="boardInsertBtn" class="btn btn-success"> <span
				class="glyphicon glyphicon-pencil" style="color: white;"></span> 글쓰기
			</a>
			<%--  페이지 처리--%>
			<div style="text-align: center; clear: both;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${startPageNum ne 1 }">
							<li><a
								href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="javascript:">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<c:choose>
							<c:when test="${i eq pageNum }">
								<li class="active"><a
									href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a
									href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li><a
								href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="javascript:">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<%-- 검색어 관련 form --%>
			<form action="list.do" method="post" id="keywordForm"
				style="margin-top: 15px; text-align: center;">
				<label for="condition">검색 조건</label> <select name="condition"
					id="condition"
					style="padding-bottom: 6px; margin-left: 7px; margin-right: 7px;">
					<option value="titlecontent"
						<c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
					<option value="title"
						<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="writer"
						<c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				</select> <input type="text" name="keyword" placeholder="검색어"
					value="${keyword }" />
				<button type="submit" class="btn btn-info" style="padding: 4px;">
					<span class="glyphicon glyphicon-search" style="font-size: 13px;"></span>
				</button>
			</form>
		</div>
	</div>
	<script>
		//로그인이 안되어있을경우 경고창 띄운다.
		function boardInsertBtn() {
			alert("로그인 해주세요!");
		};
	</script>
</body>
</html>