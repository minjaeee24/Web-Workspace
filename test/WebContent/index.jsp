<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="views/member/login.jsp" %>
</body>
</html>

<%-- 1. 아래와 같은 boardUpdateForm.jsp에서 게시글 수정하기 버튼을 눌러 성공 시 게시글 상세 페이지를 보여주는 "/update.bo" Servlet을 실행하고
실패시 "views/common/errorPage.jsp"에 "게시글 수정 실패"라는 메세지를 넣어 포워딩하는 기능을 구현하시오.
아래 form 태그에서 전달되는 값을 통해 BoardUpdateServlet에 기재해야 할 내용을 [원인]에 기술하고
BoardService의 updateBoard() 메소드와 BoardDao의 updateBoard() 메소드를 [조치내용]에 기술하시오.

request.setCharacterEncoding("UTF-8");

String bId = request.getParameter("bId");


Board b = new Board();
	b.setbId(bId);
	b.setbTitle(title);
	b.setbContent(content);
	b.setbWriter(bWriter);

int result = new BoardService().updateBoard(b);
			
if(result > 0) {
	request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다");
	response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);
	// /detail.bo는 상세보기를 해주는 서블릿인데 상세보기를 하기 위해서는 구분해주는 값인bno값을 쿼리스트링으로 넘겨줘야 한다
			
}else {
	request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
	request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);			
}


서비스
public int updateBoard(Board b) {
		
	Connection conn = getConnection();
		
	int result = new BoardDao().updateBoard(conn, b);
		
	
	if(result > 0) {
		commit(conn);
	}else {
		rollback(conn);
	}
	close(conn);
	return result;
}


DAO
public int updateBoard(Connection conn, Board b) {
	int result = 0;
	
	PreparedStatement pstmt = null;
		
	String sql = prop.getProperty("updateBoard");
		
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b.getbTitle());
		pstmt.setString(2, b.getbContent());
		pstmt.setString(3, b.getbId());
		pstmt.setString(4, b.getbWriter();
			
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}
	


<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8" import="java.util.ArrayList, model.vo.*"%>
<%
Board b = (Board) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

<div align="center">

<form action="<%=request.getContextPath()%>/update.bo" method="post">

<table>

<input type="hidden" value="<%=b.getbId()%>" name="bId">

<tr>

<td>제목</td>

<td><input type="text" name="title"

value="<%=b.getbTitle()%>"></td>

<td>작성자</td>

<td><input type="text" name="writer"

value="<%=b.getbWriter()%>" readonly></td>

</tr>

<tr>

<td>내용</td>

</tr>

<tr>

<td colspan="4"><textarea name="content" cols="60" rows="15"

style="resize: none;"><%=b.getbContent()%></textarea></td>

</tr>

</table>

<div align="center">

<button type="button" onclick="javascript:history.back();">취소</button>

<button id="submit" type="submit">수정하기</button>

</div>

</form>

</div>

</body>

</html>


아래 내용을 참조하여 로그아웃 기능을 구현하시오. 
아래의 logout.jsp를 참조하여 로그아웃 버튼 클릭시 logout을 요청할 script 구문을 [원인]에 기술하고,

전송 받은 서블릿("/logout")에서 Session을 통해 관리되고 있는 loginUser 속성을 만료시킨 뒤 index.jsp로 보내는 구문을 [조치내용]에 작성하시오.

서블릿
request.getSession().invalidate();
	
HttpSession session = request.getSession();
		
response.sendRedirect(request.getContextPath());



[logout.jsp의 내용]

<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8" import="model.vo.*"%>

<%

Member loginUser = (Member)session.getAttribute("loginUser");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

<div>

<label><%= loginUser.getName() %>님</label>

<div>

<button>정보수정</button>

<button id="logoutBtn" onclick="logout();">로그아웃</button>

</div>

</div>

</body>

</html>
<script>
	function logout() {
		location.href="<%=contextPath%>/logout";
	}
</script>

포트폴리오(어려움)2시간

웹사이트 만들기. 
초기화면 - 로그인
회원가입, 회원 수정, 회원 전용 페이지. 이클립스 사용. 이전 자료 참고 가능 


문제해결 시나리오(총 4문제)

jsp코드 주어짐. 
수정하기 버튼이 눌렀을때 수정되고 페이지 이동 기능 보드업데이트서비스,dao 이전 자료 참고 가능

로그아웃 기능. --%>