<%@page import="project.model.dto.PlaceDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Map<String, PlaceDTO> map = (Map<String, PlaceDTO>) application.getAttribute("PlaceAll");
	request.setAttribute("location", map.get("1"));

	System.out.println("ddd = " + request.getAttribute("location"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 테스트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$.ajax({
			type : "post",
			url : "../CommentSelectByPlace",
			dataType : "json",
			data : {
				placeId : "${requestScope.location.id}"
			},
			success : function(result) {
				var table = '';
				$(result).each(
						function(index, item) {
							table += '<tr><td>' + item.userId + '</td><td>'
									+ item.context + '</td><td>' + item.rating
									+ '</td><td>' + item.dateCreated
									+ '</td></tr>'
						})
				$('tbody tr:gt(0)').remove();
				$('tbody').append(table)
			},
			error : function(err) {
				console.log(err)
			}
		}) // 보드 리스트 가져오는 ajax 종료.
	});
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="innerWrap mainWrap">
		<div class="container mt-5">
			<c:choose>
				<c:when test="${sessionUser!= null}">
					<form action="board" method="post" class="mt-2">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="txtComment"
								placeholder="여기에 글쓰면 된다.">
							<div class="input-group-append">
								<input type="submit" name="btnSubmit"
									class="btn btn-outline-secondary">
							</div>
						</div>
					</form>
				</c:when>
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
						<col width="20%">
					</colgroup>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>