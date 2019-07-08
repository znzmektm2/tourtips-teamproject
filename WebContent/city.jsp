<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="visualWrap">
		<div class="wrapper">
			<h2>${location.name}</h2>
			<p>15:15:32 시차 <span>-1</span>시간</p>
			<ul>
				<li>
					<dl>
						<dt>여행 최적기</dt>
						<dd>9-1월</dd>
						<dd>덥지않은</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>전압</dt>
						<dd>220V</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>비자</dt>
						<dd>무비자</dd>
						<dd>90일 무비자</dd>
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
</html>