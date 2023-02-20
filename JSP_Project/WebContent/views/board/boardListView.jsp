<%@ page import="com.kh.common.model.vo.PageInfo, java.util.ArrayList, com.kh.board.model.vo.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list-area{
		border: 1px solid white;
		text-align: center;
	}
	.list-area>tbody>tr:hover{
		background: gray;
		cursor: pointer;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
		<br>
		<h2 align="center">일반게시판</h2>
		<br>
	
		<!-- 글 등록버튼(로그인한 회원만 보이도록) -->
		<% if(loginUser != null) { %>
			<div align="right" style="width: 850px">
				<a href="<%= contextPath %>/insert.bo" class="btn btn-secondary">글작성</a>
				<br><br>
			</div>
		<% } %>
		<table class="list-area" align="center">
			<thead>
				<th width="70">글번호</th>
				<th width="70">카테고리</th>
				<th width="300">제목</th>
				<th width="100">작성자</th>
				<th width="50">조회수</th>
				<th width="100">작성일</th>
			</thead>
			<tbody>
				<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="6">조회된 리스트가 없습니다..</td>
					</tr>
				<% } else { %>
					<% for(Board b : list) { %>				
						<tr onclick="moveNotice(<%= b.getNoticeNo() %>)">
							<td><%= b.getBoardNo() %></td>
							<td><%= b.getCategory() %></td>
							<td><%= b.getBoardTitle() %></td>
							<td><%= b.getBoardWriter() %></td>
							<td><%= b.getCount() %></td>
							<td><%= b.getCreateDate() %></td>
						</tr>
					<% } %>
				<% } %>
				<!-- <tr>
					<td>14</td>
					<td>운동</td>
					<td>제목</td>
					<td>user01</td>
					<td>10033</td>
					<td>2023-02-17</td>
				</tr>
				<tr>
					<td>14</td>
					<td>운동</td>
					<td>제목</td>
					<td>user01</td>
					<td>10033</td>
					<td>2023-02-17</td>
				</tr>
				<tr>
					<td>14</td>
					<td>운동</td>
					<td>제목</td>
					<td>user01</td>
					<td>10033</td>
					<td>2023-02-17</td>
				</tr> -->
			</tbody>
		</table>

		<br><br>

		<!-- 페이징바 영역 -->

		<div align="center" class="pagin-area">
			
			<button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= 1 %>'">&lt;&lt;</button>
			<% if(currentPage != 1) { %>
			<button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'">&lt;</button>			
			<% } %>
			<% for(int i = startPage; i <= endPage; i++) { %>				
				<% if(i != currentPage) { %>
					<button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= i %>'"><%= i %></button>			
				<% } else { %>
					<button disabled><%= i %></button>
				<% } %>
			<% } %>
			
			<!-- <button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>6</button>
			<button>7</button>
			<button>8</button>
			<button>9</button>
			<button>10</button> -->
			
			<% if(currentPage != maxPage) { %>
			<button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'">&gt;</button>			
			<% } %>
			<button onclick="location.href = '<%= contextPath %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		</div>
	</div>
<script>
	$(function(){
		
		$(".list-area>tbody>tr").click(function(){
			
			// 클릭했을때 해당 공지사항의 번호를 가져올 수 있어야함
			let nno = $(this).children().eq(0).text();
			
			// get방식으로 요청시 url ? 붙여서 파라미터를 함께 전송할 수 있음
			// ? 키 = 벨류 & 키 = 벨류
			// ? 물음표 뒤의 내용들을 쿼리스트링이라고 부름
			// nno값은 클릭했을때 이동할 게시판의 글 번호
			location.href = "<%= contextPath %>/detail.bo?nno="+nno;
			
		})
		
	})
</script>

</body>
</html>