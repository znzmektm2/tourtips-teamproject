<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<a href="#"><img src="${pageContext.request.contextPath}/img/origin.gif" alt="투어팁스"></a>
			</h1>
			<div class="login">
				<a href="#">로그인</a>
				<span>|</span>
				<a href="#">회원가입</a>
			</div>
		</div>
		<div>
			<a href="dest/hongkong"> 홍콩 </a><br>
			<a href="dest/macau"> 마카오 </a><br>
			<a href="dest/singapore"> 싱가포르 </a><br>
			<a href="dest/bangkok"> 방콕 </a><br>
			<a href="dest/hongkong/nara"> 나</a>
		</div>
	</header>
</body>
</html>