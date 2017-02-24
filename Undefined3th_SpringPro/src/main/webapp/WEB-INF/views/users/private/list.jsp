<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../ui/myResource.jsp"/>
<style>
	/*#88b04b*/
	.division{
		text-align: center;
	}
	.page_display a
	{
		text-decoration : none;
		color : #000;
	}
	
	.page_display a.active
	{
		font-weight: bold;
		color : red;
		text-decoration: underline;
	}
	.adminListForm{
		margin:200px 20px 100px 50px;
		width:60%;
	}
</style>
<meta charset=UTF-8">
<title>회원 관리 페이지</title>
</head>
<body>
<jsp:include page="../../ui/navbar.jsp"></jsp:include>
	<div class="mainContent">
		<div class="adminListForm">
			<h3><strong>회원관리 페이지</strong></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="division">회원아이디</th>
						<th class="division">회원이메일</th>
						<th class="division">회원탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td class="division">${tmp.id }</td>
							<td class="division">${tmp.email }</td>
							<td class="division"><a id="adminDelete${tmp.id}" href="javascript:removeconfirm${tmp.id }()" style="text-decoration: none; color:black;"><i class="fa fa-user-times" aria-hidden="true"></i></a></td>
						</tr>
						<script>
							function removeconfirm${tmp.id}(){
								var isRemove=confirm("탈퇴하시겠습니까?");
				                  if(isRemove){
				                     location.href="${pageContext.request.contextPath }/users/private/delete.do?id=${tmp.id }";
				                  } 
							}
							$("#adminDelete${tmp.id}").mouseover(function(){
								$("#adminDelete${tmp.id}").css("color", "red");
							});
							$("#adminDelete${tmp.id}").mouseout(function(){
								$("#adminDelete${tmp.id}").css("color", "black");
							});							
						</script>
					</c:forEach>
				</tbody>
			</table>
		<div style="text-align: center;">
			<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&laquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active">
								<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li>
							<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- 검색어 관련 form -->
		<form action="list.do" method="post" id="keywordForm" style="margin-top: 15px; text-align:center;">
			<label for="condition">검색 조건</label>
			<select name="condition" id="condition" style="padding-top: 2px;padding-bottom: 4px;">
				<option value="Id" <c:if test="${condition eq 'Id' }">selected</c:if>>아이디</option>
				<option value="Email" <c:if test="${condition eq 'Email' }">selected</c:if>>이메일</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어" 
				value="${keyword }"/>
			<button type="submit" class="bt-default btn-sm" style="margin-top:2px; padding: 0px 5px 1px 5px;">
				<strong><span class="glyphicon glyphicon-search" style="font-size:10px;"></span></strong>
			</button>
		</form>					
		</div>
	</div>
</body>
</html>