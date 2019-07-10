<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="innerWrap signWrap">
		<div class="form">
			<h2>SIGN UP</h2>
			<form name="writeForm" method="post" action="${rootPath}/join?command=insert" onSubmit='return checkValid()'>
				<div>
					<label>아이디</label>
					<div><input type=text name="userId" maxlength=10></div>
				</div>
				<div>
					<label>비밀번호</label>
					<div><input type=password name="password" maxlength=15></div>
				</div>
				<div>
					<label>이름</label>
					<div><input type=text name="name"></div>
				</div>
				<div>
					<label>이메일</label>
					<div><input type="email" name="email"></div>
				</div>
				<div class="btn">
					<input class="gray" type=submit value=수정하기>
					<input class="red" type=reset value=다시쓰기>
				</div>
				<div>
					<input type="hidden" name="returnURL" value="<%=request.getHeader("referer")%>">
				</div>
			</form>
			<p class="copy">Copyright (주)투어팁스 All right reserved.</p>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html> 