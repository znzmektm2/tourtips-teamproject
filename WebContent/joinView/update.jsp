<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="css/style.css">

<SCRIPT >
function checkValid() {
	var f = window.document.updateForm;
	if ( f.model_name.value == "" ) {
		alert( "아이디를 입력해 주세요." );
		f.model_name.focus();
		return false;
	}
	if ( f.price.value == "" ) {
		alert( "비밀번호를 입력해 주세요." );
		f.price.focus();
		return false;
	}
	if ( f.description.value == "" ) {
        alert( "이름을 입력해 주세요." );
        f.description.focus();
        return false;
    }
	if ( f.password.value == "" ) {
        alert( "이메일을 입력해 주세요" );
        f.password.focus();
        return false;
    }
	
    
}

</SCRIPT>

</HEAD>

<BODY>


<form name=updateForm method=post action="../join" onSubmit="return checkValid()">
    <input type="hidden" name="command" value="update" >
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>  회원정보 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userId" size="30"
		  value=<%=session.getAttribute("sessionId") %> readonly></span></b></td>
    </tr>
        <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;"><input type=password name="password" size="12"> 
            (비밀번호가 맞아야 수정이 가능합니다.)</span></b></td>
    </tr>
    <tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">이름</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="name" size="30"
		 value="${joinDto.userName}"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">이메일</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type="email" name="email"cols="30" rows="1">${joinDto.email}</span></b></td>
		
    </tr>

        <td width="450" height="20" colspan="2" align="center">
        <b><span style="font-size:9pt;">
		<input type="submit" value="수정하기"> 
		<input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="../index.jsp">메인으로 돌아가기</a>&gt;</span></div>
</BODY>
</HTML>







