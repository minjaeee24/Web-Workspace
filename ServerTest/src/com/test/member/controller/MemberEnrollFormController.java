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
 * Servlet implementation class MemberEnrollFormController
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollFormController() {
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
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String rank = request.getParameter("rank");
		
		Member m = new Member(userId, userPwd, userName, phone, email, rank);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다");
			
			response.sendRedirect(request.getContextPath());
			
		}else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
