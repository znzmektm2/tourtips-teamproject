<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="innerWrap mainWrap">
		<%-- <c:if test="${sessionScope }"> --%>
		<form method="post" action="${rootPath}/join">
			<input type="hidden" name="command" value="login">
			<input type="hidden" name="returnURL" value="<%=request.getHeader("referer")%>">
			ID : <input type="text" name="userId"><br>
			PWD : <input type="password" name="userPwd"><br>
			<input type="submit" value="로그인">
		</form>
		<%-- </c:if> --%>
		<%-- <c:otherwise>
			<jsp:forward page="${pageContext.request.contextPath}" />
		 </c:otherwise> --%>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>