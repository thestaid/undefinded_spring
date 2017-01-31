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
	<img src="<%=request.getContextPath() %>/resources/images/backbg.png" style="width:100%; height:100%"/>
</div>
<script>
	//팝업창을 초기에 띄우기
	<%if(canPopup){%>
		window.open("popup/popup_page.do","팝업","width=460,height=260,top=138,left=600");
	<%}%>	
</script>
</body>
</html>