<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	//session에서 id 받아오기
	String id=(String)session.getAttribute("id");
%>
<style>
body,
body * {
  transition: all 300ms ease-out;
}
body.light {
  background-color: #EEE;
}
body.dark {
  background-color: #222;
}
body ul.menu {
  position: absolute;
  height: 250px;
  top: 25%;
  width: auto;
  margin-left: 50px;
}
body ul.menu li>a{text-decoration:none;color:black; }
body ul.menu li {
  color: #000;
  list-style-type: none;
  line-height: 50px;
  font-family: 'Raleway', sans-serif;
  font-size: 50px;
  text-transform: lowercase;
}
body ul.menu a:hover {
  color: #EEE !important;
  cursor: pointer;
}
.signinfo{font-size: 30px;}
.mainContent{
	position:absolute;
	top:0%;
	left:350px;
	display: table;
	width: 100% ;
	height: 100%;
	background-color: #EEE;
}
</style>
<link href='http://fonts.googleapis.com/css?family=Raleway:200' rel='stylesheet' type='text/css'>
<ul class="menu">
    <li><a href="${pageContext.request.contextPath }/home.do">Home</a></li>
    <li id="nav_board"><a href="${pageContext.request.contextPath }/board/list.do">Board</a></li>
    <li id="nav_photo"><a href="${pageContext.request.contextPath }/archive/list.do">Photo</a></li>
    <li id="nav_visitor"><a href="${pageContext.request.contextPath }/visitor/visitors.do">Visitor</a></li>
    <li id="nav_chat"><a href="${pageContext.request.contextPath }/chat/chats.do">Chat</a></li>
    <li 
    	<c:if test="${id ne 'admin'}">style="display:none;"</c:if> 
    		id="navbarAdmin" 
    	<c:if test="${param.active eq 'admin' }">class="active"</c:if>>
    	<a href="${pageContext.request.contextPath }/admin/list.do">관리페이지</a>
    </li>
    <c:choose>
    	<c:when test="${empty id }">
		    <li style="margin-top:100px"><a href="${pageContext.request.contextPath }/users/signin_form.do?uri=${pageContext.request.contextPath }" class=signinfo>로그인</a></li>
		    <li><a href="${pageContext.request.contextPath }/users/signup_form.do?uri=${pageContext.request.contextPath }" class=signinfo>회원가입</a></li>    	
    		<li><a href="${pageContext.request.contextPath }/users/pwdSearchForm.do?uri=${pageContext.request.contextPath }" class=signinfo>비밀번호 찾기</a></li>
    	</c:when>
		<c:otherwise>
		    <li style="margin-top:100px">
		    	<a href="${pageContext.request.contextPath }/users/private/info.do?id=${id}" class=signinfo >
		    		<strong><span class="glyphicon glyphicon-user"></span> ${id } </strong>
		    		<span style="font-size: 20px;">님</span>
		    	</a>
		    </li>
		    <li><a href="${pageContext.request.contextPath }/users/signout.do" class=signinfo>로그아웃</a></li>		
		</c:otherwise>
    </c:choose>
</ul>
