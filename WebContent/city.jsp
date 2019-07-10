<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="visualWrap">
		<div class="video">
			<video class="view player" autoplay loop muted="false">
				<source src="../img/video/${location.id}.mp4" type="video/mp4">
			</video>
		</div>
		<div class="textWrap">
			<h2>${location.name}</h2>
			<p><span class="time">15:15:32</span> 시차 <span>${location.localTime}</span>시간</p>
			<ul>
				<li>
					<dl>
						<dt>여행 최적기</dt>
						<dd>${location.bestSeason}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>전압</dt>
						<dd>${location.voltage}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>비자</dt>
						<dd>${location.visaStatus}</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	<div class="innerWrap subWrap">
		<%@ include file="lnb.jsp" %>
		<div class="content">
			<section class="spotList">
				<c:forEach items="${popular}" var="popularMenus" varStatus="state">
				<div>
					<h3>${popularMenus.menu}</h3>
					<ul>
						<c:forEach items="${popularMenus.popularLocations}" var="popularLocation">
						<li>
							<a href="./${location.id}/${popularLocation.placeId}">
								<div class="thumb">
									<img src="../img/IFC 55층 전망대_1.jpg" alt="">
									<span class="cover"></span>
								</div>
								<div class="info">
									<span class="category">${popularLocation.category}</span>
									<strong class="title">${popularLocation.name}</strong>
									<p class="txt">${popularLocation.text}</p>
									<span class="star">4.2</span>
								</div>
							</a>
						</li> 
						</c:forEach>
					</ul>
				</div>
				</c:forEach>
			</section>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
  </body>
<script>
$(function() {
	//타이머
	function startTime() {
	    var today = new Date();
	    var h = today.getHours();
	    var m = today.getMinutes();
	    var s = today.getSeconds();
	    h = checkTime(h);
	    m = checkTime(m);
	    s = checkTime(s);
		$('.time').text(h + ":" + m + ":" + s);
	    var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
	    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
	    return i;
	}
	startTime();
});
</script>
</html>