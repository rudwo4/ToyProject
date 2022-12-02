<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="sessionId" value ="${pageContext.request.session.getAttribute('id')}"/>
<c:set var="sessionAuth" value ="${pageContext.request.session.getAttribute('auth')}"/>
<c:set var="loginId" value="${sessionId ==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/user/login' : '/user/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login/Register' : '환영합니다 '+=loginId}"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>