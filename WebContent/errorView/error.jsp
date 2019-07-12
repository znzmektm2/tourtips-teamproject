<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/style.css">
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="innerWrap errorWrap">
		<h2 class="whoops">WHOOPS!</h2>
		<h2>죄송합니다. 문제가 발생하였습니다.</h2>
		<p class="txt">요청하신 페이지의 주소가 잘못 입력 되었거나,<br>변경 혹은 삭제가 되어 찾을 수 없습니다.<br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		<p>${requestScope.errorMsg}</p>
		<a href="${rootPath}/index.jsp"> 메인으로 돌아가기</a>
		<a href="javascript:history.back()">뒤로가기</a>
		<p class="copy">Copyright (주)투어팁스 All right reserved.</p>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>