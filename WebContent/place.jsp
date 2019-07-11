<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script>
$(function() {

	////////////////////////////////////////////////
	// 코멘트 보드 리스트 가져오기
	function loadBoard() {
		$.ajax({
			type : "post",
			url : "${rootPath}/CommentSelectByPlace",
			dataType : "json",
			data : {
				placeId : "${location.id}"
			},
			success : function(result) {
				var list = ''
				var count = 0
				$(result.list).each(
						function(index, item) {
							list += '<li><div><strong>' + item.userId + '</strong>'
									+ '<div class="star">' + printStar(item.rating) + '</div>'
									+ '<p>' + item.context + '</p>'
									+ '<span class="time">' + item.dateCreated + '</span></div></li>';
							count++;
						})
				$('.reviewList ul li').remove();
				$('.reviewList ul').append(list)
				
				/////// 이거 레이팅 및 숫자 변동
				$('#reviewCount').text(count);
				
				var total = (result.ratings[0]*1 + result.ratings[1]*2 + result.ratings[2]*3 + result.ratings[3]*4 + result.ratings[4]*5)/count
				if(isNaN(total)){
					total = 0;
				}
				$('#totalRating').text(total.toFixed(1));	
				$('p.star').text(total.toFixed(1))

				$('#rating1').text(result.ratings[0]);
				$('#rating2').text(result.ratings[1]);
				$('#rating3').text(result.ratings[2]);
				$('#rating4').text(result.ratings[3]);
				$('#rating5').text(result.ratings[4]);
				
				//평점 별찍기
				for(var i=0; i<Math.floor(total); i++){
					$('.star span').eq(i).addClass("on");
				}
				//평점 그래프
				for(var i=0; i<5; i++){
					var score = result.ratings[i] * 10;
					if(score >= 100){
						score = 100;
					}
					$('.graph ul li').eq(i).find(".average .average_on").css("width",score+"%");
				}
			},
			error : function(err) {
				console.log(err)
			}
		})
	} // 보드 리스트 가져오는 ajax 종료.
	
	/** 별찍기 함수 */
	function printStar(rating) {
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

	////////////////////////////////////////////////
	// 코멘트 등록하기
	$(document).on('click','#btnSubmit', function() {
		$.ajax({
			type : "post",
			url : "${rootPath}/CommentInsert",
			dataType : "json",
			data : $('#commentForm').serialize(),
			success : function(result) {
				loadBoard();		
			},
			error : function(err) {
				console.log(err)
			}
		})
	}) // 등록하기 ajax 종료
	
	//별점주기 
	$(".starInput div input").click(function() {
		var index = $(this).parent().index();
		$(".starInput div").removeClass("on");
		for(var i=0; i<=index; i++){
			$(".starInput div").eq(i).addClass("on");
		}
	});
	
	//lnb 메뉴 fixed
	var headerH = $(".headerTop").height() + $("nav").height();
	var lnbH = $(".lnb").height();
	var contentH = $(".content").height();
	var num = 100;
	setTimeout(() => {
		contentH = $(".content").height();
	}, 2000);
	var wing_movement = function (){
        sTop = $(window).scrollTop();
        if (sTop >= headerH+110 && sTop < ((headerH+contentH)-lnbH-num)){
            $(".lnb").css({'top':sTop-(headerH-20)});
        } else if(sTop >= ((headerH+contentH)-lnbH-num)){
        	$(".lnb").css({'top':((contentH)-lnbH-num)});
        } else{
        	$(".lnb").css({'top':'110px'});
        }
    };
    $(window).scroll(function(){
        wing_movement();
    });
	
	loadBoard();
});
</script>
	<div class="innerWrap placeWrap">
		<%@ include file="lnb.jsp"%>
	<div class="content">
		<div class="article-title">
			<div class="title_area">
				<h4>${location.name}</h4>
				<p class="star">0.0</p>
			</div>
			<!-- 이미지 슬라이드 div -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!--페이지-->
				<ol class="carousel-indicators">
					<!-- 슬라이드 버튼 반복문으로 돌리기 -->
					<c:forEach items="${imgNames}" var="img" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<li data-target="#myCarousel" data-slide-to="${status.index}"
									class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
				<!--페이지-->
				<div class="carousel-inner" style="width: 100%">
					<!--슬라이드1, 슬라이드 반복문으로 돌려야 됨-->
					<c:forEach items="${imgNames}" var="img" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="item active">
									<img src="${rootPath}/img/${location.id}/${img}"
										style="width: 100%" alt="">
									<div class="container"></div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
									<img src="${rootPath}/img/${location.id}/${img}"
										style="width: 100%" data-src="" alt="">
									<div class="container"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
			<div class="cnt-info">
				<ul id="cnt-linfo">

					<li><img src="${rootPath}/img/icons/speechBubble.png"
						id="icon"> ${location.localName}</li>
					<li><img src="${rootPath}/img/icons/flag.png" id="icon">
						${location.area}</li>
					<li><img src="${rootPath}/img/icons/clock.png" id="icon">
						${location.operating}</li>
					<li><img src="${rootPath}/img/icons/call.png" id="icon">
						${location.call}</li>
				</ul>
				<ul id="cnt-rinfo">
					<li><img src="${rootPath}/img/icons/house.png" id="icon">
						${location.website}</li>
					<li><img src="${rootPath}/img/icons/tickets.png" id="icon">
						${location.enterance}</li>
					<li><img src="${rootPath}/img/icons/cursor.png" id="icon">
						${location.howto}</li>
				</ul>
			</div>
			<div id="cnt-cont">${location.content}</div>
			<div class="review">
				<div class="score">
					<h5>리뷰 <span id="reviewCount"></span></h5>
					<div class="wrap">
						<div class="area">
							<p class="star_score_num"><em id="totalRating">4.2</em><span><i>/</i>5</span></p>
							<div class="star">
								<span></span><span></span><span></span><span></span><span></span>
							</div>
						</div>
						<div class="graph">
							<ul>
			                    <li>
			                        <em>1점</em>
			                        <div class="average">
			                            <span class="average_off"><span class="average_on"></span></span>
			                        </div>
			                        <i><span id="rating1"></span></i>
			                    </li>
			                    <li>
			                        <em>2점</em>
			                        <div class="average">
			                            <span class="average_off"><span class="average_on"></span></span>
			                        </div>
			                        <i><span id="rating2"></span></i>
			                    </li>
			                    <li>
			                        <em>3점</em>
			                        <div class="average">
			                            <span class="average_off"><span class="average_on"></span></span>
			                        </div>
			                        <i><span id="rating3"></span></i>
			                    </li>
			                    <li>
			                        <em>4점</em>
			                        <div class="average">
			                            <span class="average_off"><span class="average_on"></span></span>
			                        </div>
			                        <i><span id="rating4"></span></i>
			                    </li>
			                    <li>
			                        <em>5점</em>
			                        <div class="average">
			                            <span class="average_off"><span class="average_on"></span></span>
			                        </div>
			                        <i><span id="rating5"></span></i>
			                    </li>
                            </ul>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${sessionUser!= null}">
						<form id=commentForm method="post">
							<div>
								<label><span>${sessionUser.userId }</span>님의 평점 및 리뷰</label>
								<div class="starInput">
									<div><input type="radio" name="rating" value="1"><span></span></div>
									<div><input type="radio" name="rating" value="2"><span></span></div>
									<div><input type="radio" name="rating" value="3"><span></span></div>
									<div><input type="radio" name="rating" value="4"><span></span></div>
									<div><input type="radio" name="rating" value="5"><span></span></div>
								</div>
								<div class="reviewForm">
									<input type="text" name="txtComment" 
									placeholder="여행은 어떠셨나요?  경험담을 공유해주세요! 초보 여행자들에게 큰 도움이 됩니다.">
									<input id="btnSubmit" type="button" value="등록하기">
									<input type="hidden" name="userId" value="${sessionUser.userId}">
									<input type="hidden" name="placeId" value="${location.id}">
								</div>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<!--  여기 위에 텍스트 공간만큼 좀 남게 ㅇ_-->
					</c:otherwise>
				</c:choose>
				<div class="reviewList" >
					<h6>모든 리뷰</h6>
					<ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>