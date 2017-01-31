<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%
	//수정하기 위해 ajax로 수정폼의 기존의 content값을 전송하기 위한 jsp페이지
	String content=(String)request.getAttribute("content");
%>
<%=content %>