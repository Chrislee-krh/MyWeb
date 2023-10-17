package com.myweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.board.service.ContentServiceImpl;
import com.myweb.board.service.DeleteServiceImpl;
import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegistServiceImpl;
import com.myweb.board.service.UpdateServiceImpl;


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
		   //게시글 목록 데이터 전달 작업 필요
		   service = new GetListServiceImpl();
		   service.execute(request, response);
		   
		   // GetListServiceImpl로 전달 받은 request 강제 저장된 list를 forward처리해야함
		   RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
		   dp.forward(request, response);
		   
//		   response.sendRedirect("list.board");
	   }else if(command.equals("/board/write.board")) {
		   //글작성 페이지(view)로 이동
		   response.sendRedirect("write.board");
	   }else if(command.equals("/board/register.board")) {
		   //서비스 객체를 생성
		   service = new RegistServiceImpl();
		   service.execute(request, response);
		   //목록으로 이동
		   response.sendRedirect("list.board"); //다시 컨트롤러로 이동
	   }else if(command.equals("/board/content.board")) {
		   service = new ContentServiceImpl();
		   service.execute(request, response);
		   RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
		   dp.forward(request, response);
	   }else if(command.equals("/board/modify.board")) {
		   service = new ContentServiceImpl();
		   service.execute(request, response);
		   RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
		   dp.forward(request, response);
	   }else if(command.equals("/board/update.board")) {
		   // form으로 정보를 받고, UpdateServiceImpl
		   /*
		    * 1. UpdateServiceImpl을 생성
		    * 2. 서비스 영역에서 num,title,content를 받아서 update()메서드 실행(dao)
		    * 3. DAO에서 update() 생성, sql update구문을 사용, 데이터 수정
		    * 4. 페이지 이름들이 상세보기인 화면으로 연결(content.board)
		    * 	(주의 사항: 필요한 값을 전달)
		    *   String sql = "update board set title =? content=? where id= ?";
		    */
		   service = new UpdateServiceImpl();
		   service.execute(request, response);
		   response.sendRedirect("content.board?num=" + request.getParameter("num"));
		   
	   }else if(command.equals("/board/delete.board")) {
		   /*
		    * 1. DeleteServiceImpl을 생성
		    * 2. 서비스 영역에서 num을 받아서 delete()로 전달
		    * 3. 페이지 이동을 목록으로 이동(board_list.jsp)
		    */
		   service = new DeleteServiceImpl();
		   service.execute(request, response);

//		   request.removeAttribute("num");
//		   request.removeAttribute("title");
//		   request.removeAttribute("content");
		   response.sendRedirect("list.board");
		   
	   }
 
   }
}