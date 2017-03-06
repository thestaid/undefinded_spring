<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	//팝업창을 띄울지에 대한 여부
	boolean canPopup=true;
	Cookie[] cookies=request.getCookies();
	for(Cookie tmp : cookies){
		if(tmp.getName().equals("Nopopup")){
			canPopup=false;
		}
	}
%>   
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
	$("#nav_visitor").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})
	$("#nav_chat").on("mouseover", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/chat.jpg");
	})
	$("#nav_chat").on("mouseout", function(){
		$("#bk_img").attr("src","<%=request.getContextPath() %>/resources/images/home.jpg");
	})	
	//팝업창을 초기에 띄우기
	<%if(canPopup){%>
		window.open("popup/popup_page.do","팝업","width=720,height=210");
	<%}%>	
</script>
</body>
</html>