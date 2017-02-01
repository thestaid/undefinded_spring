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
	<img id="bk_img" src="<%=request.getContextPath() %>/resources/images/home.jpg" style="width:100%; height:100%"/>
</div>
<script>
	$("#nav_board").on("mouseover", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/board.jpg");
	})
	$("#nav_board").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})
	$("#nav_photo").on("mouseover", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/photo.jpg");
	})
	$("#nav_photo").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})
	$("#nav_visitor").on("mouseover", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/visitor.jpg");
	})
	$("#nav_visitor").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})
	$("#nav_chat").on("mouseover", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/chat.jpg");
	})
	$("#nav_chat").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})	
</script>
</body>
</html>