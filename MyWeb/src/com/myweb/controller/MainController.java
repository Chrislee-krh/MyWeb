package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class MainController extends HttpServlet {
       
	private static final long serialVersionUID = 1L;

    public MainController() {
        super();
    }

    /*
     *  이 생성된 서블릿으로, 다른 페이지에 접근할 수 있게 만들어 보자.
     *  Member에 navigate클릭시(member.do) /member/member.jsp로 접근할 수 있게 만든다.
     *  index.do로 접근하면, 무조건 Home으로 접근하게 설정
     *  index, member아니면,(*.do) 무조건 home
     */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); //uri는 path 포함
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		System.out.println(path);
		System.out.println(command);
		
		if(command.equals("/member.do")) {
			RequestDispatcher dp = request.getRequestDispatcher("member/member.jsp");
			dp.forward(request, response);
		}else {
			RequestDispatcher dp = request.getRequestDispatcher("index.jsp");
			dp.forward(request, response);
		}
		
		
	}
}
