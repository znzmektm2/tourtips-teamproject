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
				<h2 class="title">투어팁스에서 가장<br>사랑받는 여행지에요</h2>
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
									<span class="txt">${place.text}</span>
									<span class="star">
									
										<script>
											//메인 별평점
											function star(rating) {
												var str = '';
												var graystar = 5-rating;
												for(i=0 ; i < rating ; i++){
													str += '<span class="on"></span>';
												}
												for(i=0 ; i < graystar ; i++){
													str += '<span></span>';
												}
												return str;
											}
											var idx = ${place.avg};
											$(".star").html(star(Math.round(idx)));
										</script>
									</span>
									<span class="num">${place.avg}</span>
								</span>
							</a>
						</li>
					</c:forEach>
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