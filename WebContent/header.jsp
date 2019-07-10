<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />

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
		<div>
			<a href="${rootPath}/dest/hongkong"> 홍콩 </a><br> <a
				href="${rootPath}/dest/macau"> 마카오 </a><br> <a
				href="${rootPath}/dest/singapore"> 싱가포르 </a><br> <a
				href="${rootPath}/dest/bangkok"> 방콕 </a><br> <a
				href="${rootPath}/dest/hongkong/nara"> 나</a>
		</div>
	</header>
</body>
</html>