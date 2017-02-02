<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
<head>
<meta charset="UTF-8"/>
<title>게시글</title>
<style>
	#boardInsertBtn{
		margin-top:0px;
		float:right;
		padding:4px;
		font-weight:bold;
		width:80px;
	}
	.boardDetail{
		margin:200px 20px 100px 20px;
		width:60%;
	}	
	.comment textarea{
		width : 100%;
		background-color:#fff;
	}
	
	.comment form{
		display : none; 
	}
	
	.comment{
		position : relative;
	}
	
	.comment .reply_icon{
		position: absolute;
		top : 0;
		left : -20px;
	}
	.page_display a{
		text-decoration: none;
		color: #000;
	}
	li a.muted{
		color : #cecece;
	}
	.move-btn{
		width: 65px;
		margin: 0px;	
	}
</style>
</head>
<body>
<jsp:include page="../ui/navbar.jsp">
	<jsp:param value="board" name="active"/>
</jsp:include>
<!-- 로그인 한 회원이 작성한 글이라면 수정 링크를 제공해준다. -->
	<div class="mainContent">
		<div class="boardDetail">
			<c:if test="${dto.prevNum ne 0 }">
			<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}" class="btn btn-default pull-left move-btn" style="margin-right:10px; font-size:12px; padding:5px;">
				<span class="glyphicon glyphicon-chevron-up" style="color:red;"></span>이전글
			</a>
			</c:if>
			<c:if test="${dto.nextNum ne 0}">
			<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}" class="btn btn-default pull-left move-btn" style="font-size:12px; padding:5px;">
				다음글<span class="glyphicon glyphicon-chevron-down" style="color:red;"></span>
			 </a>
			</c:if>
			<a href="list.do?condition=${condition}&keyword=${keyword}" class="pull-right btn btn-default move-btn" style="font-size:12px; padding:5px;">목록</a>
			<table class="table table-bordered" style="margin-top:40px;">
				<tr>
					<td>
						<div class="row">
							<div class="col-xs-4" style="font-weight:bold;">${dto.title }</div>
							<div class="col-xs-4"></div>
							<div class="col-xs-4 pull-right" style="font-size:12px;">${dto.regdate }</div>
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
					<td><div class="content" style="margin-top:40px;">${dto.content }</div></td>
				</tr>
			</table>
			<c:if test="${id eq dto.writer }">
				<a href="javascript:deleteCheck()" class="btn btn-danger pull-right" style="margin-left:10px">삭제</a>
				<a href="private/updateform.do?num=${dto.num }" class="btn btn-warning pull-right">수정</a>
			</c:if>
			<div class="comment_form" style="clear:both;">
				<div style="margin-top:50px;">댓글</div>
				<form action="<c:choose><c:when test="${empty id }">javascript:boardDetailLoginCheck()</c:when>
         		<c:otherwise>private/commentInsert.do</c:otherwise></c:choose>" method="post">
					<!-- 덧글 작성자 -->
					<input type="hidden" name="writer" value="${id }"/>
					<!-- 덧글 그룹 -->
					<input type="hidden" name="ref_group" value="${dto.num }" />
					<!-- 덧글 대상 -->
					<input type="hidden" name="target_id" value="${dto.writer }" />
					<textarea name="content" style="width: 100%;"></textarea></br>
					<button class="btn btn-default pull-right move-btn" type="submit">등록</button>
				</form>
			</div>
			<div class="comments" style="clear:both;">
				<c:forEach var="tmp" items="${list }">
					<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >	
						<c:if test="${tmp.num ne tmp.comment_group }">
							<div class="reply_icon"><img src="${pageContext.request.contextPath}/resources/images/reply.png" style="width: 15px;height: 15px;"></div>
						</c:if>
						<div id="commentDeleteCheck${tmp.num }">		
							<strong>from ${tmp.writer }</strong>
							${tmp.regdate }<br/>
							<strong>to ${tmp.target_id }</strong>
								<a id="detailComment${tmp.num }" href="javascript:">답글</a>
								<c:if test="${id eq tmp.writer}">
									<a id="detailUpdate${tmp.num }" href="javascript:">수정</a>
									<a id="detailDelete${tmp.num }" href="javascript:">삭제</a>						
								</c:if>						
						</div>
						<textarea rows="5" disabled id="originComment${tmp.num }" style="width:100%;">${tmp.content }</textarea><br/>
						<form  id="detailCommentForm${tmp.num }" action="private/commentInsert.do" method="post">
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${id }"/>
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea name="content"></textarea>
							<button type="submit">등록</button>
						</form>
						<form  id="detailUpdateForm${tmp.num }" action="private/commentUpdate.do?textnum=${dto.num }&condition=${condition}&keyword=${keyword}" method="post">
							<input type="hidden" name="num" id="updateNum${tmp.num }" value="${tmp.num }"/>
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${id }"/>
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
							<textarea name="content" id="boardCommentContent${tmp.num }"></textarea>
							<button type="submit">수정</button>
						</form>					
					</div>
					<script>
						//덧글 달기 혹은 취소 버튼을 눌렀을때 실행할 함수 등록 
						$("#detailComment${tmp.num }").click(function(){
							if($(this).text()=="답글"){
								$(this)
								.text("취소")
								.parent()
								.parent()
								.find("#detailCommentForm${tmp.num }")
								.slideToggle();	
							}else{
								$(this)
								.text("답글")
								.parent()
								.parent()
								.find("#detailCommentForm${tmp.num }")
								.slideToggle();
							}
						});
						//수정 혹은 취소 버튼을 눌렀을때 실행할 함수 등록 
						$("#detailUpdate${tmp.num }").click(function(){
							if($(this).text()=="수정"){
								$(this)
								.text("취소")
								.parent()
								.parent()
								.find("#detailUpdateForm${tmp.num }")
								.slideToggle();	
							}else{
								$(this)
								.text("수정")
								.parent()
								.parent()
								.find("#detailUpdateForm${tmp.num }")
								.slideToggle();
							}
							var num=$("#updateNum${tmp.num }").val();
							$.ajax({
								url:"private/commentUpdateform.do",
								method:"get",
								data:{"num":num},
								success:function(data){
									$("#boardCommentContent${tmp.num }").text(data);
								}			
							});
						});	
						$("#detailDelete${tmp.num }").click(function(){
							var isDelete = confirm("진짜 삭제할거에요?");
							if(isDelete){
								location.href = "private/commentDelete.do?num=${tmp.num}&textnum=${dto.num }&condition=${condition}&keyword=${keyword}";
							}
						});
						var originComment${tmp.num }=$("#originComment${tmp.num }").val();
						if(originComment${tmp.num }=="삭제된 댓글입니다."){
							$("#commentDeleteCheck${tmp.num }").hide();
							$("#originComment${tmp.num }").css("margin-top", "20px");
						}
				        function boardDetailLoginCheck() {
				             alert("로그인 해주세요!");
				          }
					</script>	
				</c:forEach>
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
			</div>			
		</div>	
	</div>				
	<script>
		
		//덧글 전송 이벤트가 일어 났을때 실행할 함수 등록 
		$(".comment_form > form, .comment form").submit(function(){
			if(${id}==null){//만일 로그인 하지 않았다면 
				alert("로그인이 필요 합니다.");		
				return false; //폼전송 막기 
			}
		});	
		function deleteCheck(){
			var isDelete = confirm("진짜 삭제할거에요?");
			if(isDelete){
				location.href = "private/delete.do?num=${dto.num}";
			}
		}
	</script>
</body>
</html>