<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lnb">
	<h3>${location.cityId}</h3>
	<ul>
<<<<<<< HEAD
		<li class="active"><a href="#tab0">전체</a></li>
=======
		<li class="active"><a href="${rootPath}/dest/${location.cityId}#0">전체</a></li>
>>>>>>> refs/heads/gf
		<c:forEach items="${popular}" var="popularLocation" varStatus="state">
<<<<<<< HEAD
			<li><a href="#tab${state.index}">${popularLocation.menu}</a></li>
=======
			<li><a href="${rootPath}/dest/${location.cityId}#${state.index}">${popularLocation.menu}</a></li>
>>>>>>> refs/heads/gf
		</c:forEach>
	</ul>
</div>
