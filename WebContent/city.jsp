<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="visualWrap">
		<div class="video">
			<video class="view player" autoplay loop muted="false">
				<source src="../img/video/hongkong.mp4" type="video/mp4">
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
				<ul>
					<li>
						<a href="#">
							<div class="thumb">
								<img src="../img/IFC 55층 전망대_1.jpg" alt="">
								<span class="cover"></span>
							</div>
							<div class="info">
								<span class="category">전망대</span>
								<strong class="title">IFC몰 55층 전망대</strong>
								<p>통유리로 바라본 전망대와 화폐박물관</p>
								<span class="star">4.2</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="thumb">
								<img src="../img/IFC 55층 전망대_1.jpg" alt="">
								<span class="cover"></span>
							</div>
							<div class="info">
								<span class="category">전망대</span>
								<strong class="title">IFC몰 55층 전망대</strong>
								<p>통유리로 바라본 전망대와 화폐박물관</p>
								<span class="star">4.2</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="thumb">
								<img src="../img/IFC 55층 전망대_1.jpg" alt="">
								<span class="cover"></span>
							</div>
							<div class="info">
								<span class="category">전망대</span>
								<strong class="title">IFC몰 55층 전망대</strong>
								<p>통유리로 바라본 전망대와 화폐박물관</p>
								<span class="star">4.2</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="thumb">
								<img src="../img/IFC 55층 전망대_1.jpg" alt="">
								<span class="cover"></span>
							</div>
							<div class="info">
								<span class="category">전망대</span>
								<strong class="title">IFC몰 55층 전망대</strong>
								<p>통유리로 바라본 전망대와 화폐박물관</p>
								<span class="star">4.2</span>
							</div>
						</a>
					</li>
				</ul>
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