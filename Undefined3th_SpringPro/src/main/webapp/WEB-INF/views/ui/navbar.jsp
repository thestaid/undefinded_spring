<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	//session에서 id 받아오기
	String id=(String)session.getAttribute("id");
%>
<link href='http://fonts.googleapis.com/css?family=Raleway:200' rel='stylesheet' type='text/css'>
<ul class="menu">
    <li><span>Home</span></li>
    <li><span>Board</span></li>
    <li><span>Photo</span></li>
    <li><span>Visitor</span></li>
    <li><span>Chat</span></li>
    <li style="margin-top:100px"><span>로그인</span></li>
    <li><span>회원가입</span></li>
    <li><span>님 로그인중</span></li>
    <li><span>로그아웃</span></li>
</ul>
