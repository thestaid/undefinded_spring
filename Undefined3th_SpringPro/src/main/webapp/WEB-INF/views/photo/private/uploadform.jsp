<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>archive/uploadform.jsp</title>
<jsp:include page="../../ui/myResource.jsp" />
</head>
<body>
	<jsp:include page="../../ui/navbar.jsp">
		<jsp:param value="photo" name="active" />
	</jsp:include>
	<!-- 
	- 업로드 폼 작성법
	1. method="post"
	2. enctype="multipart/form-data"
	3. <input type="file"/>
 -->
	<div class="mainContent">
		<div class="container">
			<h3 class="text-center" style="margin: 50px">사진 업로드</h3>
			<form action="upload.do" method="post" class="form-horizontal"
				enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label" for="writer">작성자</label> <input
						type="hidden" name="writer" value="${id}" /> <input
						class="form-control" type="text" value="${id }"
						disabled="disabled" /><br /> <label class="control-label"
						for="title">제목</label> <input class="form-control" type="text"
						name="title" id="title" /><br /> <label class="control-label"
						for="myFile">사진파일</label> <input class="form-control" type="file"
						name="myFile" id="myFile" /><br />
					<button class="btn btn-primary pull-right" type="submit"
						id="fileUploadBtn">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		$("#fileUploadBtn").click(function() {
			var myFile = $("#myFile").val();
			if (myFile == "") {
				alert("파일을 등록해주세요!");
				$("#title").val("");
				return false;
			}
		});
	</script>
</body>
</html>











