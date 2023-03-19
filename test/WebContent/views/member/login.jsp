<%@ page import="com.test.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	
</style>
</head>
<body>
	<script>
		const msg = "<%=alertMsg%>";
		
		if(msg != "null"){ 
			alert(msg);
			<%session.removeAttribute("alertMsg");%>
		}
		
	</script>

		<%
			if (loginUser == null) {
		%>
	<form id="login-form" action="<%= contextPath %>/login.me" method="post">
		<h1>로그인</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" required></td>
			</tr>
			<tr>
				<th>암 호</th>
				<td><input type="password" name="userPwd" required></td>
			</tr>
			<tr>
				<th colspan="2" id="a">
					<button type="button" onclick="submitLogin();">로그인</button>
					<button type="reset">취소</button>
					<button type="button" onclick="enrollPage();">회원가입</button>					
				</th>
			</tr>
		</table>
	</form>
	<script>
		function enrollPage(){
			location.href = "<%=contextPath%>/enrollForm.me";
		}
		
		function submitLogin() {
			$("#login-form").submit();
		}
	</script>
		<%
			} else {
		%>
		<div id="user-info">
			안녕하세요. <b></b>님 환영합니다.<br>
			<br>
			<div align="center">
				<a href="<%=contextPath%>/logout.me">로그아웃</a>
				<a href="<%=contextPath%>/myPage.me">회원정보변경</a> 
			</div>
		</div>
		<%
			}
		%>
</body>
</html>