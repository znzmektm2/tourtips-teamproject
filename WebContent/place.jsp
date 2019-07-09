<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 이미지 슬라이드 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<style type="text/css">
.lm {float: left; display: inline-block; width: 200px; padding-top: 30px;}
.lm > ul{display: block; margin: 0 0 20px;}
.li > li{display: block; width: 182px; min-height: 36px;}
.cnt-info{overflow:hidden;}
.cnt-info>ul{float: left; display: inline-block; width: 50%; padding-right: 40px; box-sizing: border-box;}
#cnt-linfo{display: inline-block; list-style: none;}
#cnt-linfo>li{margin: 10px 0px 0px; padding: 0px 0px 18px}
#cnt-rinfo{display: inline-block; list-style: none; left:700px;}
#cnt-rinfo>li{margin: 10px 0px 0px; padding: 0px 0px 18px}
.carousel{width:500px;}
.carousel-inner{size: 70%; width: 300px}
.star{display: inline-block; float: left;} 
.title_area{display: inline-block; }
#cnt-cont{display: inline-block;}
#icon{width: 4%}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="innerWrap subWrap">
		<%@ include file="lnb.jsp" %>
		<div class="content">
			<div class="article-title">
				<p class="category">전망대</p>
				<div class="title_area">
					<h1>${location.name}</h1>
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
								src="${pageContext.request.contextPath}/img/1/IFC 55층 전망대_1.jpg"
								style="width: 100%" alt="First slide">
							<div class="container"></div>
						</div>
						<!--슬라이드1-->
	
						<!--슬라이드2-->
						<div class="item">
							<img
								src="${pageContext.request.contextPath}/img/1/IFC 55층 전망대_11.jpg"
								style="width: 100%" data-src="" alt="Second slide">
							<div class="container"></div>
						</div>
						<!--슬라이드2-->
					</div>
	
					<!--이전, 다음 버튼-->
					<a style="width: 50%" class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a style="width: 50%" class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<%-- <jsp:useBean id="pdto" class="project.model.dto.PlaceDTO"></jsp:useBean> --%>
				<div class="cnt-info">
					<ul id="cnt-linfo">
						<li><img src="${pageContext.request.contextPath}/img/icons/speechBubble.png" id="icon"> ${location.localName}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/flag.png" id="icon"> ${location.area}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/clock.png" id="icon"> ${location.operating}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/call.png" id="icon"> ${location.call}</li>
					</ul>
					<ul id="cnt-rinfo">
						<li><img src="${pageContext.request.contextPath}/img/icons/house.png" id="icon"> ${location.website}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/tickets.png" id="icon"> ${location.enterance}</li>
						<li><img src="${pageContext.request.contextPath}/img/icons/cursor.png" id="icon"> ${location.howto}</li>
					</ul>
				</div>
				<div id="cnt-cont">${location.content}</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>