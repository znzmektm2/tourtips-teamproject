<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkValid() {
		var f = window.document.writeForm;
		if (f.userId.value == "") {
			alert("아이디를 입력해 주세요.");
			f.userId.focus();
			return false;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			f.password.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("이름을 입력해 주세요.");
			f.name.focus();
			return false;
		}
		if (f.email.value == "") {
			alert("이메일을 입력해 주세요.");
			f.email.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<form name="writeForm" method="post" action="${rootPath}/join?command=insert" onSubmit='return checkValid()'>
		<c:if test="${sessionUser != null}">
			<%
				response.sendRedirect(application.getContextPath());
			%>
		</c:if>
		<div>
			<b> 회원 가입 </b>
		</div>
		<div>
			<label>아이디</label><input type=text name="userId" maxlength=10><br>
			<label>비밀번호</label><input type=password name="password" maxlength=15><br>
			<label>이름</label><input type=text name="name"><br>
			<label>이메일</label><input type="email" name="email"><br>
			<input type=submit value=수정하기><input type=reset value=다시쓰기>
			<input type="hidden" name="returnURL" value="<%=request.getHeader("referer")%>">
		</div>
	</form>
	<%@ include file="/footer.jsp"%>
</body>
</html> 