<%@ page import="com.kh.board.model.vo.*, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	Board b = (Board) request.getAttribute("b");
	Attachment at = (Attachment) request.getAttribute("at");
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer table{
		border-color: white;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">일반게시판 상세보기</h2>
		<br>
		
		<table id="detail-area" align="center" border="1">
			<tr>
				<th width="70">카테고리</th>
				<th width="70">${ b.getCategory() }</th>
				<th width="70">제목</th>
				<td width="350">${ b.getBoardTitle() }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ b.getBoardWriter() }</td>
				<th>작성일</th>
				<td>${ b.getCreateDate() }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<p style="height: 200px">${ b.getBoardContent() }</p>
				</td>
			</tr>	
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${ empty at }">
							첨부파일이 없습니다
						</c:when>
						<c:otherwise>
							<a download="${ at.getOriginName() }" href="${ contextPath }/${ at.getFilePath() }+${ at.getChangeName() }">${ at.getOriginName() }</a>
						</c:otherwise>
					</c:choose>
					<%-- <% if(at == null) { %>
						첨부파일이 없습니다
					<% } else { %>
						<!-- href='/jspproject/resources/board_upfiles/2022xxxx.jpg' -->
						<a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath()+at.getChangeName() %>"><%= at.getOriginName() %></a>
					<% } %>	 --%>
				</td>
			</tr>
		</table>

		<br>
		
		<div align="center">
			<a href="${ contextPath }/list.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>
			
			<!-- 로그인한 사용자가 해당 게시글의 작성자인 경우 -->
			<%-- <c:choose>
				<c:when test="${ !empty loginUser && loginUser.userId eq b.boardWriter }">
					<c:url var="query" value="update.bo">
						<c:param name="bno" value="${ b.getBoardNo() }"/>
					</c:url>
					<a href="${ contextPath }/${ query }" class="btn btn-warning btn-sm">수정하기</a>
					<button onclick="deleteBoard();" class="btn btn-danger btn-sm">삭제하기</button>
				</c:when>
			</c:choose> --%>
			<% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
				<a href="<%= contextPath %>/update.bo?bno=<%= b.getBoardNo() %>" class="btn btn-warning btn-sm">수정하기</a>
				<button onclick="deleteBoard();" class="btn btn-danger btn-sm">삭제하기</button>
			<% } %>
		</div>
		<script>
			function deleteBoard() {
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				}
				location.href = "<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>";
			}
		</script>
		<br>
		<!-- 댓글기능 화면구현만 해두기. 요 아래는 작업 X -->
		
		<div id="reply-area">
			<table border="1" align="center">
				<thead>
					<% if(loginUser != null) { %>
						<!-- 로그인이 되어있을 경우 -->
						<tr>
							<th>댓글작성</th>
							<td>
								<textarea id="replyContent" rows="3" cols="50" style="resize:none;"></textarea>
							</td>
							<td><button onclick="insertReply();">댓글등록</button>
						</tr>
					<% }else { %>
						<tr>
							<th>댓글작성</th>
							<td>
								<textarea id="replyContent" rows="3" cols="50" style="resize:none;" readonly>로그인 후 이용이 가능한 서비스입니다.</textarea>
							</td>
							<td><button disabled">댓글등록</button>
						</tr>
					<% } %>
				</thead>
			<tbody>
				<% for(Reply r : list) { %>
					<tr>
						<td><%= r.getReplyWriter() %></td>
						<td><%= r.getReplyContent() %></td>
						<td><%= r.getCreateDate() %></td>
					</tr>
				<% } %>
			</tbody>
			</table>
		</div>
		
	</div>

	<script>
		$(function() {
			setInterval(selectReplyList, 1000);
		});
		function insertReply() {
			$.ajax({
				url : "<%= contextPath %>/rinsert.bo",
				data : {
					content : $("#replyContent").val(),
					bno : "<%= b.getBoardNo() %>"
				},
				success : function(result) {
					
					if(result > 0) {
					// 댓글등록 성공시 result = 1
						alert("작성 성공");
						// 새 댓글목록 불러오는 함수 호출
						selectReplyList();
						// 댓글내용 비워주기
						$("#replyContent").val("");
					}else {
					// 실패시 result = 0
						alert("댓글작성에 실패했습니다.");
					}
				},
				error : function() {
					console.log("댓글작성실패");
				}
				
			});
		}
		
		function selectReplyList() {
			$.ajax({
				url : "<%= contextPath %>/rlist.bo",
				data : {bno : "<%= b.getBoardNo() %>"},
				success : function(list) {
					
					//서버로부터 전달받은 리스트를 반복문을 통해 댓글목록으로 변환 < xml참고
					let result = "";
					for(let i of list) {
						result += "<tr>"
									+"<td>"+ i.replyWriter +"</td>"
									+"<td>"+ i.replyContent +"</td>"
									+"<td>"+ i.createDate +"</td>"
								+ "</tr>";
					}
					$("#reply-area tbody").html(result);
				},
				error : function() {
					console.log("게시글 목록조회 실패");
				}
			});
		}
	</script>


</body>
</html>