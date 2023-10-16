package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegistServiceImpl;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
       
   private static final long serialVersionUID = 1L;

    public BoardController() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doAction(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doAction(request, response);
   }
   // .board로 끝나는 요청들은 이 controller로 들어오게 설정
   // 1. get, post로 요청 시 하나의 method로 연결 -> doAction()
   // 2. contextpath제거해서 /board/list.board 요청으로 들어오면 board_list(view)화면으로 이동할 수 있게
   protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // controller로 들어온 요청 명령어를 구분해서 처리
	   request.setCharacterEncoding("utf-8");
	   String uri = request.getRequestURI();
	   String path = request.getContextPath();
	   String command = uri.substring(path.length());
	   
	   System.out.println(command);
	   // command에 따른 동작 구현
	   
	   //서비스 객체 생성
	   IBoardService service = null;
	   
	   if(command.equals("/board/list.board")) {
		   //나중에 변경 예정. 게시글 목록 데이터 전달 작업이 현재 되어있지 않아서.
		   response.sendRedirect("board_list.jsp");
	   }else if(command.equals("/board/write.board")) {
		   //글작성 페이지(view)로 이동
		   response.sendRedirect("board_write.jsp");
	   }else if(command.equals("/board/register.board")) {
		   //서비스 객체를 생성
		   service = new RegistServiceImpl();
		   service.execute(request, response);
		   
		   //목록으로 이동
		   response.sendRedirect("list.board"); //다시 컨트롤러로 이동
	   }
	   
	   
//	   RequestDispatcher dp = request.getRequestDispatcher(); 
   }
   
}