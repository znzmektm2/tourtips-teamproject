<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			$
					.ajax({
						type : "post",
						url : "${rootPath}/CommentSelectByPlace",
						dataType : "json",
						data : {
							placeId : "${location.id}"
						},
						success : function(result) {
							var table = ''
							var count = 0
							$(result.list).each(
									function(index, item) {
										table += '<tr><td>' + item.userId
												+ '</td><td>' + item.context
												+ '</td><td>'
												+ printStar(item.rating)
												+ '</td><td>'
												+ item.dateCreated
												+ '</td></tr>';
										count++;
									})
							$('tbody tr').remove();
							$('tbody').append(table)

							/////// 이거 레이팅 및 숫자 변동
							$('#reviewCount').text(count);

							var total = (result.ratings[0] * 1
									+ result.ratings[1] * 2 + result.ratings[2]
									* 3 + result.ratings[3] * 4 + result.ratings[4] * 5)
									/ count
							$('#totalRating').text(total.toFixed(1));

							$('#rating1').text(result.ratings[0]);
							$('#rating2').text(result.ratings[1]);
							$('#rating3').text(result.ratings[2]);
							$('#rating4').text(result.ratings[3]);
							$('#rating5').text(result.ratings[4]);
						},
						error : function(err) {
							console.log(err)
						}
					})
		} // 보드 리스트 가져오는 ajax 종료.

		/** 별찍기 함수 */
		function printStar(rating) {
			var str = '';
			for (i = 0; i < rating; i++) {
				str += '<img src="${rootPath}/img/ico_star_big.png" style="width:10px; height:10px">'
			}
			return str;
		}

		////////////////////////////////////////////////
		// 코멘트 등록하기
		$(document).on('click', '#btnSubmit', function() {
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

		loadBoard();
	});
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="innerWrap placeWrap">
		<%@ include file="lnb.jsp"%>
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

						<!-- 슬라이드 버튼 반복문으로 돌리기 -->
						<!-- <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li> -->
					</ol>
					<!--페이지-->

					<div class="carousel-inner" style="width: 100%">
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
						<!--슬라이드1, 슬라이드 반복문으로 돌려야 됨-->
						<%-- 						<div class="item active">
							<img src="${rootPath}/img/${location.id}/${imgNames[0]}"
								style="width: 100%" alt="First slide">
							<div class="container"></div>
						</div>
						<!--슬라이드1-->

						<!--슬라이드2-->
						<div class="item">
							<img src="${rootPath}/img/${location.id}/${imgNames[1]}"
								style="width: 100%" data-src="" alt="Second slide">
							<div class="container"></div>
						</div>
 --%>
						<!--슬라이드2-->
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
				<%-- <jsp:useBean id="pdto" class="project.model.dto.PlaceDTO"></jsp:useBean> --%>
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

				<div>
					<div>
						리뷰 : <span id="reviewCount"></span>
					</div>
					<div>
						평점 : <span id="totalRating"></span>
					</div>
					<div>
						일점 : <span id="rating1"></span>
					</div>
					<div>
						이점 : <span id="rating2"></span>
					</div>
					<div>
						삼점 : <span id="rating3"></span>
					</div>
					<div>
						사점 : <span id="rating4"></span>
					</div>
					<div>
						오점 : <span id="rating5"></span>
					</div>
				</div>

				<div class="review">
					<c:choose>
						<c:when test="${sessionUser!= null}">
							<form id=commentForm method="post">
								<div>
									<label> ${sessionUser.userId }</label> <input type="text"
										name="txtComment"> <span> <input type="radio"
										name="rating" value="1"> <input type="radio"
										name="rating" value="2"> <input type="radio"
										name="rating" value="3"> <input type="radio"
										name="rating" value="4"> <input type="radio"
										name="rating" value="5">
									</span> <input id="btnSubmit" type="button" value="등록하기"> <input
										type="hidden" name="userId" value="${sessionUser.userId}">
									<input type="hidden" name="placeId" value="${location.id}">
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<!--  여기 위에 텍스트 공간만큼 좀 남게 ㅇ_-->
						</c:otherwise>
					</c:choose>
					<div class="overflow-auto" style="height: 520px">
						<table class="table table-striped table-hover">
							<thead class="thead">
								<tr class="table-success">
									<th>닉네임</th>
									<th>내용</th>
									<th>평점</th>
									<th>작성시간</th>
								</tr>
							</thead>
							<tbody>
							<colgroup>
								<col width="10%">
								<col width="70%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>