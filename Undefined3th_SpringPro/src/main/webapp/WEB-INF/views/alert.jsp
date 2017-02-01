<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%-- 모든 alert창을 처리해주고 이동시키는 jsp페이지 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>처리중입니다.</title>
</head>
<body>
	<script>
		alert("${alertMess}");
		location.href="${redirectUri}";
	</script>
</body>
</html>