<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="outer">
		<br>
		<h2>회원 가입</h2>
		'*' 표시 항목은 필수 입력 항목입니다.
		<form id="enroll-form" action="<%= contextPath %>/enrollForm.me" method="post">
			<table>
				<!-- (tr>td*3)*8 -->
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" maxlength="6" required>*</td>
					<td></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" maxlength="12" id="userId" required>*</td>
					<td><button type="button" onclick="idCheck();">중복체크</button></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="userPwd" maxlength="15" required>*</td>
					<td></td>
				</tr>
				<tr>
					<td>암호 확인</td>
					<td><input type="password" maxlength="15" required>*</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone" placeholder="- 포함해서 입력">
					<td>
					<td></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<input type="radio" name="rank" value="member"> 일반회원
						<input type="radio" name="rank" value="admin"> 관리자
					<td>
					<td></td>
				</tr>
			</table>
			
			<div>
				<button type="submit" id="submit">확인</button>
				<button type="reset">취소</button>
			</div>
		</form>

	</div>
	<%-- <script>
		function idCheck() {
			const $userId = $("#enroll-form [name=userId]");
			
			$.ajax({
				url : "<%= contextPath %>/idCheck.me",
				data : {userId : $userId.val()},
				success : function(result) {
					if(result == 0){
						alert("이미 존재하거나 회원탈퇴한 아이디입니다");
						$userId.focus();
					}else {
						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
							$userId.attr("readonly", true);
							$("#enroll-form :submit").removeAttr("disabled");
						}else {
							$userId.val("");
							$userId.focus();
						}
					}
					
				},
				error : function() {
					console.log("아이디 중복체크 실패");
				}
			});
			
		}
	</script> --%>
	
</body>
</html>