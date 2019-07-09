<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
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
				<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/origin.gif" alt="투어팁스"></a>
			</h1>
			<div class="login">
				<a href="#">로그인</a>
				<span>|</span>
				<a href="#">회원가입</a>
			</div>
		</div>
		<nav>
			<ul>
				<li>
					<span>아시아</span>
					<ul>
						<li><a href="dest/hongkong">홍콩</a></li>
						<li><a href="dest/hongkong">홍콩</a></li>
						<li><a href="dest/hongkong">홍콩</a></li>
					</ul>
				</li>
				<li>
					<span>동남아</span>
					<ul>
						<li><a href="dest/macau">마카오</a></li>
						<li><a href="dest/macau">마카오</a></li>
						<li><a href="dest/macau">마카오</a></li>
					</ul>
				</li>
				<li>
					<span>유럽</span>
					<ul>
						<li><a href="dest/singapore">싱가포르</a></li>
					</ul>
				</li>
				<li>
					<span>미주</span>
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
	//메뉴 활성화
	$('nav').mouseenter(function() {
		$(this).addClass('on');
	});
	
	$('nav').mouseleave(function() {
		$(this).removeClass('on');
	});
});
</script>
</html>