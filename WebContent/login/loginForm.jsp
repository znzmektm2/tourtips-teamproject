<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="innerWrap signWrap">
		<div class="form">
			<h2>SIGN IN</h2>
			<form method="post" action="${rootPath}/join">
				<input type="hidden" name="command" value="login">
				<input type="hidden" name="returnURL" value="<%=request.getHeader("referer")%>">
				
				<div>
					<label>아이디</label>
					<div><input type="text" name="userId"></div>
				</div>
				<div>
					<label>비밀번호</label>
					<div><input type="password" name="userPwd"></div>
				</div>
				<div class="btn">
					<input class="red" type="submit" value="로그인">
				</div>
			</form>
			<p class="copy">Copyright (주)투어팁스 All right reserved.</p>
		</div>

	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>