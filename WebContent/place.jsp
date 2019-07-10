<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="innerWrap placeWrap">
		<%@ include file="lnb.jsp" %>
		<div class="content">
			<div class="article-title">
				<div class="title_area">
					<h4>${location.name}</h4>
					<p class="star">4.2</p>
				</div>
				<!-- 이미지 슬라이드 div -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!--페이지-->
					<ol class="carousel-indicators">
						<!-- 슬라이드 버튼 반복문으로 돌리기 -->
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<!--페이지-->
	
					<div class="carousel-inner" style="width: 100%">
						<!--슬라이드1, 슬라이드 반복문으로 돌려야 됨-->
						<div class="item active">
							<img
								src="${pageContext.request.contextPath}/img/1/IFC 55층 전망대_1.jpg" alt="">
							<div class="container"></div>
						</div>
						<!--슬라이드1-->
	
						<!--슬라이드2-->
						<div class="item">
							<img
								src="${pageContext.request.contextPath}/img/1/IFC 55층 전망대_11.jpg" alt="">
							<div class="container"></div>
						</div>
						<!--슬라이드2-->
					</div>
	
					<!--이전, 다음 버튼-->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<%-- <jsp:useBean id="pdto" class="project.model.dto.PlaceDTO"></jsp:useBean> --%>
				<div class="cnt-info">
					<ul id="cnt-linfo">
						<li><img src="${pageContext.request.contextPath}/img/icons/speechBubble.png"> ${location.localName}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/flag.png"> ${location.area}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/clock.png"> ${location.operating}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/call.png"> ${location.call}</li>
					</ul>
					<ul id="cnt-rinfo">
						<li><img src="${pageContext.request.contextPath}/img/icons/house.png"> ${location.website}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/tickets.png"> ${location.enterance}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/cursor.png"> ${location.howto}</li>
					</ul>
				</div>
				<div id="cnt-cont">${location.content}</div>
				<div class="review">
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>