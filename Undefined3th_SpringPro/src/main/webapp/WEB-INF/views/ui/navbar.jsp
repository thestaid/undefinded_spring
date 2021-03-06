<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	//session에서 id 받아오기
	String id=(String)session.getAttribute("id");
%>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
body,
body * {
  transition: all 300ms ease-out;
  font-family: 'Jeju Gothic', serif;
}
body.light {
  background-color: white;
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
  line-height: 40px;
  font-family: 'Raleway', sans-serif;
  font-size: 40px;
  text-transform: lowercase;
  margin-top: 5px;
}
body ul.menu a:hover {
  color: white !important;
  cursor: pointer;
}
.signinfo{font-size: 25px;}
.mainContent{
	position:absolute;
	top:0%;
	left:350px;
	display: table;
	width: 100% ;
	height: 100%;
	background-color: white;
}
h3{
	font-weight:bolder;		
	margin-top:50px; 
	margin-bottom:30px;
	padding-bottom:10px;
	border-bottom: 2px solid gray; 
}
.bt-default {
  border: 1px solid black;
  color: black;
  background-color: white;
}
.bt-default:hover,
.bt-default:focus {
  border: 1px solid black;
  outline: none;
  color: white;
  background-color: black;
}	
</style>
<link href='http://fonts.googleapis.com/css?family=Raleway:200' rel='stylesheet' type='text/css'>
<ul class="menu">
    <li><a href="${pageContext.request.contextPath }/home.do">Home</a></li>
    <li id="nav_board"><a href="${pageContext.request.contextPath }/board/list.do">Study</a></li>
    <li id="nav_photo"><a href="${pageContext.request.contextPath }/photo/list.do">Photo</a></li>
    <li id="nav_Contact"><a href="${pageContext.request.contextPath }/contact.do">Contact</a></li>
    <%-- <li id="nav_chat"><a href="${pageContext.request.contextPath }/chat.do">Chat</a></li> --%>
    <li 
    	<c:if test="${id ne 'admin'}">style="display:none;"</c:if> 
    		id="navbarAdmin" 
    	<c:if test="${param.active eq 'admin' }">class="active"</c:if>>
    	<a href="${pageContext.request.contextPath }/admin/list.do" style="font-size: 20px;">관리자페이지</a>
    </li>
    <c:choose>
    	<c:when test="${empty id }">
		    <li style="margin-top:100px"><a href="${pageContext.request.contextPath }/users/signin_form.do?uri=${pageContext.request.contextPath }" class=signinfo><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp로그인</a></li>
		    <li><a href="${pageContext.request.contextPath }/users/signup_form.do?uri=${pageContext.request.contextPath }" class=signinfo><i class="fa fa-pencil-square-o" aria-hidden="true"></i >&nbsp회원가입</a></li>    	
    		<li><a href="${pageContext.request.contextPath }/users/pwdSearchForm.do?uri=${pageContext.request.contextPath }" class=signinfo><i class="fa fa-search" aria-hidden="true"></i>&nbsp비밀번호 찾기</a></li>
    	</c:when>
		<c:otherwise>
		    <li style="margin-top:100px">
		    	<a href="${pageContext.request.contextPath }/users/private/info.do?id=${id}" class=signinfo >
		    		<strong><i class="fa fa-child" aria-hidden="true"></i>&nbsp${id } </strong>
		    		<span style="font-size: 20px;">님</span>
		    	</a>
		    </li>
		    <li><a href="${pageContext.request.contextPath }/users/signout.do" class=signinfo><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp로그아웃</a></li>		
		</c:otherwise>
    </c:choose>
</ul>
