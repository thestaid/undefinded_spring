<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>사진첩 입니다.</title>
<jsp:include page="../ui/myResource.jsp" />
<style>
.division {
	text-align: center;
	vertical-align: middle !important;
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
.photoListForm{
	margin:200px 20px 100px 20px;
	width:60%;
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
		<jsp:param value="photo" name="active" />
	</jsp:include>
	<div class="mainContent">
		<div class="photoListForm">
			<h3><strong>사진첩</strong></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="division"></th>
						<th class="division">제목</th>
						<th class="division">작성자</th>
						<th class="division">미리보기</th>
						<th class="division">파일명</th>
						<th class="division">크기</th>
						<th class="division">등록일</th>
						<th class="division">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list}">
						<tr>
							<td class="division">${tmp.getNum()}</td>
							<td class="division">${tmp.getTitle()}</td>
							<td class="division">${tmp.getWriter()}</td>
							<td class="division"><img
								src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"
								style="width: 150px; height: 100px;" /></td>
							<td class="division"><a
								href="download.do?num=${tmp.getNum()}">${tmp.getOrgFileName()}</a></td>
							<td class="division">${tmp.getFileSize()}</td>
							<td class="division">${tmp.getRegdate()}</td>
							<td class="division"><c:choose>
									<c:when test="${id eq 'admin' or id eq tmp.getWriter()}">
										<a href="javascript:deleteCheck(${tmp.getNum() })"><span
											class="glyphicon glyphicon-trash" style="font-size: 20px;">
											</span></a>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a
				href="private/uploadform.do"
				class="btn btn-success"
				style="float: right; padding: 4px; font-weight: bold;"> <span
				class="glyphicon glyphicon-open"></span> 업로드
			</a>
			<%--  페이지 처리--%>
			<div style="text-align: center;">
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
					<option value="orgFileName"
						<c:if test="${condition eq 'orgFileName' }">selected</c:if>>파일명</option>
					<option value="title"
						<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="writer"
						<c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				</select> <input type="text" name="keyword" placeholder="검색어"
					value="${keyword }" />
				<button type="submit" class="btn btn-info"
					style="padding: 4px; color: white;">
					<span class="glyphicon glyphicon-search" style="font-size: 13px;"></span>
				</button>
			</form>			
		</div>
	</div>
	<script>
		function photoLoginCheck() {
			alert("로그인 해주세요!");
		}

		function deleteCheck(num){
			var isDelete = confirm("진짜 삭제할거에요?");
			if(isDelete){
				location.href = "private/delete.do?num="+num;
			}
		}
	</script>
</body>
</html>






