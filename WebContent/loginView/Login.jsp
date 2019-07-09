<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 if(request.getProtocol().equals("HTTP/1.0")){
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 } else if(request.getProtocol().equals("HTTP/1.1")){
	 response.setHeader("Cache-Control","no-cache");
	 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

 $(function(){
	 //로그아웃버튼 클릭이벤트
		
	 $("input[type=button]").click(function(){
		 if(confirm("정말 로그아웃할래?")){
			 location.href="${path}/join?command=logout";
		 }else{
			 alert("서비스를 더 이용하세요.");
		 }
	 });
 })

</script>

</head>
<body>
<% 
  //인증여부를 체크
  if(session.getAttribute("sessionId") == null){//인증안했어..
	  %>
	  <script type="text/javascript">
	    alert("로그인하고 이용해주세요.");
	    location.href="LoginForm.html";
	  </script>
	  <% 
  }else{
	%>
	  <h3><%=session.getAttribute("sessionId") %> 님 로그인 중</h3>
		
	  <input type="button" value="로그아웃" >
	
	<%   
  }

%>
<a href="../joinView/update.jsp">회원 관리하기</a>
</body>
</html>





