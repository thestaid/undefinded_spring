<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String chk=request.getParameter("chk");
	//폼에대한 파라메터가 null이 아닌 경우
	if(chk != null){
		//쿠키 객체를 생성해서
		Cookie cookie=new Cookie("Nopopup", chk);
		//쿠키를 1분 동안 유지 시킨다.
		cookie.setMaxAge(60);
		cookie.setPath("/");
		//쿠키를 추가한다.
		response.addCookie(cookie);
		
	}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>팝업페이지</title>
</head>
<body>
<script>
	self.close(); /* 팝업창이 닫아지도록 javascript 를 응답한다. */ 
</script>
</body>
</html>
