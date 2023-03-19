package com.test.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.member.model.service.MemberService;
import com.test.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		String userId = request.getParameter("userId");
	    String userPwd = request.getParameter("userPwd");
	    
	    Member loginUser = new MemberService().loginMember(userId, userPwd);
	    
	    if(loginUser == null) {
	          request.setAttribute("errorMsg", "로그인에 실패했습니다.");
	          
	          RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
	          
	          view.forward(request, response);
	          
	      }else {  
	         HttpSession session = request.getSession();
	         
	         session.setAttribute("loginUser", loginUser);
	         session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
	         
	         response.sendRedirect(request.getContextPath());
	      }
	}
}
