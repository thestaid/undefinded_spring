<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width">
<title>Undefined3th</title>
<jsp:include page="ui/myResource.jsp"/>
</head>
<body>
<jsp:include page="ui/navbar.jsp">
	<jsp:param value="home" name="active"/>
</jsp:include>
<div class="mainContent">
	<img src="<%=request.getContextPath() %>/resources/images/backbg.png" style="width:100%; height:100%"/>
</div>
<script>
</script>
</body>
</html>