package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout.me")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그아웃요청 처리 => 연동되어있던 loginUser세션정보를 만료시키기(세션 무효화)
		// request.getSession().removeAttribute("loginUser");
		request.getSession().invalidate(); // 세션영역 내에 있는 데이터를 모두 날리는 함수
		
		// 응답페이지 = /jspproject
		// url재요청방식
		HttpSession session = request.getSession();
		session.setAttribute("alertMsg", "로그아웃에 성공하셨습니다");
		
		response.sendRedirect(request.getContextPath()); // /jspproject
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
