package com.test.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.model.service.MemberService;
import com.test.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 2) 요청시 전달값들을 뽑아서 변수 및 객체에 담기
		String userId = request.getParameter("userId"); // 필수값
		String userName = request.getParameter("userName"); // 필수값
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone"); // 빈 문자열이 전달될 수도 있다
		String email = request.getParameter("email"); // 빈 문자열이 전달될 수도 있다
		String rank = request.getParameter("rank");
		
		Member m = new Member(userId, userName, userPwd, phone, email, rank);
		
		// 3) 회원가입 요청 처리
		Member updateMem = new MemberService().updateMember(m);
		
		// 4) 돌려받은 처리 결과를 가지고 사용자가 보게 될 응답 뷰를 지정
		if(updateMem == null) { // 실패
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}else { // 성공
			// 변경된 회원정보를 session영역에 다시 한번 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem); // 같은 키값은 존재할 수 없음.(덮어씌우기 가능)
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다");
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}
		
	}

}