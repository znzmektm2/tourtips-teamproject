<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="visualWrap">
	<div class="video">
		<video class="view player" autoplay loop muted="false">
			<source src="../img/video/${location.cityId}.mp4" type="video/mp4">
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
			<div id="tab${state.index}">
				<h3>${popularMenus.menu}</h3>
				<ul>
					<c:forEach items="${popularMenus.popularLocations}" var="popularLocation">
					<li>
						<a href="./${location.cityId}/${popularLocation.placeId}">
							<div class="thumb">
								<img src="../img/${popularLocation.placeId}/1.jpg" alt="">
								<span class="cover"></span>
							</div>
							<div class="info">
								<span class="category">${popularLocation.category}</span>
								<strong class="title">${popularLocation.name}</strong>
								<p class="txt">${popularLocation.text}</p>
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
<script>
$(function() {
	//타이머
	function startTime() {
	    var today = new Date();
	    var h = today.getHours() + ${location.localTime};
	    var m = today.getMinutes();
	    var s = today.getSeconds();
	    h = checkTime(h);
	    m = checkTime(m);
	    s = checkTime(s);
		$('.time').text(h + ":" + m + ":" + s);
	    var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
		if(i< 0) {
			i = 24 + i;
		}
	    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
	    return i;
	}
	startTime();
	
	//lnb 메뉴 fixed
	var headerH = $(".headerTop").height() + $("nav").height();
	var lnbH = $(".lnb").height();
	var visualWrapH = $(".visualWrap").height();
	var contentH = $(".content").height();
	var num = 100;
	setTimeout(() => {
		contentH = $(".content").height();
	}, 2000);
	var wing_movement = function (){
        sTop = $(window).scrollTop();
        if (sTop >= headerH+visualWrapH+110 && sTop < ((headerH+visualWrapH+contentH)-lnbH-num)){
            $(".lnb").css({'top':sTop-(headerH+visualWrapH-20)});
        } else if(sTop >= ((headerH+visualWrapH+contentH)-lnbH-num)){
        	$(".lnb").css({'top':((contentH)-lnbH-num)});
        } else{
        	$(".lnb").css({'top':'110px'});
        }
    };
    $(window).scroll(function(){
        wing_movement();
    });
    
 	//lnb 메뉴 활성화
/* 	$('.lnb>ul>li').click(function() {
		var index = $(this).index();
		$(this).toggleClass('active').siblings().removeClass('active');
		$(".spotList>div").eq(index-1).show().siblings().hide();
		if(index == 0){
			$(".spotList>div").show();
		}
	}); 
 	
	$('.lnb>ul>li>a').attr("href", "javascript:;");*/
});
</script>
