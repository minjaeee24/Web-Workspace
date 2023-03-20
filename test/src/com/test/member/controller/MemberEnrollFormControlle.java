package com.test.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.member.model.service.MemberService;
import com.test.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollFormControlle
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollFormControlle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollFormControlle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/member/memberEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String userId = request.getPatemater("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String rank = request.getParameter("rank");
		
		Member m = new Member(userId, userPwd, userName, phone, email, rank);
		
		// 3) 요청처리(서비스메소드 호출 결과값 돌려받기)
		int result = new MemberService().insertMember(m);
		
		// 4) 처리 결과를 가지고 사용자가 보게 될 응답화면을 지정
		if(result > 0) { // 성공 => /jspproject(url재요청방식)
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다");
			
			response.sendRedirect(request.getContextPath());
			
		}else { // 실패 => 에러페이지 포워딩
			request.setAttribute("errorMsg", "회원가입에 실패했습니다");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
