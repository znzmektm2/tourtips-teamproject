<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />
<script type="text/javascript" src="${rootPath}/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="innerWrap headerTop">
			<div class="search">
				<form name="search" id="search">
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
						<p>${sessionUser.name}씨 할로~</p>
						<a href="${rootPath}/join?command=logout">로그아웃</a>
						<span>|</span>
						<a href="${rootPath}/login/updateUser.jsp">회원정보</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<nav class="on">
			<ul class="gnbList">
				<li>아시아</li>
				<li>동남아</li>
				<li>유럽</li>
				<li>미주</li>
			</ul>
			<ul class="lnbList">
				<li>
					<ul>
						<li><a href="dest/hongkong"><img src="${pageContext.request.contextPath}/img/menu_icon/HONGKONG.gif" alt="투어팁스">홍콩</a></li>
						<li><a href="dest/hongkong">홍콩</a></li>
						<li><a href="dest/hongkong">홍콩</a></li>
					</ul>
				</li>
				<li>
					<ul>
						<li><a href="dest/macau">마카오</a></li>
						<li><a href="dest/macau">마카오</a></li>
						<li><a href="dest/macau">마카오</a></li>
					</ul>
				</li>
				<li>
					<ul>
						<li><a href="dest/singapore">싱가포르</a></li>
					</ul>
				</li>
				<li>
					<ul>
						<li><a href="dest/newyork">뉴욕</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
</body>
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
</html>