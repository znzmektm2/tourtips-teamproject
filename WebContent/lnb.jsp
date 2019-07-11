<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lnb">
	<h3>${location.name}</h3>
	<ul>
		<li class="active"><a href="${rootPath}/dest/">전체</a></li>
		<c:forEach items="${popular}" var="popularLocation" varStatus="state">
			<li><a href="${rootPath}/dest/">${popularLocation.menu}</a></li>
		</c:forEach>
	</ul>
</div>
