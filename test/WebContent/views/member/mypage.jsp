<%@ page import="com.test.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String userPwd = loginUser.getUserPwd();
		String phone = loginUser.getPhone();
		String email = loginUser.getEmail();
		String rank = loginUser.getRank();
	%>
	<div class="outer">
		<br>
		<h2 align="center">마이페이지</h2>
		
		<form id="mypage-form" action="<%= contextPath %>/update.me" method="post">
		
		<table>
				<!-- (tr>td*3)*8 -->
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="6" required value="<%= userName %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" maxlength="12" required readonly value="<%= userId %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="userPwd" maxlength="15" required">*</td>
					<td></td>
				</tr>
				<tr>
					<td>암호 확인</td>
					<td><input type="password" maxlength="15" required>*</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="<%= email == null ? "" : email %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" placeholder="- 포함해서 입력" value="<%= phone == null ? "" : phone %>">
					<td>
					<td></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
					<% if(rank.equals("member")) { %>
						<input type="radio" name="rank" value="member" checked> 일반회원
						<input type="radio" name="rank" value="admin"> 관리자
					<% }else { %>
						<input type="radio" name="rank" value="member"> 일반회원
						<input type="radio" name="rank" value="admin" checked> 관리자
					<% } %>
					<td>
					<td></td>
				</tr>
			</table>
			
			<div>
				<button type="submit">정보변경</button>
				<button type="reset">취소</button>
			</div>
		</form>

	</div>
	
</body>
</html>