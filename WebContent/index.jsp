<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행관광지 사이트</title>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<section class="mainBg">
		<div class="in">
			<strong>믿을 수 있는 여행 팁, <em>투어팁스</em></strong>
			<p>어디로 떠날까요?</p>
		</div>
		<span class="cover"></span>
		<ul>
			<li><img src="${rootPath}/img/main_bg/bg_main_01.jpg" alt=""></li>
			<li><img src="${rootPath}/img/main_bg/bg_main_02.jpg" alt=""></li>
			<li><img src="${rootPath}/img/main_bg/bg_main_03.jpg" alt=""></li>
			<li><img src="${rootPath}/img/main_bg/bg_main_04.jpg" alt=""></li>
		</ul>
	</section>
	<div class="innerWrap mainWrap">
		<section class="spotList best">
			<div>
				<span>TOURTIPS BEST DEALS</span>
				<h2 class="title">투어팁스에서<br>추천하는 여행지에요</h2>
				<ul>
					<c:forEach items="${placeRatings}" var="place" begin="0" end="7">
						<li>
							<a href="${rootPath}/dest/${place.cityId}/${place.placeId}">
								<span class="thumb">
									<span class="loc">${place.cityId}</span>
									<img src="${rootPath}/img/${place.placeId}/1.jpg" alt="">
									<span class="cover"></span>
								</span>
								<span class="info">
									<span class="category">${place.category}</span>
									<strong class="title">${place.name}</strong>
									<p class="txt">${place.text}</p>
									<p>${place.avg}</p>
								</span>
							</a>
						</li>
					</c:forEach>
					<%-- <li>
						<a href="${rootPath}/dest/HONGKONG/1">
							<span class="thumb">
								<span class="loc">HONGKONG</span>
								<img src="${rootPath}/img/1/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">전망대</span>
								<strong class="title">IFC몰 55층 전망대</strong>
								<p class="txt">통유리로 바라본 전망대와 화폐박물관</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/SINGAPORE/23">
							<span class="thumb">
							<span class="loc">SINGAPORE</span>
								<img src="${rootPath}/img/23/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">가볼만한 거리</span>
								<strong class="title">클락 키</strong>
								<p class="txt">야경과 젊음의 인기 명소</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/PARIS/22">
							<span class="thumb">
								<span class="loc">PARIS</span>
								<img src="${rootPath}/img/22/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">박물관/미술관</span>
								<strong class="title">루브르박물관</strong>
								<p class="txt">전 세계 3대 박물관</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/NEWYORK/83">
							<span class="thumb">
								<span class="loc">NEWYORK</span>
								<img src="${rootPath}/img/83/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">가볼만한 거리</span>
								<strong class="title">타임스 스퀘어</strong>
								<p class="txt">세계의 교차로라 불리는 뉴욕의 중심지</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/MACAU/12">
							<span class="thumb">
								<span class="loc">MACAU</span>
								<img src="${rootPath}/img/12/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">랜드마크</span>
								<strong class="title">세나도 광장</strong>
								<p class="txt">마카오 여행의 시작을 알리는 관문.</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/BANGKOK/60">
							<span class="thumb">
								<span class="loc">BANGKOK</span>
								<img src="${rootPath}/img/60/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">랜드마크</span>
								<strong class="title">아시아 티크</strong>
								<p class="txt">방콕의 떠오르는 HOT 플레이스</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/PARIS/24">
							<span class="thumb">
								<span class="loc">PARIS</span>
								<img src="${rootPath}/img/24/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">랜드마크</span>
								<strong class="title">개선문</strong>
								<p class="txt">나폴레옹의 승리 상징</p>
							</span>
						</a>
					</li>
					<li>
						<a href="${rootPath}/dest/NEWYORK/85">
							<span class="thumb">
								<span class="loc">NEWYORK</span>
								<img src="${rootPath}/img/85/1.jpg" alt="">
								<span class="cover"></span>
							</span>
							<span class="info">
								<span class="category">가볼만한 거리</span>
								<strong class="title">브로드웨이</strong>
								<p class="txt">세계 뮤지컬이 한 자리에 모인 뉴욕의 랜드마크 거리</p>
							</span>
						</a>
					</li> --%>
				</ul>
			</div>
		</section>
	</div>
	<%@ include file="/footer.jsp" %>
</body>
<script>
	$(function() {
		//메인 이미지 로테이션
		$(".mainBg ul li").eq(0).addClass("active");
		var count=1;
		setInterval(() => {
			$(".mainBg ul li").eq(count).addClass("active").siblings().removeClass("active");
			count++;
			if(count == $(".mainBg ul li").length) count=0;
		}, 7000);
	});
</script>
</html>