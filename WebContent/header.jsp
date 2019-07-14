<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${rootPath}/img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />
<script type="text/javascript" src="${rootPath}/js/jquery-3.4.1.min.js"></script>
<title>여행관광지 사이트</title>
<script>
</script>
</head>
<body>
	<header>
		<div class="innerWrap headerTop">
			<div class="search">
				<form name="search" id="search" method="post" action="${rootPath}/SearchInput">
					<input type="text" name="keyWord" id="keyWord" />
					<button type="submit" name="search" id="search_btn" title="검색">검색</button>
				</form>
				<div id="suggest" style="display: none"></div>
			</div>
			<h1>
				<a href="${rootPath}/"><img src="${rootPath}/img/origin.gif" alt="투어팁스"></a>
			</h1>
			<div class="login">
				<c:choose>
					<c:when test="${sessionUser == null}">
						<a href="${rootPath}/login/loginForm.jsp">로그인</a>
						<span>|</span>
						<a href="${rootPath}/login/signInForm.jsp">회원가입</a>
					</c:when>
					<c:otherwise>
						<div>
							<p>${sessionUser.name}님</p>
							<a href="${rootPath}/join?command=logout">로그아웃</a>
							<span>|</span>
							<a href="${rootPath}/login/updateUser.jsp">마이페이지</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<nav>
			<ul class="gnbList">
				<li>아시아</li>
				<li>동남아</li>
				<li>유럽</li>
				<li>미주</li>
			</ul>
			<ul class="lnbList">
				<li>
					<ul>
						<li><a href="${rootPath}/dest/hongkong"><img src="${rootPath}/img/menu_icon/HONGKONG.gif" alt="">홍콩</a></li>
						<li><a href="${rootPath}/dest/macau"><img src="${rootPath}/img/menu_icon/MACAU.gif" alt="">마카오</a></li>
					</ul>
				</li>
				<li>
					<ul>
						<li><a href="${rootPath}/dest/singapore"><img src="${rootPath}/img/menu_icon/SINGAPORE.gif" alt="">싱가포르</a></li>
						<li><a href="${rootPath}/dest/bangkok"><img src="${rootPath}/img/menu_icon/BANGKOK.gif" alt="">방콕</a></li>
					</ul>
				</li>
				<li>
					<ul>
						<li><a href="${rootPath}/dest/paris"><img src="${rootPath}/img/menu_icon/PARIS.gif" alt="">파리</a></li>

					</ul>
				</li>
				<li>
					<ul>
						<li><a href="${rootPath}/dest/newyork"><img src="${rootPath}/img/menu_icon/NEWYORK.gif" alt="">뉴욕</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
<script>
$(function() {
	//상단메뉴 활성화
	$('nav').mouseenter(function() {
		$(this).addClass('on');
	});
	
	$('nav').mouseleave(function() {
		$(this).removeClass('on');
	});
});
</script>
