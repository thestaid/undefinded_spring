<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>글쓰기 페이지 입니다.</title>
<!-- SmartEditor 관련 javascript 로딩 -->
<jsp:include page="../../ui/myResource.jsp"></jsp:include>
<style>
.boardInsertForm{
	margin:200px 20px 100px 20px;
	width:60%;
}
</style>
<script src="<c:url value='/SmartEditor/js/HuskyEZCreator.js' />" ></script>
</head>
<body>
	<jsp:include page="../../ui/navbar.jsp"></jsp:include>
	<div class="mainContent">
		<div class="boardInsertForm">
			<form action="insert.do" method="post" class="form-horizontal">
				<h3><strong>글쓰기</strong></h3>
				<div class="form-group">
				<input type="hidden" name="writer" value="${id }" />
					<label class="control-label" for="writer">작성자</label> <input
						class="form-control" type="text" value="${id }"
						disabled="disabled" /><br /> <label class="control-label"
						for="title">제목</label> <input class="form-control" type="text"
						name="title" id="title" /><br />
					<textarea name="content" id="ir1"
						style="width: 60%; height: 412px; display: none"></textarea>
					<div>
						<input type="button" onclick="submitContents(this);" value="확인"
							class="btn btn-primary" style="float: right; margin-left: 5px;" />
						<a href="../list.do" class="btn btn-info" style="float: right">목록</a>
					</div>
				</div>
			</form>	
		</div>
	</div>

	<script>
		var oEditors = [];

		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "ir1",
					sSkinURI : "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
					htParams : {
						bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
						fOnBeforeUnload : function() {
							//alert("완료!");
						}
					}, //boolean
					fOnAppLoad : function() {
						//예제 코드
						//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
					},
					fCreator : "createSEditor2"
				});
		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
</body>
</html>