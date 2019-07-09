<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="lnb">
		<h3>${location.name}</h3>
		<ul>
			<li class="active"><a href="javascript:;">전체</a></li>
			<li><a href="javascript:;">명소</a></li>
			<li><a href="javascript:;">맛집</a></li>
			<li><a href="javascript:;">쇼핑</a></li>
			<li><a href="javascript:;">숙박</a></li>
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