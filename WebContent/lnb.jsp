<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="lnb">
		<h3>${location.cityId}</h3>
		<ul>
			<li class="active"><a href="javascript:;">전체</a></li>
			<c:forEach items="${popular}" var="popularLocation" varStatus="state">
				<li><a href="${rootPath}/dest/${location.cityId}">${popularLocation.menu}</a></li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
$(function() {
	//lnb 메뉴 활성화
	$('.lnb>ul>li').click(function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
});
</script>
</html>