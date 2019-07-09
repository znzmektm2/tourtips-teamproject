<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

\${pageContext.request.contextPath} = ${pageContext.request.contextPath}<br>

<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<link rel="stylesheet" href="${path}/css/style.css">

<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption>회원 List</caption>
	<colgroup>
		<col width="15%"/>
		<col width="20%"/>
		<col width="20%"/>
		<col width="45%"/>
	</colgroup>
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">아이디</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">비밀번호</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">이름</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">이메일</span></b></font></p>
        </td>
    </tr>
    
    <c:choose>
    <c:when test="${empty requestScope.list}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 아이디가 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.list}" var="joinDto">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
				  <span style="font-size:9pt;">
					  ${joinDto.userId}
					</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		          	${joinDto.password}</p>
		        </td>		      
		         <td bgcolor="">
		            <p align="center">
		            <span style="font-size:9pt;">
		            ${joinDto.name}
		            </span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		       ${joinDto.email}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
<div align=right>
<div align=left><span style="font-size:9pt;">&lt;<a href="index.jsp">메인으로 돌아가기</a>&gt;</span></div>













