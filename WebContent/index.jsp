<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<title>여행관광지 사이트</title>
<script>
$(function(){
	 //로그아웃버튼 클릭이벤트
	
	 $("input[type=button]").click(function(){
		 if(confirm("정말 로그아웃할래?")){
			 location.href="../join?command=logout";
		 }else{
			 alert("서비스를 더 이용하세요.");
		 }
	 });
})
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="innerWrap mainWrap">
	<%
  //인증여부를 체크
  if(session.getAttribute("sessionId") == null){//인증안했어..
	  %>
	  <a href="loginView/LoginForm.html">로그인 하기</a><br>
	  
	  <span style="font-size:9pt;">&lt;<a href="joinView/write.html">회원가입하기</a>&gt;</span></div>
	  <% 
  }else{
	%>
	<h3 align="center">
	 <%=session.getAttribute("sessionId")%> 님 로그인 중<br>
	<a href="join">회원 내역 보기</a><br>
	  <input type="button" value="로그아웃" >
	</h3>
	<%   
  }

%>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>