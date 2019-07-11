<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lnb">
	<h3>${location.cityId}</h3>
	<ul>
		<li class="active"><a href="javascript:;">전체</a></li>
		<c:forEach items="${popular}" var="popularLocation" varStatus="state">
			<li><a href="${rootPath}/desc/">${popularLocation.menu}</a></li>
		</c:forEach>
	</ul>
</div>
<script>
$(function() {
	//lnb 메뉴 활성화
	$('.lnb>ul>li').click(function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
});
</script>
