<%@ page language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta property="og:title" content="성균관 경전소리 보존회">
<meta property="og:description" content="경전소리를 배우고 보존하는 학당">
<meta property="og:url" content="https://kjsori.co.kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/asset/kjsori.css">
<script src="/asset/axios.js"></script>
<script src="/asset/util.js"></script>
<script src="/asset/ckeditor5/ckeditor.js"></script>
<script src="/asset/ckeditor5/translations/ko.js"></script>
<title>성균관 경전소리 보존회</title>
</head>

<body>
	<header>
		<div class="wrap">
			<nav id="unb">
	            <c:if test="${empty userId}">
	                <a href="login.jsp">로그인</a>
	                <a href="join.jsp">회원가입</a>
	            </c:if>
	            <c:if test="${not empty userId}">
	            <a href="/logout">로그아웃</a>
	            <a href="/mypage">나의정보</a>
	            </c:if>
	            <a href="/info">고객센터</a>
			</nav>
			<div class="row">
				<h1><a href="index.jsp">성균관 경전소리 보존회</a></h1>
				<nav id="gnb">
					<a href="about.jsp">기관소개</a>
					<a href="reading.jsp">경전성독</a>
					<a href="local.jsp">지역보존회</a>
					<a href="activity.jsp">활동사진</a>
					<a href="notice.jsp">공지사항</a>
					<a href="ask.jsp">문의하기</a>
				</nav>
			</div>
		</div>
	</header>